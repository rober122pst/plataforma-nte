var _silabas = global.levels[global.level_index - 1][1];
var _count = 0;
with (o_collectibles) {
	if (object_index == o_collectibles) {
	    if (_count < array_length(_silabas)) {
	        silaba = _silabas[_count];
			show_debug_message("contador: {0} : silaba: {1}", _count, silaba)
	        _count++;
	    }
	}
}