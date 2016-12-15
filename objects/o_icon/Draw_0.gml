/// @description Drawing
if (owner.owner.inv_show)
{
	draw_self();

	// tooltip ToDo: fix up...
	if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom))
	{
		draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
}