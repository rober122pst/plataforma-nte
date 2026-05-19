// Configurações do Timer
tempo_perdido = 0;
tempo_limite_dica = 60 * 2; // 20 segundos (considerando um jogo a 60 FPS)

// Controle de Posição da Janela de Dica
dica_x = display_get_gui_width() + 70; // Começa totalmente fora da tela (direita)
dica_x_alvo = display_get_gui_width() + 70; // Destino atual


// Controle do Texto
texto_dica = "";
mostrar_janela_dica = false;
tempo_exibindo_dica = 0;
texto_fim = "";

// Salva a última posição para saber se o player está parado ou andando sem rumo
player_ultimo_x = 0;
player_ultimo_y = 0;
som_tocado = false;