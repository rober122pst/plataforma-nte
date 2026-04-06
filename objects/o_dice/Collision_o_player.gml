var dice = o_player.inventory[array_length(o_player.inventory) - 1];

if (dice != -1 && can_destroy) {
	instance_create_layer(x, y_initial, "Entities", o_dice, { image_index: dice });
}

if (can_destroy) {
	instance_destroy();
	audio_play_sound(collectible_audio_original, 0, 0, 1, .55);
	effect_create_layer("Effects", ef_ring, x, y, .02, c_white);
	o_player.inventory[array_length(o_player.inventory) - 1] = image_index;
}



