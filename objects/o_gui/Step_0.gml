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
var _proximo_alvo = instance_nearest(o_player.x, o_player.y, o_collectibles);


if (instance_exists(_proximo_alvo)) {
    global.alvo_atual = _proximo_alvo;
} else {
    global.alvo_atual = noone;
}