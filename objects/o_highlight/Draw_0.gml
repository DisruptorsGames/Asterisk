/// @description Debug Stuffz
if (instance_exists(o_player) && !o_player.inv_show)
{
	var game = o_controller.game, p = path_add();
	image_blend = (tile_get_type(tile_type.solids, [tile_get_value(x, y)]) 
		|| !mp_grid_path(game.playfield, p, o_player.x + o_player.xoffset, o_player.y + o_player.yoffset, x, y, false))
			? c_red : c_green;
	draw_self();

	if (global.debug)
		draw_text_color_ext(x, y, tile_get_value(x, y), c_white, 0.75, f_hud, fa_left);
	
	// display movement path
	if (p > 0 && o_player.path_position == 0)
	{
		for (var i = 0; i < path_get_number(p); i++)
		{
			var ix = path_get_point_x(p, i) div game.width * game.width, 
				iy = path_get_point_y(p, i) div game.height * game.height,
				col = array_contains([tile_type.tree], tile_get_value(ix, iy)) ? c_yellow : c_blue;
			draw_set_alpha(0.20)
			draw_rectangle_color(ix + 1, iy + 1, ix + game.width - 1, iy + game.height - 1, col, col, col, col, false);
			draw_set_alpha(1);
		}
	}
}