
my_indicator = noone;
emit = noone;
if (sound_) {
	emit = audio_emitter_create();
	audio_emitter_falloff(emit, global.dropping_off, global.distance_to_heard, global.multiplier);

	audio_play_sound_on(emit, sound_, 1, 1, .75);
}

ps = noone;