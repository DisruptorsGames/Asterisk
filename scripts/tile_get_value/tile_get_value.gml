/// @function tile_get_value
/// @param x
/// @param y
var xx = argument0, yy = argument1, 
	game = o_controller.game,
	layers = ["Tiles", "Decals"]
	index = -1;
for (var i = 0; i < array_length_1d(layers); i++)
{
	var lay_id = layer_get_id(layers[i]),
		map_id = layer_tilemap_get_id(lay_id),
		data = tilemap_get(map_id, xx / game.width, yy / game.height)
		ind = tile_get_index(data);
	if (ind > 0)
		index = ind;
}
return index;