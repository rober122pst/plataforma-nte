global.distance_to_heard = 500;
global.dropping_off = 100;
global.multiplier = 5;

audio_falloff_set_model(audio_falloff_linear_distance);
audio_listener_orientation(0, 0, 1, -1, 0, 0);

music = noone;
if (!audio_is_playing(m_bg1)) {
	music = audio_play_sound(m_bg1, 0, 0);
	audio_sound_gain(music, 0, 0);
	audio_sound_gain(music, .4, 5000);
}