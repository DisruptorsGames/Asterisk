/// @description Draw
if (sprite_index != -1)
	draw_self();
// floating text
printf(x, y, text, image_blend, image_alpha, f_hud, fa_left, image_xscale, 0, true);

if (global.debug)
{
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_red, c_red, c_red, c_red, false);
	draw_border(bbox_left, bbox_top, bbox_right, bbox_bottom, c_black, 0.75);
}