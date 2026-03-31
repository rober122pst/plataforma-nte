draw_self();
var x1 = (x + (sprite_width)/2)-2;
var width = x1+4;
draw_rectangle(x1, y-2, width, y+2, 0);

if (danger_item_id == 1) {
	draw_primitive_begin(pr_trianglestrip);

	// esquerda (visível)
	draw_vertex_color(x, y, c_white, 1);
	draw_vertex_color(x, y + 32, c_white, 1);

	// direita (invisível)
	draw_vertex_color(x + sprite_width, y, c_white, 0);
	draw_vertex_color(x + sprite_width, y + 32, c_white, 0);

	draw_primitive_end();
}

