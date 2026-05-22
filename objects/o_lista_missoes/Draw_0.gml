// 🟢 ISSO VAI DESENHAR A TRILHA DE SETAS NO CHÃO DO MAPA APONTANDO PARA A MÁQUINA CERTA
if (instance_exists(o_player)) {
    
    // Só ativa se o jogador tiver o cartão no inventário
    var _tem_cartao = (o_player.inventory[4] != -1);
    
    if (_tem_cartao) {
        
        var _alvo = noone;
        
        // 1. Checa primeiro se a variável global aponta para algo válido
        if (variable_global_exists("alvo_atual") && instance_exists(global.alvo_atual)) {
            _alvo = global.alvo_atual;
        } 
        else {
            // 2. BUSCA INTELIGENTE: Procura a máquina (o_panel) que AINDA NÃO foi resolvida!
            var _index_painel = asset_get_index("o_panel");
            if (_index_painel != -1 && instance_exists(_index_painel)) {
                
                // Varre todas as instâncias de o_panel na sala
                var _qtd_maquinas = instance_number(_index_painel);
                for (var i = 0; i < _qtd_maquinas; i++) {
                    var _inst_maquina = instance_find(_index_painel, i);
                    
                    // Se achou uma máquina que NÃO está ativada, ela vira o nosso alvo!
                    if (_inst_maquina.maquina_ativada == false) {
                        _alvo = _inst_maquina;
                        break; // Para o loop aqui porque já achamos a próxima pendente
                    }
                }
                
                // Se por acaso TODAS já foram ativadas, aponta para a última por padrão
                if (_alvo == noone && _qtd_maquinas > 0) {
                    _alvo = instance_find(_index_painel, _qtd_maquinas - 1);
                }
            }
        }
        
        // Se encontrou o alvo válido, faz o cálculo e o desenho em tempo real
        if (_alvo != noone) {
            var _start_x = o_player.x;
            var _start_y = o_player.y - sprite_get_height(s_player_collision) / 2; // Linha sai do peito/cintura do player
            var _end_x = _alvo.x + 8;
            var _end_y = _alvo.y + 16;
            
            // Calcula a distância real e transforma em metros (sua grid de 32px)
            var _dist_pixels = point_distance(_start_x, _start_y, _end_x, _end_y);
            var _dist_metros = _dist_pixels / 16; 
            
            // ============================================================
            // 🧠 CÁLCULO DO FADE OUT (TRANSPARÊNCIA POR DISTÂNCIA)
            // ============================================================
            var _linha_alpha = 1.0; 
            
            // Se estiver a menos de 3 metros, calcula o desaparecimento suave
            if (_dist_metros <= 4){
                _linha_alpha = _dist_metros / 4;
            }
            
            _linha_alpha = clamp(_linha_alpha, 0, 1);
            
            // SÓ DESENHA SE AINDA NÃO SUMIU COMPLETAMENTE
            if (_linha_alpha > 0) {
                
                // Aplica o alpha global para respeitar o sumiço perto da máquina
                draw_set_alpha(_linha_alpha);
                
                // 🏹 LÓGICA DE SUBSTUIÇÃO DA LINHA BRANCA PELO RASTRO DE S_SETA
                var _direcao = point_direction(_start_x, _start_y, _end_x, _end_y);
                var _espacamento_setas = 20// Distância em pixels entre uma seta e outra no chão
                
                // Laço de repetição que projeta as setas do jogador até a máquina alvo
                for (var d = 0; d < _dist_pixels; d += _espacamento_setas) {
                    // Encontra as coordenadas X e Y de cada ponto na reta
                    var _seta_x = _start_x + lengthdir_x(d, _direcao);
                    var _seta_y = _start_y + lengthdir_y(d, _direcao);
                    
                    // Desenha a s_seta aplicando a rotação correta baseada no vetor (_direcao - 90)
                    draw_sprite_ext(s_chevron, (current_time div 250) mod 2, _seta_x, _seta_y, 1, 1, _direcao - 90, c_white, _linha_alpha);
                }
                
                // Ponto central para colocar o texto flutuante dos metros
                var _meio_x = (_start_x + _end_x) / 2;
                var _meio_y = (_start_y + _end_y) / 2;
                
                // Configurações da fonte
                draw_set_font(font_sila); 
                draw_set_halign(fa_center);
                draw_set_valign(fa_middle);
                
                var _texto_metros = string(round(_dist_metros)) + " M";
                
                // Desenha o texto acompanhando a transparência
                draw_text_color(_meio_x + 1, _meio_y + 1, _texto_metros, c_black, c_black, c_black, c_black, _linha_alpha);
                draw_text_color(_meio_x, _meio_y, _texto_metros, c_white, c_white, c_white, c_white, _linha_alpha);
            }
            
            // Reseta os padrões de desenho do GameMaker para segurança do pipeline de renderização
            draw_set_alpha(1.0); 
            draw_set_halign(fa_left);
            draw_set_valign(fa_top);
            draw_set_color(c_white);
        }
    }
}