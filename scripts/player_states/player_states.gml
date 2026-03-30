player_freeze = function() { exit; }

player_move = function() {
	var dir = INPUT_RIGHT - INPUT_LEFT;
	if (dir == blocked_dir) dir = 0;
	var danger_zone = instance_place(x, y, o_danger_zone);

	if (danger_zone) {
		if (equiped != danger_zone.danger_item_id) set_in_danger_zone(true, danger_zone, dir);	
	}
	else {
		if (heartbeats && audio_sound_get_gain(heartbeats) == 0)
			audio_stop_sound(heartbeats);
		set_in_danger_zone(false);
	}
	
	hspd = spd*dir;
	
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
		sprite_index = sprites.walk;
		image_xscale = dir;
	} else {
		sprite_index = sprites.idle;	
	}
}

player_win = function() {
	x++;
	sprite_index = sprites.walk;
	
	if (x > room_width) {
		global.level_completed = true;
	}
}