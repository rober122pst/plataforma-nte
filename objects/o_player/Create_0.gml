spd = 2;
hspd = 0;

grav = .35;
vspd = 0;
jump_force = -7;
max_vspd = 10;
coyote_timer = 0;
coyote_timer_frames = 10;
buffered_timer = 0;
buffered_timer_frames = 8;

in_danger_zone = false;

blocked_dir = 0;

max_items = o_gui.inventory_slots;
inventory = array_create(max_items, -1);
equiped = -1;

heartbeats = noone;

var states = player_states;
states();

state = player_move;

sprites = {
	boots: {
		idle: s_player_idle_boot,
		walk: s_player_walk_boot,
		cry: s_player_cry_boot
	},
	cape: {
		idle: s_player_idle_cape,
		walk: s_player_walk_cape,
		cry: s_player_cry_cape
	},
	phones: {
		idle: s_player_idle_phones,
		walk: s_player_walk_phones,
		cry: s_player_cry_phones
	},
	glasses: {
		idle: s_player_idle_glasses,
		walk: s_player_walk_glasses,
		cry: s_player_cry_glasses
	},
	idle: s_player_idle,
	walk: s_player_walk,
	cry: s_player_cry
}

depth = -1;