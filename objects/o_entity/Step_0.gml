/// @description Snapping
var game = o_controller.game;
move_snap(game.width, game.height);

if (shake)
{
	var r = random(0.75) + 0.25;
	x += choose(-r, r);
	y += choose(r, -r);
	shake = false;
}

// move to target
if (instance_exists(target) && grid_snapped(target))
{
	// map all solids
	for(var i = 0; i < instance_count; i += 1)
	{
	    var inst = instance_id[i];
	    if(inst.solid && inst != id)
	        mp_grid_add_instances(game.playfield, inst, false);
	}

	// find path
	has_path = mp_grid_path(game.playfield, path, x + xoffset, y + yoffset, target.x, target.y, false);
	//path_set_precision(path, 8);
	// delete beginning and unable to move points
	path_delete_point(path, 0);
	var last = path_get_number(path) - 1;
	while (last >= steps)
	{
		path_delete_point(path, last);
		last = path_get_number(path) - 1;
	}
	// move
	if (has_path)
	{
		target = noone;
		alarm[0] = move_time;
		//path_start(path, 1, 0, false);
	}
}

// stop moving
if (path_position == 1)
	alarm[0] = -1;