if (!is_playing) {
	audio_play_sound_on(emit, sound_, 1, 1, .5);
	is_playing = true;	
}

part_emitter_region(ps, 0, x, x + sprite_width, y + 20, y-20+sprite_height, ps_shape_ellipse, ps_distr_linear)

audio_emitter_position(emit, x, y, 0);

if (instance_exists(o_player)) {
	if (o_player.equiped != danger_item_id
		&& my_indicator = noone) {
		my_indicator = instance_create_layer(x + sprite_width / 2, y + sprite_height / 2, "Blocks", o_danger_item_indicator, { image_index: danger_item_id });
		show_debug_message("Nao tem");
		show_debug_message(my_indicator);
	} else if (o_player.equiped == danger_item_id) {
		if (my_indicator) {
			instance_destroy(my_indicator);
			my_indicator = noone;
			show_debug_message("Tem o item");
			show_debug_message(my_indicator);
		}
	}
}

