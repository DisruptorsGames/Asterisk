/// @description Controls
event_inherited();

var game = o_controller.game,
	keys = keyboard_check_pressed(up) || keyboard_check_pressed(down) 
		|| keyboard_check_pressed(left) || keyboard_check_pressed(right);

if (path_position == 0)
{
	// at edge, current map and surrounding map positions
	var map_x = ds_grid_value_x(game.map, 0, 0, ds_grid_width(game.map), ds_grid_height(game.map), room),
		map_y = ds_grid_value_y(game.map, 0, 0, ds_grid_width(game.map), ds_grid_height(game.map), room),
		room_l = game.map[# map_x, map_y - 1],
		room_r = game.map[# map_x, map_y + 1],
		room_t = game.map[# map_x - 1, map_y],
		room_b = game.map[# map_x + 1, map_y];
	// left, right, top, bottom check
	can_exit = (x + xoffset - game.width < 0 && room_l != -1)
		|| (x + xoffset + game.width > room_width && room_r != -1)
		|| (y + yoffset - game.height < 0 && room_t != -1)
		|| (y + yoffset + game.height > room_height && room_b != -1);

	// look around for danger!
	for (var i = 0; i < ds_list_size(nearme); i++)
	{
		var inst = nearme[| i];
		if (array_contains([o_rat], inst.object_index))
		{
			in_danger = true;
			break;
		}
	}
	
	if (keyboard_check_pressed(toggle_inv))
		inv_show = !inv_show;

	if (!inv_show)
	{
		shake = keys;
		// avoid solid tiles and current player location
		var tx = o_highlight.x + o_highlight.xoffset,
			ty = o_highlight.y + o_highlight.yoffset;
		if (mouse_check_button_pressed(mb_left) && target == noone
			&& !(x + xoffset == tx && y + yoffset == ty)
			&& !tile_get_type(tile_type.solids, [tile_get_value(o_highlight.x, o_highlight.y)])
			&& !collision_point(o_highlight.x, o_highlight.y, o_entity, false, true))
		{
			target = o_highlight;
			playfield_update = true;
		}
	}
}