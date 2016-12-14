/// @description Draw Entity

// path
if (has_path)
{
	//draw_path(path, x, y, true);
	for (var i = 0; i < path_get_number(path); i++)
	{
		var ix = path_get_point_x(path, i), iy = path_get_point_y(path, i),
			col = i < steps ? c_green : c_red;
		draw_circle_color(ix, iy, 3, c_black, c_black, false);
		draw_circle_color(ix, iy, 2, col, col, false);
		if (global.debug)
			draw_text_color_ext(ix, iy, i, c_white, 0.75, f_hud, fa_left);
	}
}
// highlight
if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom))
{
	switch (object_index)
	{
		case o_player:
			shell = c_dkgray;
			break;
		case o_enemy:
			shell = c_gray;
			break;
	}
}
else
	shell = c_black;
// entity
draw_sprite_ext(sprite_index, 0, x + 2, y - 2, shadow_xscale, image_yscale, shadow_angle, c_black, 0.65);
draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, shell, image_alpha);
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
// steps
draw_text_color_ext(x, y, steps, c_white, 0.75, f_hud, fa_left);

// bounding box
if (global.debug)
{
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_red, c_red, c_red, c_red, true);
	draw_circle_color(x, y, 1, c_maroon, c_maroon, false);
}
