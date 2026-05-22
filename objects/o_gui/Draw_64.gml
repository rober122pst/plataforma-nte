// --- 1. DESENHO DO INVENTÁRIO (Seu código original) ---
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

// --- 3. DESENHO DA SETA INDICADORA + DISTÂNCIA ---
if (instance_exists(o_player) && instance_exists(global.alvo_atual)) {
    
    // Identifica o estado da fase para colorir a interface
    var _fase_pronta_para_sair = false;
    if (instance_exists(o_game) && !o_game.has_syllable) {
        _fase_pronta_para_sair = true;
    }

    // Define a cor dinamicamente com base nas prioridades
    var _cor_atual = 0;
    if (_fase_pronta_para_sair) {
        _cor_atual = 2;  // 🔴 Vermelho para saída
    } else if (o_player.inventory[4] != -1) {
        _cor_atual = 1; // 🟢 Verde para máquina
    }

    // Direção da seta apontando para o alvo atual
    var _dir = point_direction(o_player.x, o_player.y, global.alvo_atual.x, global.alvo_atual.y);

    // Aplica o alpha do Fade
    draw_set_alpha(seta_alpha);

    // Desenha a seta com a cor e rotação corretas
    draw_sprite_ext(s_arrow_indicator, _cor_atual, seta_gui_x, seta_gui_y, scale, scale, _dir - 90, c_white, seta_alpha);
}