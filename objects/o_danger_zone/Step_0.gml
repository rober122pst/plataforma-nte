if (sound_) {
	audio_emitter_position(emit, x + sprite_width / 2, y + sprite_height, 0);
}

if (instance_exists(o_player)) {
	if (o_player.equiped != danger_item_id
		&& my_indicator = noone) {
		my_indicator = instance_create_layer(x + sprite_width / 2, y + sprite_height / 2, "Blocks", o_danger_item_indicator, { image_index: danger_item_id });
	} else if (o_player.equiped == danger_item_id) {
		if (my_indicator) {
			instance_destroy(my_indicator);
			my_indicator = noone;
		}
	}
}

