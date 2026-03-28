function camera_zoom(zoom_target = 0.5) {
	o_camera.zoom_target = zoom_target;
}

function set_in_danger_zone(in_danger, danger_zone = noone, input_dir = 0) {
	if (danger_zone != noone) {
		var danger_center_x = danger_zone.x + (danger_zone.sprite_width)/2;

		if (in_danger) {
			var danger_dir = sign(danger_center_x - o_player.x); 
	
			if (input_dir == danger_dir && blocked_dir == 0) {
				camera_zoom(0.5);
				spd *= 0.9;
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
		} else {
			sprites.idle = s_player_idle;	
		}
	} else {
		image_speed = 1;
		camera_zoom(1);
		blocked_dir = 0;
		spd = 2;	
	}
}