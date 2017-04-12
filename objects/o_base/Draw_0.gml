/// @description Draw

// actual sprite
var hover = point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom);
draw_sprite_ext(sprite_index, image_index, x - 1, y - 1, image_xscale, image_yscale, image_angle, shell, hover ? 0.25 : 0);
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, shell, hover ? 0.25 : 0);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

// context menu
for (var i = 0; i < array_length_1d(amenu); i++)
{
	var item = amenu[i], size = 4,
		ix = amenu_x + i * (size + 3),
		iy = amenu_y - size - 2,
		hover = point_in_rectangle(mouse_x, mouse_y, ix - 0.5, iy - 0.5, ix + size + 0.5, iy + size + 0.5),
		scale = 0.25,
		alpha = hover ? 0.75 : 0.5,
		col = hover ? c_yellow : c_ltgray;
	if (hover)
	{
		amenu_item = item;
		if (item == action_type.loot && !amenu_target.locked)
		{
			var first = ds_map_find_first(amenu_target.inventory);
			for (var j = 0; j < ds_map_size(amenu_target.inventory); j++)
			{
				var value = amenu_target.inventory[? first],
					jx = ix + j * (size + 2),
					jy = iy - size - 2;
				draw_set_alpha(alpha);
					draw_border(jx, jy, jx + size, jy + size, make_color_comp(col), 0.5);
					draw_rectangle_color(jx, jy, jx + size, jy + size, c_black, c_black, c_black, c_black, false);
				draw_set_alpha(1);
				draw_sprite_ext(s_items, first, jx, jy, scale, scale, 0, c_white, 1);
				printf(jx, jy, string(value), c_white, 0.75, f_hud, fa_left, scale, 0, false);
				first = ds_map_find_next(amenu_target.inventory, first);
			}
			amenu_target.image_index = 1;
		}
		draw_tooltip(amenu_x, iy, enum_type.action, item, size, scale, alpha);
	}
	// draw the action item
	draw_set_alpha(alpha);
		draw_border(ix, iy, ix + size, iy + size, col, 0.5);
		draw_rectangle_color(ix, iy, ix + size, iy + size, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_sprite_ext(s_actions, item, ix + 0.5, iy + 0.5, 0.25, 0.25, 0, c_white, 1);
}
if (!point_in_rectangle(mouse_x, mouse_y, amenu_x - 0.5, amenu_y - 6.5, amenu_x + array_length_1d(amenu) * 6, amenu_y - 2))
	amenu_item = -1;