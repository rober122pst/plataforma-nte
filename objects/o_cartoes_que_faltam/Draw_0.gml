// 🎬 MATEMÁTICA DA ANIMAÇÃO:
var _escala_final = 0.25 * balao_escala; 

// Só desenha se o balão tiver algum tamanho visível
if (_escala_final > 0) {
    
    // ------------------------------------------------------------
    // 🎈 DESENHA O BALÃO DE FALA PIXEL ART (s_bal_o_de_fala)
    // ------------------------------------------------------------
    if (sprite_exists(s_bal_o_de_fala)) {
        var _escala_balao_art = 1 * balao_escala; 
        // Desenha o balão na nova posição à direita
        draw_sprite_ext(s_bal_o_de_fala, image_index, x, y, _escala_balao_art, _escala_balao_art, 0, c_white, 1);
    }

    // ------------------------------------------------------------
    // 📝 SELEÇÃO DO TEXTO INTELIGENTE (Fase + Comparação de Altura)
    // ------------------------------------------------------------
    var _texto = "essa maquina \nprecisa de \n1 cartão"; 
    var _nome_da_fase = room_get_name(room);

    if (_nome_da_fase == "o_botas") {
        _texto = "essa maquina \nprecisa de \n2 cartões";
    }
    else if (_nome_da_fase == "rm_capas" || _nome_da_fase == "rm_capa") {
        if (instance_exists(maquina_alvo)) {
            if (instance_number(o_panel) >= 2) {
                var _maquina_mais_alta = instance_find(o_panel, 0);
                for (var i = 1; i < instance_number(o_panel); i++) {
                    var _inst = instance_find(o_panel, i);
                    if (_inst.y < _maquina_mais_alta.y) {
                        _maquina_mais_alta = _inst;
                    }
                }
                if (maquina_alvo == _maquina_mais_alta) {
                    _texto = "essa maquina \nprecisa de \n2 cartões";
                } else {
                    _texto = "essa maquina \nprecisa de \n1 cartão";
                }
            } else {
                _texto = "essa maquina \nprecisa de \n2 cartões";
            }
        }
    }

    // Configurações de fonte e alinhamento (Mudado para a Esquerda!)
    draw_set_font(fonte_texto);
    draw_set_halign(fa_left); // Alinha o texto à esquerda para encaixar melhor do lado direito
    draw_set_valign(fa_middle);
    
    // Margemzinha para o texto não grudar na ponta do balão
    var _texto_x_ajustado = x - 15; 
    
    // 1. Sombra preta
  //  draw_set_color(c_black);
   // draw_text_transformed(_texto_x_ajustado + 1, y + 1, _texto, _escala_final, _escala_final, 0);

    // 2. Texto principal em amarelo
    draw_set_color(c_black);
    draw_text_transformed(_texto_x_ajustado, y, _texto, _escala_final, _escala_final, 0);
}

// Reseta padrões do GameMaker
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);