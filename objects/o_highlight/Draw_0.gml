/// @description Debug Stuffz
var game = o_controller.game;
if (target != noone
	&& game.timer == game.time
	&& target.path_position == 0)
{
	// highlight
	if (array_length_1d(target.amenu) == 0)
	{
		image_blend = tile_get_type(tile_type.solids, [tile_get_value(x, y)]) ? c_red : c_green;
		draw_self();
		if (global.debug)
			printf(x, y, tile_get_value(x, y), c_white, 0.75, f_hud, fa_left, 1, 0, false);
	}
	// path
	else if (target.path != -1 && array_length_1d(target.amenu) > 0)
	{
		for (var i = 0; i < path_get_number(target.path); i++)
		{
			var ix = path_get_point_x(target.path, i) div game.width * game.width, 
				iy = path_get_point_y(target.path, i) div game.height * game.height,
				is_tree = tile_get_type([tile_type.tree], [tile_get_value(ix, iy)]),
				col = i <= target.steps ? (is_tree ? c_yellow : c_blue) : c_red;
			draw_set_alpha(0.25)
				draw_rectangle_color(ix + 1, iy + 1, ix + game.width - 1, iy + game.height - 1, col, col, col, col, false);
			draw_set_alpha(1);
			if (i == path_get_number(target.path) - 1)
				draw_sprite_ext(s_highlight, 0, ix, iy, 1, 1, 0, col, 0.75);
		}
	}
}