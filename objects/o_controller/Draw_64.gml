/// @description Draw Debug
if (global.debug)
{
	var text = "Surface: " + string(sw) + "x" + string(sh)
		+ "\nView: " + string(vw) + "x" + string(vh) + ":" + string(camera_get_active())
		+ "\nPort: " + string(view_wport[0]) + "x" + string(view_hport[0])
		+ "\nGUI: " + string(gw) + "x" + string(gh)
		+ "\nRoom: " + string(room_width) + "x" + string(room_height)
		+ "\nPath: " + string(instance_exists(o_player) ? o_player.path_position : "???")
			+ "/" + string(instance_exists(o_player) ? path_get_number(o_player.path) : "???");
	draw_text_color_ext(gw, 0, text, c_white, 0.95, f_hud, fa_right);
}