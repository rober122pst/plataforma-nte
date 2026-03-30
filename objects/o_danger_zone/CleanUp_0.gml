if (audio_emitter_exists(emit)) {
    audio_emitter_free(emit);
}

if (part_system_exists(ps)) {
    part_system_destroy(ps);
}