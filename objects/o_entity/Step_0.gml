/// @description Snapping
var game = o_controller.game, branches = [33, 34, 35, 36, 37, 38, 39];
move_snap(game.width, game.height);

// look around
depth = (array_contains(branches, tile_get_value(x + xoffset, y + yoffset))
	|| array_contains(branches, tile_get_value(x, y))) ? 100 : 0;

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
	// map all solid instances
	for(var i = 0; i < instance_count; i += 1)
	{
	    var inst = instance_id[i];
	    if(inst.solid && inst != id)
	        mp_grid_add_instances(game.playfield, inst, false);
	}
	// map all solid tiles
	for (var i = 0; i < room_width / game.width; i++)
	{
		for (var j = 0; j < room_height / game.height; j++)
		{
			var ix = i * game.width, iy = j * game.height;
			if (tile_get_type(tile_type.solids, tile_get_value(ix, iy)))
				mp_grid_add_cell(game.playfield, i, j);
		}
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
	var anim = anim_type.idle, tiles = [tile_type.wall, tile_type.ceiling, tile_type.tree],
		tile_t = tile_get_type(tiles, tile_get_value(x, y)), // 0, -1
		tile_l = tile_get_type(tiles, tile_get_value(x + xoffset - game.width, y + yoffset)), // -1, 0
		tile_r = tile_get_type(tiles, tile_get_value(x + xoffset + game.width, y + yoffset)); // 1, 0
	
	if (tile_l || tile_r)
	{
		var tile_tl = tile_get_type(tiles, tile_get_value(x + xoffset - game.width, y)), // -1, -1
			tile_tr = tile_get_type(tiles, tile_get_value(x + xoffset + game.width, y)); // 1, -1
		anim = (tile_tl && tile_l) || (tile_tr && tile_r) 
			? anim_type.lean 
			: anim_type.crouch;
		image_xscale = tile_r ? -1 : 1;
		sprite_set_offset(sprite_index, tile_r ? -sprite_width : 0, 0);
	}
	else if (tile_t)
		anim = anim_type.crouch;
	
	animation_set(anim);
}

/*


















*/