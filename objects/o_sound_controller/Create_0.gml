global.distance_to_heard = 100;
global.dropping_off = 30;
global.multiplier = 1;

audio_falloff_set_model(audio_falloff_linear_distance);

music = noone;
if (!audio_is_playing(m_bg1)) {
	music = audio_play_sound(m_bg1, 0, 0);
	audio_sound_gain(music, 0, 0);
	audio_sound_gain(music, .4, 5000);
}