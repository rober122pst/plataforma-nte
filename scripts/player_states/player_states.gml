player_freeze = function() { exit; }

player_move = function() {
	var dir = INPUT_RIGHT - INPUT_LEFT;
	if (dir == blocked_dir) dir = 0;
	var danger_zone = instance_place(x, y, o_danger_zone);

	if (danger_zone) {
		if (equiped != danger_zone.danger_item_id) set_in_danger_zone(true, danger_zone, dir);	
	}
	else set_in_danger_zone(false);
	
	hspd = spd*dir;
	
	// Pulo
	vspd += grav;
	if (vspd >= max_vspd) vspd = max_vspd;

	var on_ground = place_meeting(x, y+1, o_collider);

	if (on_ground) {
		coyote_timer = coyote_timer_frames;
	} else {
		coyote_timer--;
	}

	if (INPUT_JUMP) {
		buffered_timer = buffered_timer_frames;
	} else {
		buffered_timer--;
	}

	if (buffered_timer > 0 && coyote_timer > 0 
		&& (!danger_zone || o_player.equiped == danger_zone.danger_item_id)) {
		vspd = jump_force;
		buffered_timer = 0;
		coyote_timer = 0;
		audio_play_sound(Jumping_Sound, 0, 0);
	}
	
	if (place_meeting(x+hspd, y, o_collider)) {
		while (!place_meeting(x+sign(hspd), y, o_collider)) x += sign(hspd);
		hspd = 0;
	}
	
	x += hspd;

	var _collider = o_collider;
	var vertical_collision = place_meeting(x, y+vspd, _collider);

	if (vertical_collision) {
		while (!place_meeting(x, y+sign(vspd), o_collider)) {
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
		layer_sequence_create("Sequences", camera_get_view_x(view_camera[0]) + 360 / 2, camera_get_view_y(view_camera[0]) + 202 / 2, Fade_In);
		
	}
}