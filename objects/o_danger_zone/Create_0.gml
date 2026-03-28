is_playing = false;
emit = audio_emitter_create();
audio_emitter_falloff(emit, global.dropping_off, global.distance_to_heard, global.multiplier);

ps = part_system_create(pt_smoke_building);