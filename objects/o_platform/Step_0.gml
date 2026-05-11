if (instance_exists(o_player)) {
	if (o_player.bbox_bottom <= bbox_bottom) {
		sprite_index = s_platform;
	} else {
		sprite_index = -1;	
	}
}