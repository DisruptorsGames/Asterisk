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
if (instance_exists(target))
{
	// map all solids
	for(var i = 0; i < instance_count; i += 1)
	{
	    var inst = instance_id[i];
	    if(inst.solid && inst != id)
	        mp_grid_add_instances(game.playfield, inst, false);
	}

	// find path
	has_path = mp_grid_path(game.playfield, path, x + xoffset, y + yoffset, target.x + target.xoffset, target.y + target.yoffset, true);
	
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
	path_position = 0;
	steps = moves;
	//
	var anim = anim_type.idle,
		tiles = [tile_type.wall, tile_type.ceiling],
		wall_l = tile_get_type(tiles, map_find_value(x + xoffset, y + yoffset, -1, 0)),
		wall_r = tile_get_type(tiles, map_find_value(x + xoffset, y + yoffset, 1, 0));
	
	if (point_distance(x + xoffset, y + yoffset, o_chest.x, o_chest.y) < 32)
		anim = anim_type.crouch;
	else if (wall_l || wall_r)
	{
		var wall_tl = tile_get_type(tiles, map_find_value(x + xoffset, y + yoffset, -1, -1)),
			wall_tr = tile_get_type(tiles, map_find_value(x + xoffset, y + yoffset, 1, -1));
		anim = (wall_tl && wall_l) || (wall_tr && wall_r) ? anim_type.lean : anim_type.crouch;
		image_xscale = wall_r ? -1 : 1;
		sprite_set_offset(sprite_index, wall_r ? -sprite_width : 0, 0);
	}
	
	animation_set(anim);
}

/*


















*/