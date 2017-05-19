/// @description Turns
if (ds_priority_size(turns) == 0)
{
    for (var i = 0; i < instance_count; i++)
    {
        var inst = instance_id[i];
        if (object_get_parent(inst.object_index) == o_entity
            && inst.initiative > 0 && inst.steps > 0 && !inst.dead
            && (inst.agro || !inst.npc))
        {
            inst.priority = irandom_range(1, inst.initiative);
            ds_priority_add(turns, inst, inst.priority);
            ds_list_add(order, inst);
        }
    }
}

if (entity == noone)
{
    entity = ds_priority_find_max(turns);
    o_controller.target = entity;
    o_highlight.target = !entity.npc ? entity : noone;
    entity.effect_update = true;
    fog_update = true;
    playfield_update(entity);
}
else if (entity.steps == 0)
{
    if (timer > 0)
        timer--;
    else if (timer == 0)
    {
        entity.steps = entity.moves;
        ds_priority_delete_value(turns, entity);
        ds_list_delete(order, ds_list_find_index(order, entity));
        entity = noone;
        timer = time;
    }
}

if (fog_update)
{
    surface_set_target(fog_surf);
        draw_clear_alpha(c_black, 0);
        draw_shadows(entity);
    surface_reset_target();
    fog_update = false;
}

if (map_update)
{
    surface_resize(map_surf, ds_grid_width(map) * 10, ds_grid_height(map) * 10);
    surface_set_target(map_surf);
        draw_clear_alpha(c_ltgray, 0);
        // col = chi > 5 ? (c > 0 ? c_yellow : c_red) : c_gray
        for (var i = 0; i < ds_grid_width(map); i++)
        {
            for (var j = 0; j < ds_grid_height(map); j++)
            {
                var item = map[# i, j], s = 8,
                    ix = i * (s + 2), iy = j * (s + 2),
                    key = ord(string(HEX[irandom(array_length_1d(HEX) - 1)])),
                        /*base64_encode(generate_key(32))*/ // 8 * 32 = 256
                    is_passage = array_contains([PASSAGE], key),
                    col = item == is_passage ? make_color_elm() : c_dkgray;
                draw_rectangle_color(ix, iy, ix + s, iy + s, col, col, col, col, false);
                map[# i, j] = key;
                /*
                    var ix = i * tile, iy = j * tile, iv = maze[# i, j],
                        area = ds_grid_get_disk_sum(maze, i, j, 1),
                        is_passage = array_contains([ROOT, PASSAGE], iv),
                        col = is_passage ? merge_color(heatmap, c_maroon, 0.75) : heatmap,
                        comp = make_color_comp(col);
                    // set opacity based on area density
                    draw_set_alpha(is_passage ? 1 : area / HIGHEST);
                        draw_rectangle_color(ix, iy, ix + tile, iy + tile, col, col, col, col, false);
                    draw_set_alpha(1);
                    draw_text_color(ix + (tile - string_width(chr(iv))) / 2, iy + (tile - string_height(chr(iv))) / 2, chr(iv), comp, comp, comp, comp, 1);
                */
            }
        }
    surface_reset_target();
    map_update = false;
}