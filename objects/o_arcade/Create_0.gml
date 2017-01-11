/// @description Init
width = 16;
height = 16;
snap_width = width / 4;
snap_height = width / 4;
map = ds_grid_create(room_width / width, room_height / height);
playfield = mp_grid_create(0, 0, room_width / width, room_height / height, width, height);
turn = noone;
combat = false;

// fill in map
for (var i = 0; i < ds_grid_width(map); i++)
{
	for (var j = 0; j < ds_grid_height(map); j++)
	{
		var lay_id = layer_get_id("Tiles"),
			map_id = layer_tilemap_get_id(lay_id),
			data = tilemap_get(map_id, i, j),
			index = tile_get_index(data);
		ds_grid_add(map, i, j, index);
		// tileset numbers to block off movmenet
		if (array_contains([0, 5, 8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31], index))
			mp_grid_add_cell(playfield, i, j);
	}
}