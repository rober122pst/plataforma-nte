draw_self();

var symbols = ["+", "-", "x", "÷"];

// Configurações de texto para os símbolos e valores
draw_set_font(fnt_platform);
draw_set_halign(fa_center); // Garante centralização horizontal
draw_set_valign(fa_top);

// 1. Desenha o Símbolo (+, -, x, ÷)
draw_set_colour(c_white);
draw_text((x + sprite_width / 2) + 0.5, y + 11, symbols[operation]);

// 2. Desenha o Valor (Verde se atingiu o alvo, Vermelho se não)
draw_set_colour(value == target_value ? #1ebc73 : #e83b3b);
draw_text((x + sprite_width / 2) + 1, y + 19, string(value));

// 3. Desenha o Prompt de Interação (Pressione E)
draw_set_valign(fa_middle);
draw_set_font(fnt_texto);
draw_set_colour(c_white);

if (show_input && value != target_value) {
    draw_sprite(s_press_e, input_frame, x + sprite_width / 2, y - 8);    
}

// Resetar o alinhamento para não bagunçar outros objetos
draw_set_halign(fa_left);
draw_set_valign(fa_top);


draw_self(); 

if (instance_exists(o_player)) {
    draw_set_color(c_lime);
    
    // 🫥 Deixou invisível! As duas barras fazem o GameMaker ignorar essa linha:
    // draw_circle(x - 1, y + 15, raio, true);
}
