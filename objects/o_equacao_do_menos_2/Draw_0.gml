// 1. Desenha a arte da lousa/equação
draw_self(); 

// 2. Configura a fonte e o alinhamento
draw_set_font(fnt_texto_bk); 
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_white);

// 3. Desenha o primeiro número (se ele já tiver sido enviado pela máquina)
// O x-40 e y+15 são para encaixar no primeiro "?"
if (variable_instance_exists(id, "num1")) {
    if (num1 != "?") {
        draw_text(x - 40, y + 15, string(num1));
    }
}

// 4. Desenha o segundo número
// O x+10 e y+15 são para encaixar no segundo "?"
if (variable_instance_exists(id, "num2")) {
    if (num2 != "?") {
        draw_text(x + 10, y + 15, string(num2));
    }
}

// Resetar o alinhamento para não afetar outros objetos
draw_set_halign(fa_left);
draw_set_valign(fa_top);