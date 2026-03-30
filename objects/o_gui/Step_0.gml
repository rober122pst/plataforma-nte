if (global.level_completed) {
	h_box_up += 15;
	if (h_box_up >= middle) h_box_up = middle;
	h_box_down -= 15;
	if (h_box_down <= middle) h_box_down = middle;
	
	if (h_box_down <= middle && h_box_up >= middle) {
		room_goto_next();
		global.level_completed = false;
	}
}

if (room_start) {
	h_box_up -= 15;
	if (h_box_up <= 0) h_box_up = 0;
	h_box_down += 15;
	if (h_box_down >= view_height) h_box_down = view_height;
	
	if (h_box_down >= view_height && h_box_up <= 0) {
		room_start = false;
	}
}