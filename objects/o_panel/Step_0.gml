if (instance_exists(my_platform)) {
	my_platform.target_value = target_value;	
}

if (instance_place(x, y, o_player)) {
	if (o_player.inventory[4] != -1) {
		show_input = true;	
	} else {
		show_input = false;
	}
} else {
	show_input = false;	
}

input_timer = (input_timer + 1) mod 30;
if (input_timer == 0) input_frame = 1 - input_frame;

// 1. ABRE O PUZZLE DO CARTÃO (Só abre se a máquina não estiver processando um cartão agora)
if (show_input && !maquina_ativada && keyboard_check_pressed(ord("E"))) {
    puzzle_cartao_aberto = true;
    cartao_x = display_get_gui_width() / 2;
    cartao_y = display_get_gui_height() / 2 + 150; 
    mensagem_feedback = "INSERT CARD";
    cor_feedback = c_white;
}

// 2. MINIGAME DE ARRASTAR O CARTÃO PARA CIMA
if (puzzle_cartao_aberto) {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    var fenda_y_alvo = display_get_gui_height() / 2 - 100; 
    var limite_inferior = display_get_gui_height() / 2 + 180;

    if (mouse_check_button_pressed(mb_left)) {
        if (point_distance(mx, my, cartao_x, cartao_y) < 150) { 
            segurando_cartao = true;
        }
    }

    if (segurando_cartao) {
        cartao_x = lerp(cartao_x, mx, 0.3); 
        cartao_y = clamp(my, fenda_y_alvo - 20, limite_inferior); 

        if (mouse_check_button_released(mb_left)) {
            segurando_cartao = false;

            if (cartao_y <= fenda_y_alvo + 40 && abs(cartao_x - (display_get_gui_width() / 2)) < 100) {
                mensagem_feedback = "CARD ACCEPTED!";
                cor_feedback = c_lime;
                maquina_ativada = true; 
                puzzle_cartao_aberto = false;
                
                // CÁLCULO DOS DADOS
                var dice_value = o_player.inventory[4] + 1;
                o_player.inventory[4] = -1; // Consome o cartão do inventário
                
                if (value == 0) {
                    value += dice_value;
                } else {
                    switch (operation) {
                        case 0: value += dice_value; break;
                        case 1: value -= dice_value; break;
                        case 2: value *= dice_value; break;
                        case 3: value /= dice_value; break;
                    }
                }
                
                // Atualiza o painel da equação na parede
                if (instance_exists(equacao)) {
                    equacao.num1 = string(value); 
                }

                // 🌟 SE O MONITOR JÁ FOI RESOLVIDO ANTES:
                // Ignora o minigame matemático e já deixa colocar outro cartão direto!
                if (monitor_ja_apareceu) {
                    if (value != target_value) {
                        maquina_ativada = false; 
                    } else {
                        resolvido = true;
                    }
                }

            } else {
                mensagem_feedback = "ALIGN WITH THE SLOT!";
                cor_feedback = c_orange;
                cartao_x = display_get_gui_width() / 2;
                cartao_y = display_get_gui_height() / 2 + 150;
            }
        }
    }
}

// 3. ATIVA O MONITOR MATEMÁTICO (Só ativa se for a PRIMEIRA vez)
if (instance_exists(o_player)) {
    var dist = point_distance(x, y, o_player.x, o_player.y);
    
    // Adicionado a trava "!monitor_ja_apareceu" aqui
    if (!resolvido && dist <= raio && maquina_ativada && !monitor_ja_apareceu) {
        if (!mostrar_monitor) {
            gerar_conta(); 
            mostrar_monitor = true;
            input_texto = "";
            keyboard_string = "";
        }
        escala = lerp(escala, escala_alvo, 0.1); 
    } else {
        mostrar_monitor = false;
        escala = lerp(escala, 0, 0.2); 

    }
}

// 4. DIGITAÇÃO DOS NÚMEROS E TRATAMENTO DE ACERTO
if (mostrar_monitor) {
    var novos_numeros = string_digits(keyboard_string);
    if (novos_numeros != "" && string_length(input_texto) < 6) {
        input_texto += novos_numeros;
    }
    keyboard_string = "";

    if (keyboard_check_pressed(vk_backspace)) {
        input_texto = string_copy(input_texto, 1, string_length(input_texto) - 1);
    }

    // Quando o jogador acerta a conta:
    if (input_texto == resultado_correto) {
        mostrar_monitor = false;
        monitor_ja_apareceu = true; // 🌟 Tranca para nunca mais abrir neste painel
        
        if (value != target_value) {
            maquina_ativada = false; // Permite colocar outro cartão imediatamente
            resolvido = false;       
        } else {
            resolvido = true;        
        }
    }
}

// 5. MOVIMENTAÇÃO DA PLATAFORMA
if (value == target_value) {
	my_platform.velc = my_platform.spd;	
}