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
	//
	var anim = anim_type.idle,
		px = o_player.x / game.width, 
		py = (o_player.y + o_player.yoffset) / game.height,
		walls = [8, 9, 10, 11, 12 ,13, 14, 15, 28, 29, 30, 31],
		tile_l = array_contains(walls, o_arcade.map[# px - 1, py]),
		tile_r = array_contains(walls, o_arcade.map[# px + 1, py]);
	
	if (distance_to_object(o_chest) < 16)
		anim = anim_type.crouch;
	else if (tile_l || tile_r)
	{
		anim = anim_type.lean;
		image_xscale = tile_r ? -1 : 1;
		sprite_set_offset(sprite_index, tile_r ? -sprite_width : 0, 0);
	}
	
	animation_set(anim);
}

/*


















*/