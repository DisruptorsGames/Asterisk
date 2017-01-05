/// @description Draw Entity

// path
if (has_path)
{
	//draw_path(path, x, y, true);
	for (var i = 0; i < path_get_number(path); i++)
	{
		var ix = path_get_point_x(path, i), iy = path_get_point_y(path, i),
			col = i < steps ? c_green : c_red;
		draw_circle_color(ix, iy, 2, c_black, c_black, false);
		draw_circle_color(ix, iy, 1, col, col, false);
		if (global.debug)
			draw_text_color_ext(ix, iy, i, c_white, 0.75, f_hud, fa_left);
	}
}

// entity
var hovering = point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom);
draw_sprite_ext(sprite_index, image_index, x, y - 6, shadow_xscale, image_yscale, shadow_angle, c_black, 0.65);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
// steps
if (steps > 0)
	draw_text_color_ext(x, y + yoffset, steps, c_white, 0.75, f_hud, fa_left);

// bounding box
if (global.debug)
{
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_red, c_red, c_red, c_red, true);
	draw_circle_color(x, y, 2, c_maroon, c_maroon, false);
}

// inventory
if (instance_exists(owner) && owner.inv_show)
{
	for (var i = 0; i < ds_grid_width(inventory); i++)
	{
		for (var j = 0; j < ds_grid_height(inventory); j++)
		{
			var ix = x + xoffset + i * inv_size, 
				iy = y + yoffset + j * inv_size, 
				item = inventory[# i, j],
				col = item > 0 ? c_red : c_gray;
			draw_rectangle_color(ix, iy, ix + inv_size, iy + inv_size, $10151a, $10151a, $10151a, $10151a, false);
			draw_rectangle_color(ix, iy, ix + inv_size, iy + inv_size, c_black, c_black, c_black, c_black, true);
			// show item
			draw_circle_color(ix + 4, iy + 4, 1, col, col, false);
			if (item > 0)
			{
				item.x = ix + 4;
				item.y = iy + 4;
			}
		}
	}
}