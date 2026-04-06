player_freeze = function() { exit; }

player_move = function() {
	var dir = INPUT_RIGHT - INPUT_LEFT;
	if (dir == blocked_dir) dir = 0;
	var danger_zone = instance_place(x, y, o_danger_zone);

	if (danger_zone) {
		if (equiped != danger_zone.danger_item_id) set_in_danger_zone(true, danger_zone, dir);
		else {
			set_in_danger_zone(false);
		}
	}
	else {
		set_in_danger_zone(false);
	}
	
	if (heartbeats && audio_sound_get_gain(heartbeats) == 0)
		audio_stop_sound(heartbeats);
	
	var acc = .2;
	if (dir != 0) hspd = lerp(hspd, spd * dir, 0.15);
	else hspd = hspd > 0 ? max(0, hspd - acc) : min(0, hspd + acc);
	
	var _wind_area = instance_place(x, y, o_wind_zone);
	if (_wind_area) {	
		show_debug_message(_wind_area.angle)
		switch (_wind_area.angle) {
			case 0:
				if (hspd < 0) {
					if (dir == 0)
						hspd = ceil(lerp(hspd, 0, 0.15) * 100) / 100;
				}
	
				hspd += .65;
		
				if (dir == 0 && hspd > 4) {
					hspd = 4;
				}
				break;
			case 180:
				if (hspd > 0) {
					if (dir == 0)
						hspd = floor(lerp(hspd, 0, 0.15) * 100) / 100;
				}
	
				hspd -= .65;
		
				if (dir == 0 && hspd < -4) {
					hspd = -4;
				}
				break;
			case 275:
				if (vspd > 0) {
				    vspd = lerp(vspd, 0, 0.05);
				}
	
				vspd -= .65;
				coyote_timer = 0;
		
				vspd = max(vspd, -8);
				break;
		}	
	}
	
	jump(danger_zone);
	
	var _collider = o_collider;
	
	if (place_meeting(x+hspd, y, _collider)) {
		while (!place_meeting(x+sign(hspd), y, _collider)) x += sign(hspd);
		hspd = 0;
	}
	
	x += hspd;	
	
	var vertical_collision = place_meeting(x, y+vspd, _collider);

	if (vertical_collision) {
		while (!place_meeting(x, y+sign(vspd), _collider)) {
			y += sign(vspd);
		}
		vspd = 0;
	}
	
	y += vspd;
	
	if (hspd != 0) {
		if (place_meeting(x, y+1, _collider)) {
			if (equiped > -1) {
				sprite_index = sprites[$ global.items_id[equiped]].walk;
			} else {
				sprite_index = sprites.walk;	
			}
		}
		if (dir != 0) image_xscale = dir;
	} else {
		if (equiped > -1) {
			sprite_index = (danger_zone) ? sprites[$ global.items_id[equiped]].cry : sprites[$ global.items_id[equiped]].idle;	
		} else {
			sprite_index = (danger_zone) ? sprites.cry : sprites.idle;	
		}
	}
}

player_win = function() {
	x++;
	if (equiped > -1) {
		sprite_index = sprites[$ global.items_id[equiped]].walk;
	} else {
		sprite_index = sprites.walk;	
	}
	
	if (x > room_width) {
		global.level_completed = true;
	}
}