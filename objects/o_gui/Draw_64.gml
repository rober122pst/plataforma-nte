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
draw_text(view_width - 40, 40, global.levels[global.level_index - 1][1][0])