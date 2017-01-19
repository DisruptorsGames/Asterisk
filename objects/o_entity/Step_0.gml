/// @description Set
var game = o_controller.game,
	behind = tile_get_type([tile_type.tree], [
		tile_get_value(x + xoffset, y + yoffset), 
		tile_get_value(x, y)]),
	ld = layer_get_depth(behind ? "Decals" : "Instances");
depth = game.entity == id ? (layer_get_depth("Instances") - 1) : ld;
move_snap(game.width, game.height);

if (shake)
{
	var r = random(0.75) + 0.25;
	x += choose(-r, r);
	y += choose(r, -r);
	shake = false;
}

// execute action stack
if (!ds_stack_empty(actions))
{
	var top = ds_stack_pop(actions),
		action = top[0], args = top[1], t = args[0], 
		msg = string(top),
		us = object_get_name(object_index),
		them = t == noone ? "???" : object_get_name(t.object_index);
	switch (action)
	{
		case action_type.meditation:
			var bonus = irandom(10);
			msg = us + " gained " + string(bonus) + " chi!";
			if (chi < chi_max)
				chi += bonus;
			var frames = animation_set(anim_type.meditation),
				r = irandom(array_length_1d(frames) - 1);
			image_speed = 0;
			image_index = frames[r];
			image_xscale = choose(-1, 1);
			sprite_set_offset(sprite_index, image_xscale == -1 ? -sprite_width : 0, 0);
			break;
		case action_type.move:
			// find quickest path to target
			has_path = mp_grid_path(game.playfield, path, x + xoffset, y + yoffset, t.x + t.xoffset, t.y + t.yoffset, false);
			if (has_path)
			{
				msg = us + " moved to " + string(t.x) + "x" + string(t.y);
				t = noone;
				// remove any point the entity cannot move to
				var last = path_get_number(path) - 1;
				while (last > steps)
				{
					path_delete_point(path, last);
					last = path_get_number(path) - 1;
				}
				path_start(path, 0.75, 0, false);
				animation_set(anim_type.run);
			}
			break;
		case action_type.ambush:
			msg = us + " ambushed " + them;
			// ToDo
			break;
		case action_type.attack:
			var dmg = args[1];
			t.hp -= dmg;
			t.shake = true;
			repeat(5)
			{
				var blood = instance_create_depth(
					t.x + t.image_xscale * t.sprite_width / 2, 
					t.y + sprite_height / 2, 
					t.depth - 1, o_blood);
			}
			msg = us + " " + (dmg > 0 ? ("did " + string(dmg) + " damage to ") : "missed ") + them;
			steps -= 1;
			// ToDo
			break;
		case action_type.defend:
			msg = us + " defended " + them;
			// ToDo
			break;
		case action_type.inspect:
			var obj = t == noone ? tile_get_value(0, 0) : them;
			msg = us + " looked at " + obj;
			// ToDo
			break;
		case action_type.peek:
			msg = us + " peeked around " + them;
			// ToDo
			break;
		case action_type.leave:
			// ToDo
			break;
	}
	ds_list_add(game.log, msg);
}

// set action stack
if (game.entity == id && steps > 0)
{
	// avoid solid tiles and current player location
	var tx = o_highlight.x + o_highlight.xoffset,
		ty = o_highlight.y + o_highlight.yoffset;
	if (mouse_check_button_pressed(mb_left))
	{
		amenu_x = o_highlight.x;
		amenu_y = o_highlight.y;
		var obj = collision_point(tx, ty, o_entity, false, false);
		// click menu
		if (amenu_item > 0)
		{
			var args = [amenu_target];
			switch (amenu_item)
			{
				case action_type.attack:
					args = [amenu_target, irandom(5)];
					break;
			}
			ds_stack_push(actions, [amenu_item, args]);
			// reset
			amenu = [];
			amenu_item = -1;
			amenu_target = noone;
		}
		// clicking on solid tiles
		else if (tile_get_type(tile_type.solids, [tile_get_value(tx, ty)]))
		{
			amenu = array_length_1d(amenu) > 0 ? [] : [action_type.inspect, action_type.peek];
			amenu_target = tile_get_value(tx, ty);
		}
		// clicking on solid objects
		else if (((x + xoffset == tx && y + yoffset == ty) || obj != noone))
		{
			amenu = array_length_1d(amenu) > 0 ? [] : [action_type.attack, action_type.defend, action_type.inspect];
			amenu_target = obj;
		}
		// movement
		else
			ds_stack_push(actions, [action_type.move, [o_highlight]]);
	}
}

// end walk cycle
if (path_position == 1)
{
	steps -= path_get_number(path) - 1;
	path_end();
	path_clear_points(path);
	path_position = 0;
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
}