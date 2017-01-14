/// @description Drawing
var hover = point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom);
draw_sprite_ext(sprite_index, hover ? 1 : 0, x - sprite_width / 2, y - sprite_height / 2, 0.5, 0.5, image_angle, image_blend, image_alpha);