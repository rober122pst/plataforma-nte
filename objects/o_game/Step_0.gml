// ⏱️ CONTA OS FRAMES DO CRONÔMETRO (Só roda se o jogo não tiver acabado)
if (variable_instance_exists(id, "jogo_finalizado") && !jogo_finalizado) {
    tempo_frames++; 
}

// ------------------------------------------------------------
// 💥 SEU CÓDIGO ORIGINAL - NÃO MEXIDO:
// ------------------------------------------------------------
has_syllable = false;

with (o_collectibles) {
	if (object_index == o_collectibles) {
		other.has_syllable = true;	
	}
}

var _index = array_find_index(global.levels, function(_element) {
	return _element[0] == room;
});

global.silabas = global.levels[_index][1];

if (!has_syllable) {
    if (_index != -1 && o_player.inventory[_index] != _index) {
        o_player.inventory[_index] = _index;
        o_player.equiped = _index;
        audio_play_sound(Som_quando_liberar_o_item, 0, 0);
    }
    
    // 🏆 CHECAGEM DE FIM DE JOGO NA FASE MAIS RECENTE DA LISTA (rm_final):
    if (_index == array_length(global.levels) - 1) {
        if (!jogo_finalizado) {
            jogo_finalizado = true;
            if (instance_exists(o_player)) {
                o_player.pode_mover = false;
                o_player.hspd = 0;
                o_player.vspd = 0;
            }
        }
    }
}

#region DEBUG

if (keyboard_check_pressed(ord("P"))) {
	show_debug_message(global.level_index)
	if (global.level_index == 4) {
		instance_destroy(o_settings_obj);
		instance_destroy(o_player)
		room_goto(Menu);
		exit;
	}
	
	room_goto(global.levels[global.level_index][0]);
	o_player.inventory[global.level_index - 1] = global.level_index - 1;
	global.level_index++;
}

if (keyboard_check_pressed(ord("R"))) {
	room_restart();	
}

#endregion DEBUG