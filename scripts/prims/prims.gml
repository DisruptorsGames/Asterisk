/// @desc Prim's Algorithm
/// @param grid
/// @param visited
/// @param node
var grid = argument0, visited = argument1, node = argument2,
    nx = node[0], ny = node[1], nv = grid[# nx, ny],
    area = ds_grid_get_disk_sum(grid, nx, ny, 1);
show_debug_message("Node: " + chr(nv));
show_debug_message("->Area: " + string(area) + "/" + string(area / HIGHEST));
grid[# nx, ny] = PASSAGE;
var n = neighbors(nx, ny);
for (var i = 0; i < array_length_1d(n); i++)
{
    var neighbor = n[i], ix = neighbor[0], iy = neighbor[1],
        value = grid[# ix, iy];
    ds_list_add(walls, [ix, iy]);
}
/*
Prim's algorithm:
    Start with a grid full of walls.
    Pick a cell:
        Mark it as part of the maze.
        Add the walls to the wall list.
    While there are walls in the list:
        Pick a random wall from the list.
        If only one of the two cells that the wall divides is visited:
            Make the wall a passage
            Mark the unvisited cell as part of the maze.
            Add the neighboring walls of the cell to the wall list.
        Remove the wall from the list.
*/