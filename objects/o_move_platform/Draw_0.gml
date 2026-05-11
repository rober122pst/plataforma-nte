draw_sprite_ext(s_move_platform, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);

//draw_set_font(fnt_platform);
//draw_set_colour(c_green);
//draw_text(x + (sprite_get_width(s_move_platform)*image_xscale) / 2, y - 8, string(target_value));
scr_write_text_Shadow(fnt_platform, fa_center, fa_middle, x + (sprite_get_width(s_move_platform)*image_xscale) / 2, y - 8, string(target_value), c_green, 0.5, dir_directions.bottom_right)
draw_set_colour(c_white);
draw_set_font(fnt_texto);