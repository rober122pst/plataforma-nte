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

inventory = [];
equiped = -1;

var states = player_states;
states();

state = player_move;

sprites = {
	idle: s_player_idle,
	walk: s_player_walk,
	cry: s_player_cry
}

depth = -1;