/// @description Think
var game = o_controller.game, 
	behind = tile_get_type([tile_type.tree], [
		tile_get_value(x + xoffset, y + yoffset), 
		tile_get_value(x, y)]);
move_snap(game.width, game.height);
depth = layer_get_depth(behind ? "Decals" : "Instances");

if (shake)
{
	var r = random(0.75) + 0.25;
	x += choose(-r, r);
	y += choose(r, -r);
	shake = false;
}

if (playfield_update)
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
			if (tile_get_type(tile_type.solids, [tile_get_value(ix, iy)]))
				mp_grid_add_cell(game.playfield, i, j);
		}
	}
	playfield_update = false;
	game.pf_updates++;
}

if (instance_exists(target))
{
	// find quickest path to target
	has_path = mp_grid_path(game.playfield, path, x + xoffset, y + yoffset, target.x + target.xoffset, target.y + target.yoffset, false);
	if (has_path)
	{
		target = noone;
		path_start(path, 0.75, 0, false);
		animation_set(anim_type.run);
	}
}
else if (path_position == 1)
{
	// stop moving
	path_end();
	path_clear_points(path);
	path_position = 0;
	steps = moves;
	idle = idle_t;
	// look around
	ds_list_clear(nearme);
	for (var i = 0; i < 3; i++)
	{
		for (var j = 0; j < 3; j++)
		{
			var ix = x - game.width + i * game.width, 
				iy = y - (yoffset > 16 ? 0 : game.height) + j * game.height,
				inst = collision_point(ix, iy, all, false, true),
				tile = tile_get_value(ix, iy);
			// add instances
			if (inst != noone && object_get_parent(inst.object_index) == o_entity)
				ds_list_add(nearme, inst);
		}
	}
	// set end animation (snapping)
	var tiles = [tile_type.wall, tile_type.ceiling],
		tile_tl = tile_get_type(tiles, [tile_get_value(x + xoffset - game.width, y)]),
		tile_t = tile_get_type(tiles, [tile_get_value(x, y)]),
		tile_tr = tile_get_type(tiles, [tile_get_value(x + xoffset + game.width, y)]),
		tile_r = tile_get_type(tiles, [tile_get_value(x + xoffset + game.width, y + yoffset)]),
		tile_b = tile_get_type(tiles, [tile_get_value(x, y + yoffset + game.height)]),
		tile_l = tile_get_type(tiles, [tile_get_value(x + xoffset - game.width, y + yoffset)]),
		anim = (tile_tl && tile_l) || (tile_tr && tile_r) ? anim_type.lean : ((tile_l || tile_r) ? anim_type.crouch : anim_type.idle);
	image_xscale = tile_r ? -1 : 1;
	sprite_set_offset(sprite_index, tile_r ? -sprite_width : 0, 0);
	animation_set(anim);
	fog_update = true;
	//
	//if (object_index == o_player)
		//music_set(in_danger ? sfx_outside_combat : sfx_cave_ambient);
}

// meditation
if (path_position == 0)
{
	if (idle > 0)
		idle--;
	else if (idle == 0)
	{
		if (chi < chi_max)
			chi += irandom(10);
		var frames = animation_set(anim_type.meditation),
			r = irandom(array_length_1d(frames) - 1);
		image_speed = 0;
		image_index = frames[r];
		image_xscale = choose(-1, 1);
		sprite_set_offset(sprite_index, image_xscale == -1 ? -sprite_width : 0, 0);
		idle = irandom(idle_t / 2) + idle_t / 2;
	}
}
