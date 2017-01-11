/// @description Debug Stuffz
if (instance_exists(o_player) && !o_player.inv_show)
{
	var game = o_controller.game;
	image_blend = tile_get_type(tile_type.solids, map_find_value(x, y, 0, 0))  ? c_red : c_green;
	draw_self();

	if (global.debug)
	{
		var text = string(x - sprite_xoffset) + "," + string(y - sprite_yoffset)
			+ "\n" + string(map_find_value(x, y, 0, 0));
		draw_text_color_ext(x, y, text, c_white, 0.75, f_hud, fa_left);
	}
}