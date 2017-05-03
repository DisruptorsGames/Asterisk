/// @description Draw Surface
if (surface_exists(surf))
    draw_surface_ext(surf, x, y, scale, scale, 0, hover ? c_yellow : c_white, 1);

if (hover && item != noone)
{
    var xx = x + item_index * size;
    draw_set_alpha(0.25);
        draw_rectangle_color(xx, y, xx + size, y + size, c_red, c_red, c_red, c_red, false);
    draw_set_alpha(1);
    printf(xx, y, string(item_index), c_white, 1, f_hud, fa_left, scale, 0, false);
}
