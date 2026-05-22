// 🌊 CÁLCULO DA FLUTUAÇÃO PURA:
tempo_flutuacao += 0.05; 
var _offset_y = sin(tempo_flutuacao) * 6; // Sobe e desce suave

// Configuração do texto
draw_set_font(font_sila); 
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Texto quebrado em duas linhas
var _texto = "PARABÉNS\nFIM DE JOGO";
var _pos_x = x;
var _pos_y = (y - 40) + _offset_y; 

// Escala fixa
var _escala = 0.6;

// 💛 TEXTO PRINCIPAL (Apenas o nome puro, sem contorno)
draw_set_color(c_yellow);
draw_text_transformed(_pos_x, _pos_y, _texto, _escala, _escala, 0);

// 🧼 Reseta os padrões do GameMaker
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);