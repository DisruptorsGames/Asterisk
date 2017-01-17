/// @function draw_text_color_ext
/// @param x
/// @param y
/// @param string
/// @param color
/// @param alpha
/// @param font
/// @param alignment
var xx = argument0, yy = argument1, str = argument2, 
	color = argument3, alpha = argument4, 
	font = argument5, alignment = argument6;
draw_set_halign(alignment);
draw_set_font(font);
draw_text_color(xx, yy, str, color, color, color, color, alpha);
draw_set_font(-1);
draw_set_halign(-1);