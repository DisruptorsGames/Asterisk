/// @description create a menu above an object
/// @param x
/// @param y
/// @param sprite
/// @param scale
/// @param menu items
var xx = argument0, yy = argument1, sprite = argument2,
    scale = argument3, menu = argument4,
    size = sprite_get_width(sprite),
    amenu = instance_exists(o_amenu) ? o_amenu : instance_create_depth(0, 0, depth - 1, o_amenu);
// toggle object
if (array_length_1d(menu) == 0)
    instance_deactivate_object(o_menu);
else
    instance_activate_object(o_menu);
// populate menu object
amenu.menu = menu;
amenu.owner = id;
amenu.scale = scale;
amenu.sprite = sprite;
amenu.size = sprite_get_width(sprite) * scale;
amenu.x = xx;
amenu.y = yy - size * scale;
// resize the surface to the size of the menu
var surf_width = array_length_1d(menu) > 0
    ? array_length_1d(menu) * (size + 2)
    : sprite_get_width(sprite);
surface_resize(amenu.surf, surf_width, size + 4);
// fill in the surface
surface_set_target(amenu.surf);
    draw_clear_alpha(c_black, 0);
    for (var i = 0; i < array_length_1d(menu); i++)
    {
        var ix = i * (size + 2);
        draw_rectangle_color(ix, 0, ix + size, size, c_ltgray, c_ltgray, c_ltgray, c_ltgray, false);
        draw_border(ix, 0, ix + size, size, c_dkgray, 1);
        draw_sprite_ext(sprite, menu[i], ix, 0, 1, 1, 0, c_white, 1);
    }
surface_reset_target();