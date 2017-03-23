/// @function printf
/// @param x
/// @param y
/// @param string
/// @param color
/// @param alpha
/// @param font
/// @param alignment
/// @param scale
/// @param rotation
/// @param border
var xx = argument0, yy = argument1, str = argument2, 
	color = argument3, alpha = argument4, 
	font = argument5, alignment = argument6,
	scale = argument7, rotation = argument8,
	border = argument9;
draw_set_halign(alignment);
draw_set_font(font);
if (border)
	draw_text_transformed_color(xx - 1, yy - 1, str, scale, scale, rotation, c_black, c_black, c_black, c_black, alpha);
draw_text_transformed_color(xx, yy, str, scale, scale, rotation, color, color, color, color, alpha);
draw_set_font(-1);
draw_set_halign(-1);