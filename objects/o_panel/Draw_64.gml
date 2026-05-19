draw_set_font(fnt_monitor);

var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();
var posX = gui_w / 2;
var posY = gui_h / 2;

// --- AJUSTE ESSENCIAL: DESENHA O PUZZLE DO CARTÃO SE ESTIVER ABERTO ---
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

    // Texto de feedback do minigame do cartão
    draw_set_font(-1); // Usa a fonte padrão para o aviso do cartão
    draw_set_halign(fa_center);

}

// --- SEU CÓDIGO ORIGINAL DO MONITOR (MANTIDO INTACTO) ---
// --- SEU CÓDIGO DO MONITOR COM EFEITO RETRO ---
draw_set_font(fnt_monitor);

if (escala > 0.01) { 
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
    }
}