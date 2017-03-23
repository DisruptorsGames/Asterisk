/// @function draw_tooltips
/// @param x
/// @param y
/// @param type
/// @param size
/// @param scale
/// @param alpha
var xx = argument0, yy = argument1, type = argument2,
	s = argument3, sc = argument4, a = argument5,
	loff = type == action_type.loot ? (s + 0.5) : 0,
	tx = xx + 45 * sc,
	ty = yy - 2 - loff;
draw_set_alpha(a - 0.25);
	draw_border(xx, ty - s, tx, ty, c_ltgray, 1 * sc);
	draw_rectangle_color(xx, ty - s, tx, ty, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
printf(xx, ty - s, type, c_red, 1, f_hud, fa_left, sc, 0, false);