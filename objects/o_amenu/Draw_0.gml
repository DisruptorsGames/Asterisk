/// @description Draw Surface
if (surface_exists(surf))
    draw_surface_ext(surf, x, y, scale, scale, 0, global.debug ? c_orange : c_white, 1);

if (hover && item != noone)
{
    var xx = bsize + x + item_index * (size + offset),
        yy = bsize + y,
        col = owner.chi_col;
    draw_border(xx, yy, xx + size, y + size, global.debug ? c_yellow : col, 0.50, bsize);
    if (global.debug)
        printf(xx, yy, tostr([item_index, array_length_1d(menu), "\nI:", xx, xx + size, "\nM:", mouse_x, mouse_x + size], ""), c_white, 1, f_hud, fa_left, scale, 0, false);
}

if (global.debug)
    draw_circle_color(x, y, 0.5, c_red, c_red, false);