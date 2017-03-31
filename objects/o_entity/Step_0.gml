/// @description Set
event_inherited();

var game = o_controller.game,
	behind = tile_get_type([tile_type.tree], [
		tile_get_value(x + xoffset, y + yoffset), 
		tile_get_value(x, y)]),
	ld = layer_get_depth("Instances") - (game.entity == id ? 1 : 0);
depth = behind ? layer_get_depth("Decals") : ld;
dead = hp <= 0;

if (shake)
{
	var r = random(0.75) + 0.25;
	x += choose(-r, r);
	y += choose(r, -r);
	shake = false;
	hit = seconds(0.75);
}
if (hit > 0)
	hit--;

// trigger effects
if (effect_update)
{
	var effect = ds_map_find_first(effects);
	for(var i = 0; i < ds_map_size(effects); i++)
	{
		var args = effects[? effect], 
			ticks = args[0];
		if (ticks > 0)
		{
			switch (effect)
			{
				case effect_type.med:
					var amount = args[1];
					if (chi < chi_max)
						chi += amount;
					var frames = animation_set(id, anim_type.meditation),
						r = irandom(array_length_1d(frames) - 1);
					image_speed = 0;
					image_index = frames[r];
					image_xscale = choose(-1, 1);
					sprite_set_offset(sprite_index, image_xscale < 0 ? -sprite_width : 0, 0);
					break;
				case effect_type.bleed:
					var amount = args[1];
					hp -= amount;
					shake = true;
					fx_bleed(id, amount);
					fx_float(id, string(amount));
					animation_set(id, anim_type.fight);
					break;
				case effect_type.heal:
					var amount = args[1];
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
		us = object_get_name(object_index),
		them = !instance_exists(t) ? "???" : object_get_name(t.object_index);
	switch (action)
	{
		case action_type.ambush: break;
		case action_type.attack:
			var dmg = args[1], crit = dmg / t.hp > 0.5;
			t.hp -= dmg;
			t.shake = true;
			t.amenu_target = id; // aggressor ???
			fx_bleed(t, dmg);
			fx_float(t, dmg > 0 ? string(dmg) : choose("MISS", "!@#$", "OOPS", "WIFF"));
			animation_set(id, anim_type.fight);
			animation_set(t, anim_type.fight);
			if (t.hp <= 0)
				ds_stack_push(t.actions, [action_type.die, [t]]);
			if (dmg > 0)
				ds_map_delete(t.effects, effect_type.med);
			break;
		case action_type.defend: break;
		case action_type.inspect: break;
		case action_type.die:
			shake = true;
			shell = c_red;
			solid = false;
			image_alpha = 0.75;
			image_blend = c_maroon;
			moves = 0;
			steps = moves;
			break;
		case action_type.leave: break;
		case action_type.loot:
			var inv = t.inventory, first = ds_map_find_first(inv);
			for (var i = 0; i < ds_map_size(inv); i++)
			{
				ds_map_increment(inventory, first, inv[? first]);
				first = ds_map_find_next(inv, first);
			}
			ds_map_clear(inv);
			fx_float(t, choose("YONK", "KTHXBYE", "GOTCHA"));
			break;
		case action_type.meditation:
			var ticks = args[1], amount = args[2];
			fx_float(id, ticks > 0 ? string(ticks) : choose("FIZZLE", "NIL", "FAIL"));
			if (ticks > 0)
				effects[? effect_type.med] = [ticks, amount];
			break;
		case action_type.move:
			fx_float(id, string(path_get_number(path) - 1));
			path_start(path, 0.75, 0, false);
			animation_set(id, anim_type.run);
			t = noone;
			break;
		case action_type.peek: break;
		case action_type.skip: break;
		case action_type.unlock:
			var text = "";
			if (inventory[? item_type.key] > 0)
			{
				t.locked = false;
				ds_map_decrement(inventory, item_type.key, 1);
				text = choose("POOF", "KAZAM");
			}
			else
				text = "You need a key";
			fx_float(t, text);
			break;
	}
}
// set action stack
if (game.entity == id && steps > 0)
{
	var cost = 1;
	if (npc)
	{
		if (think > 0)
			think--;
		else if (think == 0)
		{
			// find priority target
			var priority = noone;
			for (var i = 0; i < instance_count; i++)
			{
				var inst = instance_id[i];
				if (object_get_parent(inst.object_index) == o_entity && !inst.npc
					&& can_has(action_type.attack, inst))
						priority = inst;
			}
			// [type, [tick/dmg, amt]]
			var	action = priority != noone
				? [action_type.attack, [priority, irandom(damage)]]
				: (can_has(action_type.meditation, id)
					? [action_type.meditation, [id, irandom_range(0, 3), irandom_range(1, 10)]]
					: [action_type.defend, [id]]),
				args = action[1];
			if (cost > 0 && steps >= cost
				&& (action[0] == action_type.attack || args[0] > 0))
			{
				ds_stack_push(actions, action);
				steps -= cost;
			}
			amenu_target = priority;
			think = seconds(0.75);
		}
	}
	// avoid solid tiles and current player location
	else if (mouse_check_button_pressed(mb_left))
	{
		var args = [amenu_target],
			tx = o_highlight.x + o_highlight.xoffset,
			ty = o_highlight.y + o_highlight.yoffset,
			obj = collision_point(tx, ty, o_base, false, false);
		amenu_x = obj != noone ? obj.x : o_highlight.x;
		amenu_y = obj != noone ? obj.y : o_highlight.y;
		if (amenu_item == -1)
			path_clear_points(path);
		// click menu
		if (amenu_item > 0)
		{
			switch (amenu_item)
			{
				case action_type.attack:
					args = [amenu_target, irandom(damage)];
					break;
				case action_type.meditation:
					args = [amenu_target, irandom_range(0, 3), irandom(10)];
					cost = 2;
					break;
				case action_type.move:
					args = [o_highlight];
					cost = path_get_number(path) - 1;
					break;
				case action_type.skip:
					cost = steps;
					break;
			}
			if (cost > 0 && steps >= cost)
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
			else if (object_get_parent(obj.object_index) != o_entity || obj.dead)
				amenu = ds_map_size(obj.inventory) > 0
					? (obj.locked
						? [action_type.unlock, action_type.inspect]
						: [action_type.loot, action_type.inspect])
					: [action_type.inspect];
			else
			{
				amenu = obj == id
					? [action_type.ambush, action_type.defend, action_type.meditation, action_type.skip]
					: (can_has(action_type.attack, obj)
						? [action_type.attack, action_type.defend, action_type.inspect]
						: [action_type.inspect])
			}
			amenu_target = obj;
		}
		// movement
		else if (array_length_1d(amenu) == 0)
		{
			amenu = [action_type.move];
			mp_grid_path(game.playfield, path, x + xoffset, y + yoffset, tx, ty, false);
			// remove any point the entity cannot move to
			var last = path_get_number(path) - 1;
			while (last > steps)
			{
				path_delete_point(path, last);
				last = path_get_number(path) - 1;
			}
			// realign action menu to be above last point in path
			amenu_x = path_get_point_x(path, last) - game.width / 2;
			amenu_y = path_get_point_y(path, last) - game.height / 2;
		}
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
	//steps -= path_get_number(path) - 1;
	path_end();
	path_clear_points(path);
	path_position = 0;
	ds_map_delete(effects, effect_type.med);
	var tiles = [tile_type.wall, tile_type.ceiling],
		tile_tl = tile_get_type(tiles, [tile_get_value(x + xoffset - game.width, y)]),
		tile_t = tile_get_type(tiles, [tile_get_value(x, y)]),
		tile_tr = tile_get_type(tiles, [tile_get_value(x + xoffset + game.width, y)]),
		tile_r = tile_get_type(tiles, [tile_get_value(x + xoffset + game.width, y + yoffset)]),
		tile_b = tile_get_type(tiles, [tile_get_value(x, y + yoffset + game.height)]),
		tile_l = tile_get_type(tiles, [tile_get_value(x + xoffset - game.width, y + yoffset)]),
		anim = (tile_tl && tile_l) || (tile_tr && tile_r) 
			? anim_type.lean 
			: ((tile_l || tile_r) 
				? anim_type.crouch 
				: (can_has(action_type.attack, amenu_target) 
					? anim_type.fight
					: anim_type.idle));
	image_xscale = tile_r ? -1 : 1;
	sprite_set_offset(sprite_index, tile_r ? -sprite_width : 0, 0);
	animation_set(id, anim);
	game.fog_update = true;
}