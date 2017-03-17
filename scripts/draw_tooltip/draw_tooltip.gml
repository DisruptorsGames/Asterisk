/// @function draw_tooltips
/// @param x
/// @param y
/// @param type
/// @param sprite
/// @param value
/// @param size
/// @param scale
/// @param alpha
var xx = argument0, yy = argument1, type = argument2, 
	spr = argument3, val = argument4, s = argument5, 
	sc = argument6, a = argument7,
	s_name = string_replace(sprite_get_name(spr), "s_", ""),
	text = string(val) + " x " + s_name,
	loff = type == action_type.loot ? (s + 0.5) : 0,
	tx = xx + string_width(text) * sc, 
	ty = yy - string_height(text) * sc - s - loff;
draw_set_alpha(a - 0.25);
	draw_border(xx, ty, tx, yy - s - loff, c_ltgray, 0.75 * sc);
	draw_rectangle_color(xx, ty, tx, yy - s - loff, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
draw_text_transformed_color(xx, ty, val > 0 ? text : s_name, sc, sc, 0, c_red, c_red, c_red, c_red, 1);