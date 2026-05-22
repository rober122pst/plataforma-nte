if (instance_exists(o_player)) {
    
    // 🔍 1. VERIFICAÇÃO DE PROGRESSO E DA TELA DO PUZZLE
    var _qtd_silabas_atual = instance_number(o_collectibles);
    var _cartao_atual = (o_player.inventory[4] != -1);
    
    // Identifica se o puzzle do cartão está aberto olhando direto para o o_panel
    var _tela_zoom_aberta = false;
    if (instance_exists(o_panel)) {
        _tela_zoom_aberta = (o_panel.puzzle_cartao_aberto && !o_panel.maquina_ativada);
    }

    // ==========================================
    // GATILHO ESPECIAL: TELA DE ZOOM DA MÁQUINA ABERTA
    // ==========================================
    if (_tela_zoom_aberta) {
        mostrar_janela_dica = true;
        tempo_exibindo_dica = 60 * 20; // Deixa 12 segundos para dar tempo de ler com calma nessa tela
        dica_x_alvo = display_get_gui_width() - 250; // Faz o papiro entrar deslizando
        
        // Mensagem exata que você pediu para aparecer no canto da tela:
        texto_dica = "Aperte com o botão esquerdo do mouse e arraste-o até a entrada da máquina para a leitura!";
        
        if (!som_tocado) {
            audio_play_sound(papelamassado, 1, false);
            som_tocado = true;
        }
        
        // Atualiza as memórias para não dar conflito quando fechar a tela
        qtd_silabas_memoria = _qtd_silabas_atual;
        cartao_na_memoria = _cartao_atual;
        nivel_frustracao = 0;
        tempo_analise = 0;
    }
    // ==========================================
    // SISTEMA ORIGINAL (SÓ RODA SE A TELA DE ZOOM ESTIVER FECHADA)
    // ==========================================
    else {
        // Se algo mudou no inventário ou nas sílabas no mapa normal
        if (_qtd_silabas_atual != qtd_silabas_memoria || _cartao_atual != cartao_na_memoria) {
            
            // Se o player ACABA DE PEGAR o cartão no chão
            if (_cartao_atual && !cartao_na_memoria) {
                mostrar_janela_dica = true;
                tempo_exibindo_dica = 60 * 16; 
                dica_x_alvo = display_get_gui_width() - 250; 
                texto_dica = "Você pegou um cartão! Leve-o até uma máquina para processar os dados.";
                
                if (!som_tocado) {
                    audio_play_sound(papelamassado, 1, false);
                    som_tocado = true;
                }
            } 
            // Caso ele tenha progredido de outra forma
            else {
                if (mostrar_janela_dica) {
                    mostrar_janela_dica = false;
                    dica_x_alvo = display_get_gui_width() + 50; // Recolhe o papiro
                    som_tocado = false;
                }
            }

            nivel_frustracao = 0; 
            tempo_analise = 0;
            qtd_silabas_memoria = _qtd_silabas_atual;
            cartao_na_memoria = _cartao_atual;
        }

        // 🔍 2. ANÁLISE DE COMPORTAMENTO POR FRUSTRAÇÃO
        if (!mostrar_janela_dica) {
            tempo_analise++;

            if (tempo_analise >= 180) {
                var _dist_deslocada = point_distance(o_player.x, o_player.y, pos_x_ancora, pos_y_ancora);

                if (_dist_deslocada < 15) {
                    nivel_frustracao += 25; 
                } 
                else if (_dist_deslocada < 250) {
                    nivel_frustracao += 35; 
                } 
                else {
                    nivel_frustracao = max(0, nivel_frustracao - 20); 
                }

                pos_x_ancora = o_player.x;
                pos_y_ancora = o_player.y;
                tempo_analise = 0;
            }

            // 🔍 3. DISPARO DO PERGAMINHO SE ELE CONTINUAR PERDIDO NO MAPA
            if (nivel_frustracao >= 100) {
                mostrar_janela_dica = true;
                tempo_exibindo_dica = 60 * 12; 
                dica_x_alvo = display_get_gui_width() - 250; 

                if (o_player.inventory[4] != -1) {
                    texto_dica = "Os cartões servem para ser colocados nas máquinas para avançar de fase.";
                } else if (instance_exists(o_collectibles)) {
                    texto_dica = "Pegue as sílabas restantes para liberar o caminho!";
                } else {
                    texto_dica = "Parabéns! Você coletou tudo, agora vá para a saída!";
                }

                if (!som_tocado) {
                    audio_play_sound(papelamassado, 1, false);
                    som_tocado = true;
                }
            }
        } else {
            // Contagem de tempo da dica ativa na tela (mapa comum)
            tempo_exibindo_dica--;
            if (tempo_exibindo_dica <= 0) {
                mostrar_janela_dica = false;
                nivel_frustracao = 0; 
                dica_x_alvo = display_get_gui_width() + 50; 
                som_tocado = false;
                
                pos_x_ancora = o_player.x;
                pos_y_ancora = o_player.y;
            }
        }
    }
}

// Movimento suave de transição do papiro (funciona para ambos os estados)
dica_x = lerp(dica_x, dica_x_alvo, 0.1);