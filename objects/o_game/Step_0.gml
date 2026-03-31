if (!instance_exists(o_collectibles)) {
	array_foreach(
		global.levels,
		function (_element, _index) {
			if (room == _element) {
				if (!array_contains(o_player.inventory, _index)) {
					array_insert(o_player.inventory, _index, _index);
					o_player.equiped = _index;
					audio_play_sound(Som_quando_liberar_o_item, 0, 0);
				}	
			}
		}
	);
}
