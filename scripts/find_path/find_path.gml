/// @function find_path
/// @param x
/// @param y
/// @param speed

// initialize grid
grid = mp_grid_create(0, 0, round(room_width / 32), round(room_height / 32), 32, 32);
mp_grid_clear_all(grid);

// find solid
for(i = 0; i < instance_count; i += 1)
{
    var ID = instance_id[i];
    if(ID.solid && ID != id)
        mp_grid_add_instances(grid, ID, 1);
}

// create dummy path and calculate fastest route
p = path_duplicate(p_default);
var found = mp_grid_path(grid, p, x, y, argument0, argument1, 0);
// start walking
if(found)
    path_start(p, argument2, 0, 1);
// stop walking
else
{
    // clear path
    p = 0;
    path_end();
}