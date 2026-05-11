if (instance_exists(o_player)) {
	var _margin = 10;
	for (var i = 0; i < inventory_slots; i++) {
		draw_sprite_ext(s_inventory, o_player.equiped == i ? i+inventory_slots : i, 40 + (slot_width + _margin)*i, 40, scale, scale, 0, c_white, 1);
	}

	array_foreach(
		o_player.inventory, 
		function (_element, _index) {
			var _margin = 10;
			if (_element != -1)
				draw_sprite_ext(_index == inventory_slots - 1 ? s_dice : s_items, _element, 40 + (slot_width) / 2 + (slot_width + _margin)*_index, 40 + slot_height / 2, scale, scale, 0, c_white, 1);
		});
}

draw_set_font(font_silabas);
draw_text(view_width - 20, 40, global.levels[global.level_index - 1][1][0])


if (instance_exists(o_player) && instance_exists(global.alvo_atual)) {
    
    // Direção da seta para a sílaba
    var _dir = point_direction(o_player.x, o_player.y, global.alvo_atual.x, global.alvo_atual.y);

    // Desenha a seta usando seta_gui_x e seta_gui_y (a posição com delay)
    // Se a seta ficar torta, mude o "_dir" para "_dir - 90" ou "_dir - 50"
    draw_sprite_ext(s_arrow_indicator, 0, seta_gui_x, seta_gui_y, 1, 1, _dir - 90, c_white, 1);

    // Debug opcional
    draw_text(20, 20, "Indicador Ativo");
}
