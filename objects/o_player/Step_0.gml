/// @description Controls (REMOVE ME)
event_inherited();

// at edge, current map and surrounding map positions
/*var map_w = ds_grid_width(game.map), map_h = ds_grid_height(game.map),
	map_x = ds_grid_value_x(game.map, 0, 0, map_w, map_h, room),
	map_y = ds_grid_value_y(game.map, 0, 0, map_w, map_h, room),
	room_l = game.map[# map_x, map_y - 1],
	room_r = game.map[# map_x, map_y + 1],
	room_t = game.map[# map_x - 1, map_y],
	room_b = game.map[# map_x + 1, map_y];
// left, right, top, bottom check
can_exit = (x + xoffset - game.width < 0 && room_l != -1)
	|| (x + xoffset + game.width > room_width && room_r != -1)
	|| (y + yoffset - game.height < 0 && room_t != -1)
	|| (y + yoffset + game.height > room_height && room_b != -1);*/

// look around for danger!
/*for (var i = 0; i < ds_list_size(nearme); i++)
{
	var inst = nearme[| i];
	if (array_contains([o_rat, o_rabbit], inst.object_index))
	{
		in_danger = true;
		break;
	}
}*/