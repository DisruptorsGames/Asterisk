/// @description Set
event_inherited();

var game = o_controller.game,
    behind = tile_get_type([tile_type.tree], [
        tile_get_value(x + xoffset, y + yoffset),
        tile_get_value(x, y)]),
    ld = layer_get_depth("Instances") - (game.entity == id ? 1 : 0);
depth = behind ? layer_get_depth("Decals") : ld;
dead = hp <= 0;

if (agro)
{
    fx_float(id, "!!!");
    hit = seconds(1);
    agro = false;
}
if (shake)
{
    var r = random(0.75) + 0.25;
    x += choose(-r, r);
    y += choose(r, -r);
    hit = seconds(0.75);
    shake = false;
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
    // me->action->target:x:y
    show_debug_message(tostr([tostr([us,x,y],":"), enum_get_name(enum_type.action, top[0]),tostr([them,t.x,t.y],":")],"->"));
    switch (action)
    {
        case action_type.ambush: break;
        case action_type.attack:
            var dmg = args[1], crit = dmg / t.hp > 0.5;
            t.hp -= dmg;
            t.shake = true;
            fx_bleed(t, dmg);
            fx_float(t, dmg > 0 ? string(dmg) : choose("MISS", "!@#$", "OOPS", "WIFF"));
            animation_set(id, anim_type.fight);
            animation_set(t, anim_type.fight);
            if (t.hp <= 0)
                ds_stack_push(t.actions, [action_type.die, [t]]);
            if (dmg > 0)
            {
                t.agro = true;
                ds_map_delete(t.effects, effect_type.med);
            }
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
    instance_destroy(o_amenu);
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
                    && can_has(action_type.attack, id, inst))
                        priority = inst;
            }
            // [type, [tick/dmg, amt]]
            var action = priority != noone
                ? [action_type.attack, [priority, irandom(damage)]]
                : (can_has(action_type.meditation, id, id)
                    ? [action_type.meditation, [id, irandom_range(0, 3), irandom_range(1, 10)]]
                    : [action_type.defend, [id]]),
                args = action[1];
            if (cost > 0 && steps >= cost
                && (action[0] == action_type.attack || args[0] > 0))
            {
                ds_stack_push(actions, action);
                steps -= cost;
            }
            target = priority;
            think = seconds(0.75);
        }
    }
    else if (mouse_check_button_pressed(mb_left))
    {
        var amenu_x = o_highlight.x, amenu_y = o_highlight.y,
            amenu_obj = collision_point(amenu_x + o_highlight.xoffset, amenu_y + o_highlight.yoffset, o_base, false, false),
            amenu_tile = tile_get_type(tile_type.solids, [tile_get_value(amenu_x, amenu_y)]),
            amenu_ex = instance_exists(o_amenu) ? array_length_1d(o_amenu.menu) > 0 : false;
        target = amenu_obj == noone ? o_highlight : amenu_obj;
        show_debug_message(tostr([target,amenu_tile?"S":"~",amenu_ex?"M":"~"], "|"));
        if (mp_grid_path(game.playfield, path, x + xoffset, y + yoffset, amenu_x + o_highlight.xoffset, amenu_y + o_highlight.yoffset, false))
        {
            var last = path_get_number(path) - 1;
            while (last > steps)
            {
                path_delete_point(path, last);
                last = path_get_number(path) - 1;
            }
            amenu_x = path_get_point_x(path, last) - game.width / 2;
            amenu_y = path_get_point_y(path, last) - game.height / 2;
        }
        else
            path_clear_points(path);
        ui_amenu(amenu_x, amenu_y, s_actions, 0.25, amenu_ex ? [] : (target == o_highlight
            // tiles
            ? (amenu_tile
                ? [action_type.inspect]
                : [action_type.move])
            // objects
            : (target != id
                ? (can_has(action_type.attack, id, target)
                    ? [action_type.attack, action_type.defend, action_type.inspect]
                    : [action_type.inspect])
                : [action_type.ambush, action_type.defend, action_type.meditation, action_type.skip])));
    }
}

// end walk cycle
if (path_position == 1)
{
    path_end();
    path_clear_points(path);
    ui_amenu(x, y, s_actions, 0.25, []); // clear the menu...
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
                : (can_has(action_type.attack, id, target)
                    ? anim_type.fight
                    : anim_type.idle));
    image_xscale = tile_r ? -1 : 1;
    sprite_set_offset(sprite_index, tile_r ? -sprite_width : 0, 0);
    animation_set(id, anim);
    game.fog_update = true;
}