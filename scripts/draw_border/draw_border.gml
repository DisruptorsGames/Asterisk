/// @function draw_border
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param color
/// @param size
var x1 = argument0, y1 = argument1, x2 = argument2, y2 = argument3, color = argument4, size = argument5;
draw_rectangle_color(x1 - size, y1 - size, x2 + size, y2 + size, color, color, color, color, false);