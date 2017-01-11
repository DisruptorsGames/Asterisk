/// @function tile_get_type
/// @param tile type
/// @param spot
var type = argument0 == tile_type.solids
		? [tile_type.blank, tile_type.ceiling, tile_type.door, tile_type.wall] 
		: argument0,
	spot = argument1,
	list = ds_list_create();
// add all tile types
for (var i = 0; i < array_length_1d(type); i++)
{
	switch (type[i])
	{
		case tile_type.blank:
			ds_list_add(list, 0, 5);
			break;
		case tile_type.ceiling:
			ds_list_add(list, 8, 9, 10, 11, 12, 13, 14, 15);
			break;
		case tile_type.ground:
			ds_list_add(list, 1, 2, 3, 4, 16, 17, 18, 19, 20, 21);
			break;
		case tile_type.door:
			ds_list_add(list, 24, 25, 26, 27);
			break;
		case tile_type.wall:
			ds_list_add(list, 28, 29, 30, 31);
			break;
	}
}
// determine if we have what we're looking for
var found = ds_list_find_index(list, spot) != -1;
ds_list_destroy(list);
return found;