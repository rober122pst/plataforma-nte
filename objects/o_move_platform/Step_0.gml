if (limit > init) {
	var temp = init;
	init = limit;
	limit = temp;
}

if (instance_exists(o_player)) {
	if (o_player.bbox_bottom <= bbox_bottom) {
		sprite_index = s_platform;
		mask_index = s_move_platform;
	} else {
		sprite_index = -1;
		mask_index = -1;
	}
}

var collision = place_meeting(x, y-1, o_player);

switch (angle) {
	case "vertical":
		velv = dir * velc;
		if (y <= limit - 17 && dir == -1) {
			velv = 0;
			wait_timer++;
			if (wait_timer == game_get_speed(gamespeed_fps)) {
				dir = 1;
				wait_timer = 0;
			}
		} else if (y >= init && dir == 1) {
			velv = 0;
			wait_timer++;
			if (wait_timer == game_get_speed(gamespeed_fps)) {
				dir = -1;
				wait_timer = 0;
			}	
		}
		
		if (collision) {
			with (o_player) {
				y += other.velv;
			}
		}
		break;
	case "horizontal":
		velh = dir * velc;
		
		if (x <= limit && dir == -1) {
			velh = 0;
			wait_timer++;
			if (wait_timer == game_get_speed(gamespeed_fps)) {
				dir = 1;
				wait_timer = 0;
			}
		} else if (x >= init && dir == 1) {
			velh = 0;
			wait_timer++;
			if (wait_timer == game_get_speed(gamespeed_fps)) {
				dir = -1;
				wait_timer = 0;
			}	
		}
		
		if (collision) {
			with (o_player) {
				x += other.velh;
			}
		}
		break;
	default:
		dir = 0;
		break;
}

y += velv;
x += velh;
