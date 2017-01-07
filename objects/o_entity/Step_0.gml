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
	
	// move
	if (has_path)
	{
		target = noone;
		path_start(path, 0.75, 0, false);
		animation_set(anim_type.run);
	}
}

// stop moving
if (path_position == 1)
{
	path_end();
	path_clear_points(path);
	steps = moves;
	animation_set(anim_type.idle);
}

/*


















*/