/// @description Draw
if (sprite_index != -1)
	draw_self();
// floating text
draw_set_font(f_hud);
	draw_text_transformed_color(x - 1, y - 1, text, image_xscale, image_yscale, 0, c_black, c_black, c_black, c_black, image_alpha);
	draw_text_transformed_color(x, y, text, image_xscale, image_yscale, 0, image_blend, image_blend, image_blend, image_blend, image_alpha);
draw_set_font(-1);

if (global.debug)
{
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_red, c_red, c_red, c_red, false);
	draw_border(bbox_left, bbox_top, bbox_right, bbox_bottom, c_black, 0.75);
}