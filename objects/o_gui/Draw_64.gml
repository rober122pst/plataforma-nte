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

// --- 2. TEXTO DAS SÍLABAS (Seu código original) ---
draw_set_font(font_silabas);
draw_text(view_width - 20, 40, global.levels[global.level_index - 1][1][0])


// --- 3. DESENHO DA SETA INDICADORA + DISTÂNCIA ---
if (instance_exists(o_player) && instance_exists(global.alvo_atual)) {
    
    // Identifica o estado da fase para colorir a interface
    var _fase_pronta_para_sair = false;
    if (instance_exists(o_game) && !o_game.has_syllable) {
        _fase_pronta_para_sair = true;
    }

    // Define a cor dinamicamente com base nas prioridades
    var _cor_atual = c_white;
    if (_fase_pronta_para_sair) {
        _cor_atual = c_red;  // 🔴 Vermelho para saída
    } else if (o_player.inventory[4] != -1) {
        _cor_atual = c_lime; // 🟢 Verde para máquina
    }

    // Direção da seta apontando para o alvo atual
    var _dir = point_direction(o_player.x, o_player.y, global.alvo_atual.x, global.alvo_atual.y);

    // Aplica o alpha do Fade
    draw_set_alpha(seta_alpha);

    // Desenha a seta com a cor e rotação corretas
    draw_sprite_ext(s_arrow_indicator, 0, seta_gui_x, seta_gui_y, 1, 1, _dir - 90, _cor_atual, seta_alpha);

    // --- TEXTO DA DISTÂNCIA ABAIXO DA SETA ---
    if (variable_instance_exists(id, "distancia_texto") && distancia_texto != "") {
        draw_set_font(font_silabas); 
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        
        // Sombra preta de fundo para dar leitura
        draw_set_color(c_black);
        draw_text(seta_gui_x + 1, seta_gui_y + 25 + 1, distancia_texto);
        
        // Desenha o texto principal aplicando a cor dinâmica correspondente
        draw_set_color(_cor_atual);
        draw_text(seta_gui_x, seta_gui_y + 25, distancia_texto);
    }

    // Reseta as configurações de desenho para não bugar o resto do jogo
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);

    // Debug na tela
    draw_text(20, 20, "Indicador Ativo");
}