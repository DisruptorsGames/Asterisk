/// @description Draw

// bounding box
if (global.debug)
    draw_border(bbox_left, bbox_top, bbox_right, bbox_bottom, c_red, 0.75, 0);

// actual sprite
var hover = point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom);
draw_sprite_ext(sprite_index, image_index, x - 1, y - 1, image_xscale, image_yscale, image_angle, shell, hover ? 0.25 : 0);
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, shell, hover ? 0.25 : 0);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);