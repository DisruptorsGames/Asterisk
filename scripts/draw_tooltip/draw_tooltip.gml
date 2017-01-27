/// @function draw_tooltips
/// @param x
/// @param y
/// @param item
/// @param sprite
/// @param size
/// @param alpha
var xx = argument0, yy = argument1, itm = argument2, spr = argument3, s = argument4, a = argument5;
var s_name = string_replace(sprite_get_name(spr), "s_", ""), 
	loff = itm == action_type.loot ? (s + 0.5) : 0,
	tx = xx + string_width(s_name) * 0.25, 
	ty = yy - string_height(s_name) * 0.25 - s - loff;
draw_set_alpha(a - 0.25);
	draw_border(xx, ty, tx, yy - s - loff, c_ltgray, 0.75);
	draw_rectangle_color(xx, ty, tx, yy - s - loff, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
draw_text_transformed_color(xx, ty, s_name, 0.25, 0.25, 0, c_red, c_red, c_red, c_red, 1);