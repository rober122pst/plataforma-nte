// ================================================================
// 🌟 HUD ATUALIZADO E AJUSTADO (SÍLABAS GRANDES EMBAIXO DO INVENTÁRIO)
// ================================================================

var _zoom_aberto = false;
if (instance_exists(o_panel)) {
    _zoom_aberto = o_panel.puzzle_cartao_aberto;
}

if (instance_exists(o_player) && !_zoom_aberto) {
    
    // 📍 Posição inicial travada abaixo das caixas do inventário
    var _palavra_x = 32;  
    var _palavra_y = 155; 
    
    // Configura a fonte padrão e o alinhamento à esquerda
    draw_set_font(font_sila);
    draw_set_halign(fa_left); 
    draw_set_valign(fa_top);
    
// ------------------------------------------------------------
// 1. LINHA DA PALAVRA-ALVO (Texto com Degradê Amarelo/Branco)
// ------------------------------------------------------------
var _escala_palavra = 2; 
var _texto_completo = "JUNTE AS SÍLABAS DA PALAVRA: " + string(palavra_da_fase);

// Sombra Preta da Palavra (Mantém sólida para dar leitura)
draw_set_color(c_black);
draw_text_transformed(_palavra_x + 2, _palavra_y + 2, _texto_completo, _escala_palavra, _escala_palavra, 0);

// 🌟 CONFIGURAÇÃO DO ESTILO DEGRADÊ (Igual à imagem da seta: Amarelo e Branco)
// Cores de cima (Top) e cores de baixo (Bottom)
var _cor_cima  = c_yellow; 
var _cor_baixo = c_white;  // Se quiser um degradê mais quente igual à seta, use c_orange embaixo!

// Desenha o texto aplicando o efeito de mistura nas 4 pontas
draw_text_transformed_color(
    _palavra_x, _palavra_y, _texto_completo, 
    _escala_palavra, _escala_palavra, 0, 
    _cor_cima, _cor_cima, _cor_baixo, _cor_baixo, 1
);

// ------------------------------------------------------------
// 2. BUSCA AS SÍLABAS COLETADAS DA FASE ATUAL
// ------------------------------------------------------------
var _silabas_y = _palavra_y + 28; // Espaçamento perfeito para a fonte maior de baixo
var _texto_silabas = "";

if (variable_global_exists("levels")) {
    var _fase_encontrada = -1;
    var _qtd_fases = array_length(global.levels);
    
    for (var f = 0; f < _qtd_fases; f++) {
        if (room == global.levels[f][0]) {
            _fase_encontrada = f;
            break;
        }
    }
    
    if (_fase_encontrada != -1) {
        var _lista_silabas_da_fase = global.levels[_fase_encontrada][1];
        var _total_silabas_fase = array_length(_lista_silabas_da_fase);
        var _coletaveis_restantes = instance_number(o_collectibles);
        var _total_coletados = _total_silabas_fase - _coletaveis_restantes;
        
        if (variable_global_exists("silabas") && array_length(global.silabas) > 0) {
            for (var i = 0; i < array_length(global.silabas); i++) {
                _texto_silabas += string(global.silabas[i]) + " ";
            }
        }
        else if (_total_coletados > 0) {
            for (var s = 0; s < _total_coletados; s++) {
                if (s < _total_silabas_fase) {
                    _texto_silabas += string(_lista_silabas_da_fase[s]) + " ";
                }
            }
        }
    }
}

// Reseta os padrões de desenho do GameMaker por segurança
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

}

