/// @function draw_border
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param color
/// @param alpha
var x1 = argument0, y1 = argument1, x2 = argument2, y2 = argument3, color = argument4, alpha = argument5;
draw_sprite_ext(s_highlight, 0, x1, y1,
    (x2 - x1) / sprite_get_width(s_highlight),
    (y2 - y1) / sprite_get_height(s_highlight),
    0, color, alpha);