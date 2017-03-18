/// @description MAP?
/*var aspect = o_controller.aspect, size = 8 * aspect, 
	sx = gw - ds_grid_width(map) * (size + 2);
for (var i = 0; i < ds_grid_width(map); i++)
{
	for (var j = 0; j < ds_grid_height(map); j++)
	{
		var r = map[# i, j], col = r == 2 ? c_green : c_dkgray,
			ix = sx + i * (size + 2), iy = 2 + j * (size + 2);
		if (r > 0)
		{
			draw_rectangle_color(ix, iy, ix + size, iy + size, col, col, col, col, true);
			draw_text_transformed_color(ix, iy, r, 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 0.5);
		}
	}
}*/
var aspect = o_controller.aspect;
for (var i = 0; i < ds_list_size(order); i++)
{
	var e = order[| i],
		size = 16 * aspect, o = 2 * aspect,
		ix = o + i * (size + o), iy = o,
		col = e.hp_col;
	draw_rectangle_color(ix, iy, ix + size, iy + size, col, col, col, col, false);
	draw_sprite_part_ext(e.sprite_index, 0, e.sprite_width > 16 ? 16 : 0, 0, 16, 16, ix, iy, aspect, aspect, c_white, 1);
	draw_text_color_ext(ix, iy, string(e.priority), c_white, 1, f_hud, fa_left);
}