if (!instance_exists(o_collectibles)) {
	switch (room) {
		case Caminho_Escola:
			if (!array_contains(o_player.inventory, 0)) {
				array_push(o_player.inventory, 0);
				show_debug_message("Fone adicionado");
			}
			break;
	}
}