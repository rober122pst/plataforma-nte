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
// 🛑 1. CHECA SE A FASE ESTÁ PRONTA PARA ACABAR (Sem sílabas no mapa)
var _fase_pronta_para_sair = false;
if (instance_exists(o_game)) {
    if (!o_game.has_syllable) {
        _fase_pronta_para_sair = true;
    }
}

// 🎯 2. DEFINIÇÃO LOGICA DO ALVO INTELIGENTE
if (_fase_pronta_para_sair) {
    // 🚪 CASO A: Fase limpa! Aponta direto para o objeto de saída
   var _saida = instance_nearest(o_player.x, o_player.y, o_final);
    if (instance_exists(_saida)) {
        global.alvo_atual = _saida;
    } else {
        global.alvo_atual = noone;
    }
} else {
    // 💳 CASO B: Ainda tem jogo. Checa se o player está segurando o cartão
    var _tem_cartao = false;
    if (instance_exists(o_player)) {
        if (o_player.inventory[4] != -1) {
            _tem_cartao = true;
        }
    }

    if (_tem_cartao) {
        // Aponta para a máquina mais próxima
        var _maquina_proxima = instance_nearest(o_player.x, o_player.y, o_botas); 
        if (instance_exists(_maquina_proxima)) {
            global.alvo_atual = _maquina_proxima;
        } else {
            global.alvo_atual = noone;
        }
    } else {
        // CASO C: Não tem cartão, busca a sílaba mais próxima de forma otimizada
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
        ds_priority_destroy(_lista_alvos); // Evita vazamento de memória
    }
}

// 📏 3. CALCULA A DISTÂNCIA ATÉ O ALVO DEFINIDO
if (instance_exists(o_player) && instance_exists(global.alvo_atual)) {
    distancia_texto = string(floor(point_distance(o_player.x, o_player.y, global.alvo_atual.x, global.alvo_atual.y) / 16)) + "m";
} else {
    distancia_texto = "";
}

// 🎬 4. ANIMACAO DE TRANSPARÊNCIA (Fade-in / Fade-out)
if (instance_exists(global.alvo_atual)) {
    if (seta_alpha < 1) seta_alpha += 0.05;
} else {
    if (seta_alpha > 0) seta_alpha -= 0.05;
}

// 📍 5. MOVIMENTAÇÃO E ÓRBITA DA SETA NA GUI SEGUINDO O PLAYER
if (instance_exists(o_player) && instance_exists(global.alvo_atual)) {
    var camera = view_camera[0];
    var p_gui_x = (o_player.x - camera_get_view_x(camera)) * (display_get_gui_width() / camera_get_view_width(camera));
    var p_gui_y = (o_player.y - camera_get_view_y(camera)) * (display_get_gui_height() / camera_get_view_height(camera));

	var t_gui_x = (global.alvo_atual.x - camera_get_view_x(camera)) * (display_get_gui_width() / camera_get_view_width(camera));
    var t_gui_y = (global.alvo_atual.y - camera_get_view_y(camera)) * (display_get_gui_height() / camera_get_view_height(camera));

	var dir = point_direction(p_gui_x, p_gui_y, t_gui_x, t_gui_y);
	var dist = point_distance(p_gui_x, p_gui_y, t_gui_x, t_gui_y);

    var dist_horizontal = dist/4; 
    var dist_vertical   = dist/4;  

    
    var alvo_x = p_gui_x + lengthdir_x(dist_horizontal, dir);
    var alvo_y = p_gui_y + lengthdir_y(dist_vertical, dir);

    seta_gui_x = lerp(seta_gui_x, alvo_x, 0.15);
    seta_gui_y = lerp(seta_gui_y, alvo_y, 0.15);
}