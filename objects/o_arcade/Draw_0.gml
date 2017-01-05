/// @description Draw Map
if (global.debug)
{
	for (var i = 0; i < ds_grid_width(map); i++)
	{
		for (var j = 0; j < ds_grid_height(map); j++)
		{
			var ix = i * width, iy = j * width,
				value = ds_grid_get(map, i, j),
				col = grid_free(ix, iy, 0, 0) ? c_blue : c_ltgray;
			draw_rectangle_color(ix, iy, ix + width, iy + height, col, col, col, col, true);
			draw_text_color_ext(ix, iy, value, c_white, 0.25, f_hud, fa_left);
		}
	}
	draw_set_alpha(0.25);
	mp_grid_draw(playfield);
	draw_set_alpha(1);
}