draw_set_font(fnt_aviso); // Define a fonte uma vez só

var texto = "pressione E para inserir o cartão na maquina"; 
var largura_contorno = 2; 

// 1. DESENHA O CONTORNO (Preto)

draw_set_color(c_black);
draw_text(x + largura_contorno, y, texto);
draw_text(x - largura_contorno, y, texto);
draw_text(x, y + largura_contorno, texto);
draw_text(x, y - largura_contorno, texto);
//draw_arrow(mouse_x, mouse_y+10)

// 2. DESENHA O TEXTO PRINCIPAL (Branco) por cima
draw_set_color(c_white);
draw_text(x, y, texto);

// 3. RESETAR (Boa prática)
draw_set_color(c_white);