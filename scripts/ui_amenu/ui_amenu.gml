/// @description create a menu above an object
/// @param x
/// @param y
/// @param sprite
/// @param scale
/// @param menu items
var xx = argument0, yy = argument1, sprite = argument2,
    scale = argument3, menu = argument4,
    size = sprite_get_width(sprite),
    bsize = 1,
    col = c_dkgray,
    surf_width = array_length_1d(menu) > 0
        ? array_length_1d(menu) * (size + 4 + bsize)
        : sprite_get_width(sprite),
    amenu = instance_exists(o_amenu)
        ? o_amenu
        : instance_create_depth(0, 0, depth - 1, o_amenu);
// toggle object
if (array_length_1d(menu) == 0)
    instance_deactivate_object(o_menu);
else
    instance_activate_object(o_menu);
// populate menu object
amenu.x = xx;
amenu.y = yy - amenu.size;
amenu.menu = menu;
amenu.owner = id;
amenu.scale = scale;
amenu.sprite = sprite;
// scale menu
amenu.size = size * scale;
amenu.offset = 4 * scale;
amenu.bsize = bsize * scale;
// resize the surface to the size of the menu
surface_resize(amenu.surf, surf_width, size + bsize * 2);
// fill in the surface
surface_set_target(amenu.surf);
    draw_clear_alpha(c_black, global.debug ? 0.5 : 0);
    for (var i = 0; i < array_length_1d(menu); i++)
    {
        var ix = bsize + i * (size + 4);
        draw_border(ix, bsize, ix + size, size, c_ltgray, 1, bsize);
        draw_rectangle_color(ix, bsize, ix + size, size, col, col, col, col, false);
        draw_sprite_ext(sprite, menu[i], ix, bsize, 1, 1, 0, c_white, 1);
    }
surface_reset_target();