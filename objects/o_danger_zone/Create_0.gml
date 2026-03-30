
my_indicator = noone;
emit = audio_emitter_create();
audio_emitter_falloff(emit, global.dropping_off, global.distance_to_heard, global.multiplier);

ps = part_system_create(pt_smoke_building);


audio_play_sound_on(emit, sound_, 1, 1, .75);

part_emitter_region(ps, 0, x, x + sprite_width, y + 20, y+sprite_height, ps_shape_ellipse, ps_distr_linear)