if (!is_playing) {
	audio_play_sound_on(emit, sound_, 1, 1, .5);
	is_playing = true;	
}

part_emitter_region(ps, 0, x, x + sprite_width, y + 20, y-20+sprite_height, ps_shape_ellipse, ps_distr_linear)

audio_emitter_position(emit, x, y, 0);

