draw_set_font(fnt_texto);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var width = string_width(silaba);
var height = string_height(silaba);

image_xscale = width / sprite_get_width(sprite_index);
image_yscale = height / sprite_get_height(sprite_index);

scr_write_text_outline(fnt_texto, fa_middle, fa_center, x, y, silaba, c_white, #2e222f, 1);
draw_set_colour(c_white);