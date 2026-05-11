// Inherit the parent event
event_inherited();

if (!instance_place(x, y, o_player)) {
	can_swap = true;
	can_destroy = true;
}