// Só desenha se a janela não estiver completamente escondida para fora da tela
if (dica_x < display_get_gui_width() + 50) {
    
    var _dica_y = display_get_gui_height() - 380; // Posição vertical fixa no canto inferior
    
    // 1. Desenha o Sprite do Pergaminho Animado (dica.gif)
    draw_sprite_ext(s_dica, image_index, dica_x, _dica_y, 15, 15, 0, c_white, 1);
    
    // 2. Configurações do Texto da Dica
    draw_set_font(font_sila);
    draw_set_halign(fa_center);
    
    // 🌟 MUDANÇA 1: Alinha pelo TOPO para o texto correr para baixo ordenadamente
    draw_set_valign(fa_top); 
    
    // Cor marrom escura/sépia para combinar com a estética de pergaminho antigo
    var _cor_papiro = make_color_rgb(70, 40, 20);
    draw_set_color(_cor_papiro);
    
    // Coordenadas calculadas para centralizar o texto dentro do pergaminho
    var _centro_texto_x = dica_x + 120; 
    
    // 🌟 MUDANÇA 2: Ajustamos o Y para começar mais perto do topo do papiro (+45)
    var _centro_texto_y = _dica_y + 45; 
    
    // 🌟 MUDANÇA 3: Aumentamos o espaço de 18 para 26 para as linhas não colidirem!
    // E abrimos um tiquinho a largura máxima para 190 para aproveitar o papiro.
    var _espacamento_linhas = 26; 
    var _largura_maxima = 190;
    
    draw_text_ext(_centro_texto_x, _centro_texto_y, texto_dica, _espacamento_linhas, _largura_maxima);
    
    // Reseta os padrões de desenho do GameMaker
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}