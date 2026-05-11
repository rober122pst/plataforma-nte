if (instance_exists(my_platform)) {
	my_platform.target_value = target_value;	
}

if (value = target_value) exit;

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

if (keyboard_check_pressed(ord("E"))) {
	var dice_value = o_player.inventory[4] + 1;
	o_player.inventory[4] = -1;
	if (value == 0) 
	{
		value += dice_value;
		return;
	}
	switch (operation) {
		case 0: value += dice_value; break;
		case 1: value -= dice_value; break;
		case 2: value *= dice_value; break;
		case 3: value /= dice_value; break;
	}
}

if (value == target_value) {
	my_platform.velc = my_platform.spd;	
}
// ... seu código anterior do keyboard_check_pressed ...
if (keyboard_check_pressed(ord("E"))) {
    var dice_value = o_player.inventory[4] + 1;
    o_player.inventory[4] = -1;
    
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

    // --- ADICIONE ISSO AQUI ---
    // Faz o número aparecer na conta lá no alto
    if (instance_exists(equacao)) {
        // Se for a primeira máquina, muda o num1. Se for a segunda, muda o num2.
        // Dica: você pode criar uma variável na máquina chamada "id_na_conta" (0 ou 1)
        equacao.num1 = string(value); 
    }
}