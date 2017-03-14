/// @description Set
var game = o_controller.game,
	behind = tile_get_type([tile_type.tree], [
		tile_get_value(x + xoffset, y + yoffset), 
		tile_get_value(x, y)]),
	ld = layer_get_depth("Instances") - (game.entity == id ? 1 : 0);
move_snap(game.width, game.height);
depth = behind ? layer_get_depth("Decals") : ld;
dead = hp <= 0;

if (shake)
{
	var r = random(0.75) + 0.25;
	x += choose(-r, r);
	y += choose(r, -r);
	shake = false;
}

// trigger effects
if (effect_update)
{
	var effect = ds_map_find_first(effects);
	for(var i = 0; i < ds_map_size(effects); i++)
	{
		// countdown on part value
		var args = effects[? effect], 
			ticks = args[0]; // [TICKS,AMT]
		if (ticks > 0)
		{
			switch (effect)
			{
				case effect_type.med:
					var amount = args[1];
					if (chi < chi_max)
						chi += amount;
					var frames = animation_set(anim_type.meditation),
						r = irandom(array_length_1d(frames) - 1);
					image_speed = 0;
					image_index = frames[r];
					image_xscale = choose(-1, 1);
					sprite_set_offset(sprite_index, image_xscale < 0 ? -sprite_width : 0, 0);
					break;
				case effect_type.damage:
					var amount = args[1];
					do_damage(id, amount, amount / hp > 0.5);
					break;
				case effect_type.heal:
					var amount = args[1];
					// ToDo: update???
					hp += amount;
					break;
			}
			args[@ 0] -= 1;
			if (args[0] == 0)
				ds_map_delete(effects, effect);
		}
		effect = ds_map_find_next(effects, effect);
	}
	effect_update = false;
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
		case action_type.die:
			shake = true;
			shell = c_red;
			solid = false;
			image_alpha = 0.75;
			image_blend = c_maroon;
			image_yscale = -1;
			sprite_set_offset(sprite_index, sprite_xoffset, -sprite_height);
			msg = us + " killed " + them;
			break;
		case action_type.meditation:
			var ticks = irandom(3), amount = irandom(10);
			effects[? effect_type.med] = [ticks, amount]; // if zero = fizzle
			msg = us + " rolled a " + string(ticks) + " on meditation for " + string(amount) + " amount";
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
			var dmg = args[1], crit = dmg / t.hp > 0.5;
			do_damage(t, dmg, crit);
			msg = us + " " + (dmg > 0 ? ("did " + string(dmg) + (crit ? " critical " : "") + " damage to ") : "missed ") + them;
			break;
		case action_type.defend:
			msg = us + " defended " + them;
			// ToDo
			break;
		case action_type.inspect:
			var obj = t == noone ? tile_get_value(amenu_x, amenu_y) : them;
			msg = us + " looked at " + obj;
			// ToDo
			break;
		case action_type.loot:
			var inv = t.inventory, first = ds_map_find_first(inv);
			for (var i = 0; i < ds_map_size(inv); i++)
			{
				ds_map_increment(inventory, first, inv[? first]);
				first = ds_map_find_next(inv, first);
			}
			ds_map_clear(inv);
			msg = us + " looted " + them;
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
		var obj = collision_point(tx, ty, o_entity, false, false);
		amenu_x = obj != noone ? obj.x : o_highlight.x;
		amenu_y = obj != noone ? obj.y : o_highlight.y;
		// click menu
		if (amenu_item > 0)
		{
			var args = [amenu_target], cost = 1;
			switch (amenu_item)
			{
				case action_type.attack:
					args = [amenu_target, irandom(damage)];
					break;
				case action_type.meditation:
					cost = 2;
					break;
			}
			if (steps >= cost)
			{
				ds_stack_push(actions, [amenu_item, args]);
				steps -= cost;
			}
			// reset
			amenu = [];
			amenu_item = -1;
			amenu_target = noone;
		}
		else if (inventory_item > 0)
		{
			// ToDo: click on inventory item!
		}
		// clicking on solid tiles
		else if (tile_get_type(tile_type.solids, [tile_get_value(tx, ty)]))
		{
			if (array_length_1d(amenu) > 0)
				amenu = [];
			else
				amenu = (distance_to_point(tx, ty) < range * game.width) 
					? [action_type.inspect, action_type.peek] 
					: [action_type.inspect];
			amenu_target = tile_get_value(tx, ty);
		}
		// clicking on solid objects
		else if (obj != noone)
		{
			if (array_length_1d(amenu) > 0)
				amenu = [];
			else if (obj.dead)
				amenu = ds_map_size(obj.inventory) > 0 
					? [action_type.loot, action_type.inspect]
					: [action_type.inspect];
			else
				amenu = obj == id 
					? [action_type.ambush, action_type.defend, action_type.meditation]
					: (distance_to_object(obj) < range * game.width
						? [action_type.attack, action_type.defend, action_type.inspect]
						: [action_type.inspect]);
			amenu_target = obj;
		}
		// movement
		else if (array_length_1d(amenu) == 0)
			ds_stack_push(actions, [action_type.move, [o_highlight]]);
		// reset
		else
		{
			amenu = [];
			amenu_item = -1;
			amenu_target = noone;
		}
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