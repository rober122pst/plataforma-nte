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
// 1. Lógica para definir o alvo (Sílaba/Coletável)
var _proximo_alvo = instance_nearest(o_player.x, o_player.y, o_collectibles);

if (instance_exists(_proximo_alvo)) {
    global.alvo_atual = _proximo_alvo;
} else {
    global.alvo_atual = noone;
}

// 2. Animação de Transparência (Fade-in / Fade-out)
if (instance_exists(global.alvo_atual)) {
    if (seta_alpha < 1) seta_alpha += 1.5; // Surge suavemente
} else {
    if (seta_alpha > 0) seta_alpha -= 1.5; // Some suavemente
}

// 3. Calcular a posição da seta na GUI (seguindo o player com delay)
if (instance_exists(o_player)) {
    var camera = view_camera[0];
    var p_gui_x = (o_player.x - camera_get_view_x(camera)) * (display_get_gui_width() / camera_get_view_width(camera));
    var p_gui_y = (o_player.y - camera_get_view_y(camera)) * (display_get_gui_height() / camera_get_view_height(camera));

    // Configurações de distanciamento (Valores positivos padrão)
    var dist_horizontal = -140; 
    var dist_vertical   = 50;  
    var altura_offset   = -70; //distancia da cabeça

    angulo_orbita += 0.2; // Velocidade da flutuação
    
    var alvo_x = p_gui_x + lengthdir_x(dist_horizontal, angulo_orbita);
    var alvo_y = p_gui_y + lengthdir_y(dist_vertical, angulo_orbita) + altura_offset;

    // Aplica o atraso suave (Lerp)
    seta_gui_x = lerp(seta_gui_x, alvo_x, 0.15);
    seta_gui_y = lerp(seta_gui_y, alvo_y, 0.15);
}