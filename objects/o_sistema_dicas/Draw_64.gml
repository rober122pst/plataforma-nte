// Só desenha se a janela não estiver completamente escondida para fora da tela
if (dica_x < display_get_gui_width() + 50) {
    
    var _dica_y = display_get_gui_height() - 380; // Posição vertical fixa no canto inferior
    
    // 1. Desenha o Sprite do Pergaminho Animado (dica.gif)
    // O uso do image_index faz o gif rodar a animação dele nativa
    draw_sprite_ext(s_dica, image_index, dica_x, _dica_y, 15, 15, 0, c_white, 1);
    
    // 2. Configurações do Texto da Dica
    draw_set_font(font_sila);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Cor marrom escura/sépia para combinar com a estética de pergaminho antigo
    var _cor_papiro = make_color_rgb(70, 40, 20);
    draw_set_color(_cor_papiro);
    
    // Coordenadas calculadas para centralizar o texto dentro do pergaminho
    // Ajuste o +100 dependendo de onde fica o meio horizontal da sua sprite
    var _centro_texto_x = dica_x + 120; 
    var _centro_texto_y = _dica_y + 80;
    
    // Desenha o texto quebrando linhas automaticamente a cada 180 pixels de largura
    draw_text_ext(_centro_texto_x, _centro_texto_y, texto_dica, 18, 180);
    
    // Reseta os padrões de desenho do GameMaker
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}