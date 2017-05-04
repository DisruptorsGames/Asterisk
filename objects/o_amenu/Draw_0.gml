/// @description Draw Surface
if (surface_exists(surf))
    draw_surface_ext(surf, x, y, scale, scale, 0, global.debug ? c_orange : c_white, 1);

if (hover && item != noone)
{
    var xx = x + item_index * size, col = owner.chi_col;
    draw_set_alpha(0.35);
        draw_rectangle_color(xx, y, xx + size, y + size, col, col, col, col, false);
    draw_set_alpha(1);
    if (global.debug)
        printf(xx, y, string(item_index), c_white, 1, f_hud, fa_left, scale, 0, false);
}
