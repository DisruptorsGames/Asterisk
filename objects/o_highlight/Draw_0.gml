/// @description Debug Stuffz
var game = o_controller.game;
if (instance_exists(target) && target.path_position == 0 && array_length_1d(target.amenu) == 0 && !target.hotbar_hover)
{
	var p = path_add();
	image_blend = (tile_get_type(tile_type.solids, [tile_get_value(x, y)]) 
		|| !mp_grid_path(game.playfield, p, target.x + target.xoffset, target.y + target.yoffset, x, y, false))
			? c_red : c_green;
	draw_self();

	if (global.debug)
		draw_text_color_ext(x, y, tile_get_value(x, y), c_white, 0.75, f_hud, fa_left);
	
	// display movement path
	if (p > 0)
	{
		for (var i = 0; i < path_get_number(p); i++)
		{
			var ix = path_get_point_x(p, i) div game.width * game.width, 
				iy = path_get_point_y(p, i) div game.height * game.height,
				is_tree = tile_get_type([tile_type.tree], [tile_get_value(ix, iy)]),
				col = i <= target.steps ? (is_tree ? c_yellow : c_blue) : c_maroon;
			draw_set_alpha(0.20)
			draw_rectangle_color(ix + 1, iy + 1, ix + game.width - 1, iy + game.height - 1, col, col, col, col, false);
			draw_set_alpha(1);
		}
	}
}
else
{
	draw_set_alpha(0.20);
	draw_rectangle_color(target.amenu_x, target.amenu_y, target.amenu_x + game.width, target.amenu_y + game.height, c_blue, c_blue, c_blue, c_blue, false);
	draw_set_alpha(1);
}