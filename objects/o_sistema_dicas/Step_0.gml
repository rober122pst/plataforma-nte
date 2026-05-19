if (instance_exists(o_player)) {
    // Verifica se o player se moveu significativamente desde o último ciclo
    var _andou = point_distance(o_player.x, o_player.y, player_ultimo_x, player_ultimo_y) > 5;
    
    // Se ele está jogando mas não avança no objetivo, aumenta o timer de "perdido"
    if (!mostrar_janela_dica) {
        tempo_perdido++;
        
        // Se bateu o tempo limite de ficar perdido
        if (tempo_perdido >= tempo_limite_dica) {
            mostrar_janela_dica = true;
            tempo_exibindo_dica = 60 * 7; // Mantém a dica na tela por 7 segundos
            dica_x_alvo = display_get_gui_width() - 250; // Desliza para dentro da tela
            
            // 🌟 JUNTANDO TODAS AS DICAS COM A LOGICA NOVA:
            if (o_player.inventory[4] != -1) {
                // Se o player está segurando o cartão
                texto_dica = "Os cartões servem para ser colocados nas máquinas para avançar de fase.";
            } 
            else if (instance_exists(o_collectibles)) {
                // Se não tem cartão, mas ainda tem sílabas no mapa
                texto_dica = "Pegue as sílabas restantes para liberar o caminho!";
            } 
            else {
                // Se coletou todas as sílabas e não tem mais nenhuma no mapa
                texto_dica = "Parabéns! Você coletou tudo, agora vá para a saída!";
            }
            
            // 🔊 Toca o som uma única vez ao abrir
            if (!som_tocado) {
                audio_play_sound(papelamassado, 1, false);
                som_tocado = true; 
            }
        }
    } else {
        // Contagem regressiva para sumir com a dica
        tempo_exibindo_dica--;
        if (tempo_exibindo_dica <= 0) {
            mostrar_janela_dica = false;
            tempo_perdido = 0; // Reseta o timer
            dica_x_alvo = display_get_gui_width() + 50; // Manda para fora da tela
            som_tocado = false; // Reseta o som para a próxima vez
        }
    }
    
    // Atualiza o rastreio da última posição do player
    player_ultimo_x = o_player.x;
    player_ultimo_y = o_player.y;
}

// Interpolação suave para fazer o pergaminho deslizar
dica_x = lerp(dica_x, dica_x_alvo, 0.1);