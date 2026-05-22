global.level_completed = false;

global.levels = [
	[rm_fone, ["FO", "NE"]],
	[rm_oculos, ["Ó", "CU", "LOS"]],
	[o_botas, ["BO", "TAS"]],
	[rm_capa, ["CA", "PA"]],
		]

global.level_index = 1; 
has_syllable = false;
global.items_id = [ "phones", "glasses", "boots", "cape" ];
global.silabas = [];
global.alvo_atual = o_player;

// ⏱️ VARIÁVEIS DO CRONÔMETRO E FIM DE JOGO:
tempo_frames = 0;      
jogo_finalizado = false;