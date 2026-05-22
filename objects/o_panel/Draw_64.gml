draw_set_font(fnt_monitor);

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();
var posX = gui_w / 2;
var posY = gui_h / 2;

// --- 🌟 INTERAÇÃO 1: DESENHA O PUZZLE DO CARTÃO SE ESTIVER ABERTO ---
if (puzzle_cartao_aberto && !maquina_ativada) {
    // Escurece o fundo do jogo
    draw_set_color(c_black);
    draw_set_alpha(0.8);
    draw_rectangle(0, 0, gui_w, gui_h, false);
    draw_set_alpha(1);

    // Desenha a maquina centralizada
    draw_sprite_ext(s_machine, 0, posX, posY, 7, 7, 0, c_white, 1); 

    // Desenha a mão segurando o cartão na posição do arrasto vertical
    draw_sprite_ext(s_mao, 0, cartao_x, cartao_y, 7, 7, 0, c_white, 1);

  // ================================================================
    // 🖱️ TUTORIAL DO MOUSE ATUALIZADO (FONTE CORRETA E SEM ERRO DE ACENTO)
    // ================================================================
    // Posiciona o elemento bem ajustado no canto direito, sem colidir com a caixa
    var _tuto_x = gui_w - 300; 
    var _tuto_y = (gui_h / 2) - 120; 
    
    // Desenha o GIF do mouse calculando as frames em tempo real para animar sozinho!
    if (sprite_exists(s_tutorial_mouse)) {
        // Pega o total de frames do seu GIF importado
        var _total_frames = sprite_get_number(s_tutorial_mouse);
        
        // Faz o GameMaker passar as frames automaticamente baseado no tempo do jogo
        // O número 100 controla a velocidade. Se achar muito rápido, mude para 150. Se achar lento, mude para 50.
        var _frame_atual = (current_time / 100) % _total_frames;
        
        draw_sprite_ext(s_tutorial_mouse, _frame_atual, _tuto_x, _tuto_y, 4, 4, 0, c_white, 1);
    }
    
    // Aplica a sua fonte correta!
    draw_set_font(font_sila); 
    draw_set_halign(fa_center);
    draw_set_valign(fa_top);
    
    // Frase sem acentos para evitar que a fonte pixel art desenhe quadrados bugados
    var _frase_tutorial = "Segure o botao esquerdo do mouse encima da mao e arraste-o para cima";
    var _texto_y = _tuto_y + 150; 
    
    // Espaço horizontal amplo para as palavras respirarem
    var _largura_maxima = 260; 
    var _espacamento_linhas = 24; 
    
    // 1. Sombra preta de fundo
    draw_set_color(c_black);
    draw_text_ext(_tuto_x + 2, _texto_y + 2, _frase_tutorial, _espacamento_linhas, _largura_maxima); 
    
    // 2. Texto principal amarelo destacado
    draw_set_color(c_yellow);
    draw_text_ext(_tuto_x, _texto_y, _frase_tutorial, _espacamento_linhas, _largura_maxima);
    
    // Reseta as configurações padrão do GameMaker
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
}

// --- 🌟 INTERAÇÃO 2: SEU CÓDIGO ORIGINAL DO MONITOR COM EFEITO RETRO ---
// Só roda se o puzzle do cartão NÃO estiver ativo, evitando que as duas telas se sobreponham
else if (escala > 0.01) { 
    // Desenha o sprite usando a escala animada
    draw_sprite_ext(s_monitor, 0, posX, posY, escala, escala, 0, c_white, 1);
    
    // Só desenha o texto e o efeito se ele estiver quase no tamanho total
    if (escala > 0.8) {
        
        // 1. EFEITO SCANLINES (Linhas horizontais na tela)
        var w = sprite_get_width(s_monitor) * escala;
        var h = sprite_get_height(s_monitor) * escala;
        var start_x = posX - w/2;
        var start_y = posY - h/2;
        
        draw_set_color(c_black);
        draw_set_alpha(0.15); // Bem sutil para não esconder o texto
        for (var i = 0; i < h; i += 4) { // Desenha uma linha a cada 4 pixels
            draw_line(start_x, start_y + i, start_x + w, start_y + i);
        }
        draw_set_alpha(1); // Reseta a transparência
        
        // Configurações de alinhamento
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        
        // 2. EFEITO DE GLOW / SOMBRA (Desenha o texto verde escuro esfumaçado atrás)
        draw_set_color(c_green);
        draw_set_alpha(0.5);
        draw_text(posX + 2, posY - 18, pergunta_texto + " = ?");
        draw_text(posX + 2, posY + 22, input_texto);
        draw_set_alpha(1); // Reseta a transparência
        
        // 3. TEXTO PRINCIPAL BRILHANTE (Como tela de terminal)
        draw_set_color(c_lime); 
        draw_text(posX, posY - 20, pergunta_texto + " = ?");
        
        draw_set_color(c_yellow); 
        draw_text(posX, posY + 20, input_texto);
        
        // Reseta o alinhamento para não bugar outras partes do jogo
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_color(c_white);
    }
}