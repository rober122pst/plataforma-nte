if (!instance_exists(o_collectibles)) {
	switch (room) {
		case rm_fone:
			if (!array_contains(o_player.inventory, 0)) {
				array_insert(o_player.inventory, 0, 0);
				o_player.equiped = 0;
				audio_play_sound(Som_quando_liberar_o_item, 0, 0);
			}
			break;
		case rm_oculos:
			if (!array_contains(o_player.inventory, 1)) {
				array_insert(o_player.inventory, 1, 1);
				o_player.equiped = 1;
				audio_play_sound(Som_quando_liberar_o_item, 0, 0);
			}
			break;
	}
}
