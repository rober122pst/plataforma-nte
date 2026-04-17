button_func = function(type) {
	switch (type) {
		case "play":
			room_goto(rm_fone);	
			layer_set_visible("ui_menu", false);
			break;
		case "config":
			show_message("Configurações");
			break;
		case "quit":
			game_end();
			break;
	}
}

switch (type) {
		case "play":
			sprite_index = s_btn_play;
			break;
		case "config":
			sprite_index = s_btn_config;
			break;
		case "quit":
			sprite_index = s_btn_quit;
			break;
	}