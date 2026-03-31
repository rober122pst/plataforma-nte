event_inherited();

ps = part_system_create(pt_smoke_building);
part_emitter_region(ps, 0, x, x + sprite_width, y + 20, y+sprite_height, ps_shape_ellipse, ps_distr_linear);