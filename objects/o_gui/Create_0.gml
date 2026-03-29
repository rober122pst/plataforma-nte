view_height = view_hport[0];
view_width = view_wport[0];

center = view_width / 2;
middle = view_height / 2;

scale = view_width / camera_get_view_width(view_camera[0]);

inventory_slots = 5;
slot_width = sprite_get_width(s_inventory)*scale;
slot_height = sprite_get_height(s_inventory)*scale;

