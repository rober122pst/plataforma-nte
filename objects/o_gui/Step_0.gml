if (!instance_exists(o_game)) return;

if (global.level_completed) {
	h_box_up += 15;
	if (h_box_up >= middle) h_box_up = middle;
	h_box_down -= 15;
	if (h_box_down <= middle) h_box_down = middle;
	
	if (h_box_down <= middle && h_box_up >= middle) {	
		if (global.level_index == 4) {
			instance_destroy(o_settings_obj);
			instance_destroy(o_player)
			room_goto(Menu);
			exit;
		}
		room_goto(global.levels[global.level_index][0]);
		global.level_index++;
		global.level_completed = false;
	}
}

if (room_start) {
	h_box_up -= 15;
	if (h_box_up <= 0) h_box_up = 0;
	h_box_down += 15;
	if (h_box_down >= view_height) h_box_down = view_height;
	
	if (h_box_down >= view_height && h_box_up <= 0) {
		room_start = false;
	}
}
// 1. Lógica aprimorada para definir o alvo mais próximo e viável
var _raio_maximo = 800; // Define a distância máxima em pixels que um alvo pode estar para ser detectado
var _lista_alvos = ds_priority_create();

// Procura por todos os coletáveis e os organiza pela distância do player
with (o_collectibles) {
    var _dist = point_distance(o_player.x, o_player.y, x, y);
    if (_dist <= _raio_maximo) {
        ds_priority_add(_lista_alvos, id, _dist);
    }
}

// Pega o coletável que está realmente mais perto dentro do limite de detecção
if (!ds_priority_empty(_lista_alvos)) {
    global.alvo_atual = ds_priority_find_min(_lista_alvos);
} else {
    // Se não tiver nenhum coletável no raio próximo, busca o mais perto do mapa inteiro como último recurso
    var _proximo_geral = instance_nearest(o_player.x, o_player.y, o_collectibles);
    if (instance_exists(_proximo_geral)) {
        global.alvo_atual = _proximo_geral;
    } else {
        global.alvo_atual = noone;
    }
}
ds_priority_destroy(_lista_alvos); // Limpa a lista da memória

// 1. Lógica Inteligente de Alvo (Muda se tiver o cartão ou não)
var _tem_cartao = false;

// Checa se o player existe e se ele tem o cartão no slot 4 do inventário
if (instance_exists(o_player)) {
    if (o_player.inventory[4] != -1) {
        _tem_cartao = true;
    }
}

if (_tem_cartao) {
    // 🌟 SE TIVER O CARTÃO: Aponta para a máquina (ou objeto interativo) mais próxima
    // Substitua "o_maquina" pelo nome exato do objeto da sua máquina no seu projeto!
    var _maquina_proxima = instance_nearest(o_player.x, o_player.y, o_botas); 
    
    if (instance_exists(_maquina_proxima)) {
        global.alvo_atual = _maquina_proxima;
    } else {
        global.alvo_atual = noone;
    }
} else {
    // 🌟 SE NÃO TIVER O CARTÃO: Continua apontando para os coletáveis próximos
    var _raio_maximo = 800;
    var _lista_alvos = ds_priority_create();

    with (o_collectibles) {
        var _dist = point_distance(o_player.x, o_player.y, x, y);
        if (_dist <= _raio_maximo) {
            ds_priority_add(_lista_alvos, id, _dist);
        }
    }

    if (!ds_priority_empty(_lista_alvos)) {
        global.alvo_atual = ds_priority_find_min(_lista_alvos);
    } else {
        var _proximo_geral = instance_nearest(o_player.x, o_player.y, o_collectibles);
        if (instance_exists(_proximo_geral)) {
            global.alvo_atual = _proximo_geral;
        } else {
            global.alvo_atual = noone;
        }
    }
    ds_priority_destroy(_lista_alvos);
}

// CALCULA A DISTÂNCIA REAL (Para usar no Draw)
if (instance_exists(o_player) && instance_exists(global.alvo_atual)) {
    // Calcula a distância em pixels e converte em uma escala fictícia (ex: dividindo por 16 metros)
    distancia_texto = string(floor(point_distance(o_player.x, o_player.y, global.alvo_atual.x, global.alvo_atual.y) / 16)) + "m";
} else {
    distancia_texto = "";
}

// 2. Animação de Transparência (Fade-in / Fade-out)
if (instance_exists(global.alvo_atual)) {
    if (seta_alpha < 1) seta_alpha += 0.05;
} else {
    if (seta_alpha > 0) seta_alpha -= 0.05;
}

// 3. Posição da seta na GUI seguindo o player
if (instance_exists(o_player)) {
    var camera = view_camera[0];
    var p_gui_x = (o_player.x - camera_get_view_x(camera)) * (display_get_gui_width() / camera_get_view_width(camera));
    var p_gui_y = (o_player.y - camera_get_view_y(camera)) * (display_get_gui_height() / camera_get_view_height(camera));

    var dist_horizontal = -140; 
    var dist_vertical   = 50;  
    var altura_offset   = -70; 

    angulo_orbita += 0.2; 
    
    var alvo_x = p_gui_x + lengthdir_x(dist_horizontal, angulo_orbita);
    var alvo_y = p_gui_y + lengthdir_y(dist_vertical, angulo_orbita) + altura_offset;

    seta_gui_x = lerp(seta_gui_x, alvo_x, 0.15);
    seta_gui_y = lerp(seta_gui_y, alvo_y, 0.15);
}