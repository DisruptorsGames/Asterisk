/// @function ds_map_increment
/// @param id
/// @param key
/// @param value
var map = argument0, key = argument1, value = argument2;
if (is_undefined(map[? key]))
	map[? key] = value;
else
	map[? key] += value;