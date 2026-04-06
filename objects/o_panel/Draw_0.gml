draw_self();

var symbols = ["+", "-", "x", "÷"];


draw_set_font(fnt_platform);

draw_set_valign(fa_top);

draw_set_colour(c_white);
draw_text((x + sprite_width / 2) + 0.5, y + 11, symbols[operation]);

draw_set_colour(value == target_value ? #1ebc73 : #e83b3b);
draw_text((x + sprite_width / 2) + 1, y + 19, string(value));

draw_set_valign(fa_middle);

draw_set_font(fnt_texto);
draw_set_colour(c_white);

if (show_input && value != target_value) {
	draw_sprite(s_press_e, input_frame, x + sprite_width / 2, y - 8);	
}