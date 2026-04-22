view_height = display_get_gui_height();
view_width = display_get_gui_width();

display_set_gui_size(view_width, view_height);

center = view_width / 2;
middle = view_height / 2;

scale = view_width / camera_get_view_width(view_camera[0]);

inventory_slots = 5;
slot_width = sprite_get_width(s_inventory)*scale;
slot_height = sprite_get_height(s_inventory)*scale;

h_box_up = 0;
h_box_down = view_hport[0];

room_start = false;

font_silabas = font_add_sprite_ext(s_bitmap, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZÇçÓ", true, 0);