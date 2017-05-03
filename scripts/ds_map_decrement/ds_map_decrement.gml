/// @function ds_map_decrement
/// @param id
/// @param key
/// @param value
var map = argument0, key = argument1, value = argument2;
if (map[? key] > 1)
    map[? key] -= value;
else
    ds_map_delete(map, key);