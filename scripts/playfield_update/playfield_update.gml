/// @function playfield_update
/// @param ignore
var ignore = argument0, game = o_controller.game;
// CLEAR
mp_grid_clear_all(game.playfield);
// map all solid instances
for(var i = 0; i < instance_count; i += 1)
{
	var inst = instance_id[i];
	if(inst.solid && inst != ignore)
		mp_grid_add_instances(game.playfield, inst, false);
}
// map all solid tiles
for (var i = 0; i < room_width / game.width; i++)
{
	for (var j = 0; j < room_height / game.height; j++)
	{
		var ix = i * game.width, iy = j * game.height;
		if (tile_get_type(tile_type.solids, [tile_get_value(ix, iy)]))
			mp_grid_add_cell(game.playfield, i, j);
	}
}
game.pf_updates++;