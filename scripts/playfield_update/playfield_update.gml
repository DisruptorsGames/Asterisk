/// @function playfield_update
/// @param ignore
var ignore = argument0;
// CLEAR
mp_grid_clear_all(playfield);
// map all solid instances
for(var i = 0; i < instance_count; i++)
{
    var inst = instance_id[i];
    if(inst.solid && inst != ignore)
        mp_grid_add_instances(playfield, inst, false);
}
// map all solid tiles
ds_list_clear(segments);
for (var i = 0; i < room_width / width; i++)
{
    for (var j = 0; j < room_height / height; j++)
    {
        var ix = i * width, iy = j * height;
        if (tile_get_type(tile_type.solids, [tile_get_value(ix, iy)])
            || tile_get_value(ix, iy) == -1)
        {
            mp_grid_add_cell(playfield, i, j);
            // counter clock wise segments
            if (point_in_rectangle(ix, iy, vx, vy, vx + vw, vy + vh))
                ds_list_add(segments,
                    [[ix, iy], [ix + width, iy]],
                    [[ix + width, iy], [ix + width, iy + height]],
                    [[ix + width, iy + height], [ix, iy + height]],
                    [[ix, iy + height], [ix, iy]]);
        }
    }
}