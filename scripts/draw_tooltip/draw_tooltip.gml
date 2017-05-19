/// @function draw_tooltips
/// @param x
/// @param y
/// @param enum
/// @param type
/// @param size
/// @param scale
/// @param alpha
var xx = argument0, yy = argument1,
    enum_t = argument2, enum_v = argument3,
    s = argument4, sc = argument5, a = argument6,
    loff = enum_t == enum_type.action
        && enum_v == action_type.loot
            ? (s + 0.5)
            : 0,
    name = enum_get_name(enum_t, enum_v),
    tx = xx + string_width(name) * sc,
    ty = yy - 2 - loff;
draw_set_alpha(a - 0.25);
    draw_border(xx, ty - s, tx, ty, c_ltgray, 1 * sc, 0);
    draw_rectangle_color(xx, ty - s, tx, ty, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
printf(xx, ty - s, name, c_red, 1, f_hud, fa_left, sc, 0, false);