function camera_zoom(zoom_target = 0.5) {
	o_camera.zoom_target = zoom_target;
}

function set_in_danger_zone(in_danger, danger_zone = noone, input_dir = 0, equiped = -1) {
	if (danger_zone != noone) {
		var danger_center_x = danger_zone.x + (danger_zone.sprite_width)/2;
		
		if (!audio_is_playing(snd_heartbeats)) {
			heartbeats = audio_play_sound(snd_heartbeats, 5, 1);	
			audio_sound_gain(heartbeats, 0, 0);
			audio_sound_gain(heartbeats, 1, 1000);
		}
		show_debug_message(heartbeats)
		if (in_danger) {
			var danger_dir = sign(danger_center_x - o_player.x); 
	
			if (input_dir == danger_dir && blocked_dir == 0) {
				camera_zoom(0.5);
				spd *= 0.9;
				if (heartbeats)
					audio_sound_gain(heartbeats, 1, 1000);
				image_speed = spd / 2;
			} 

			else if (input_dir == -danger_dir) {
				camera_zoom(1);
				blocked_dir = danger_dir;
				spd *= 1.1;
				image_speed = spd / 2;
				
				if (spd >= 2) spd = 2;
			} 
			else {
				blocked_dir = danger_dir;
				spd = 0.05;
			}
		}
		
		if (abs(hspd) <= 0.3 && input_dir == 0) {
			hspd = 0;
			image_speed = 1;
			sprites.idle = sprites.cry;
		}
	} else {
		image_speed = 1;
		camera_zoom(1);
		if (heartbeats)
			audio_sound_gain(heartbeats, 0, 500);
		blocked_dir = 0;
		spd = 2;
		sprites.idle = s_player_idle;
	}
}

function jump(danger_zone) {
	vspd += grav;
	
	vspd = min(vspd, max_vspd);

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
}