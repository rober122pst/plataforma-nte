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


// --- 3. DESENHO DA SETA INDICADORA + DISTÂNCIA (Atualizado!) ---
if (instance_exists(o_player) && instance_exists(global.alvo_atual)) {
    
    // Direção da seta para a sílaba ou máquina
    var _dir = point_direction(o_player.x, o_player.y, global.alvo_atual.x, global.alvo_atual.y);

    // Aplica o alpha suave para a seta surgir/sumir sem corte seco
    draw_set_alpha(seta_alpha);

    // Desenha a seta usando a posição com delay (seta_gui_x e seta_gui_y)
    draw_sprite_ext(s_arrow_indicator, 0, seta_gui_x, seta_gui_y, 1, 1, _dir - 90, c_white, seta_alpha);

    // --- TEXTO DA DISTÂNCIA ABAIXO DA SETA ---
    if (variable_instance_exists(id, "distancia_texto") && distancia_texto != "") {
        draw_set_font(font_silabas); // Usa a mesma fonte de texto do seu jogo
        draw_set_halign(fa_center);
        draw_set_valign(fa_top);
        
        // Sombra preta para dar leitura em qualquer cenário de fundo
        draw_set_color(c_black);
        draw_text(seta_gui_x + 1, seta_gui_y + 25 + 1, distancia_texto);
        
        // Cor do texto: Fica verde (c_lime) se o jogador tiver o cartão e estiver indo pra máquina
        if (o_player.inventory[4] != -1) {
            draw_set_color(c_lime); 
        } else {
            draw_set_color(c_white); // Branco comum para coletáveis normais
        }
        
        // Desenha a distância 25 pixels abaixo do centro da seta
        draw_text(seta_gui_x, seta_gui_y + 25, distancia_texto);
    }

    // Reseta as configurações de desenho padrão para não quebrar outros textos do jogo
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);

    // Debug opcional (deixei ativo caso você queira monitorar)
    draw_text(20, 20, "Indicador Ativo");
}