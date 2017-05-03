/// @function sprite_create
/// @param sprite
/// @param subimage
var sprite = argument0, subimage = argument1,
    w = sprite_get_width(sprite), h = sprite_get_height(sprite),
    surf = surface_create(w, h);
surface_set_target(surf);
    draw_sprite(sprite, subimage, 0, 0);
surface_reset_target();
var spr = sprite_create_from_surface(surf, 0, 0, w, h, true, false, 0, 0);
surface_free(surf);
return spr;