// --- SISTEMA ANALÍTICO DE FRUSTRAÇÃO ---
nivel_frustracao = 0; // Vai de 0 a 100

tempo_analise = 0;
pos_x_ancora = 0;
pos_y_ancora = 0;

// Registra o estado atual do mapa para saber quando há progresso
qtd_silabas_memoria = instance_number(o_collectibles);
cartao_na_memoria = false;

if (instance_exists(o_player)) {
    cartao_na_memoria = (o_player.inventory[4] != -1);
    pos_x_ancora = o_player.x;
    pos_y_ancora = o_player.y;
}

// Configurações visuais do papiro (dica.gif)
dica_x = display_get_gui_width() + 50; 
dica_x_alvo = display_get_gui_width() + 50; 
texto_dica = "";
mostrar_janela_dica = false;
tempo_exibindo_dica = 0;
som_tocado = false;