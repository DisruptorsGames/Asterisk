/// @description Heads up Display

var text = "", game = o_controller.game;

if (global.debug)
	text = "Surface: " + string(sw) + "x" + string(sh)
		+ "\nView: " + string(vw) + "x" + string(vh) + ":" + string(camera_get_active())
		+ "\nPort: " + string(view_wport[0]) + "x" + string(view_hport[0])
		+ "\nGUI: " + string(gw) + "x" + string(gh)
		+ "\nRoom: " + string(room_width) + "x" + string(room_height)
		+ "\nTile: " + string(instance_exists(o_player) ? string(tile_get_value(o_player.x + o_player.xoffset, o_player.y + o_player.yoffset)) : "???")
		+ "\nPath: " + string(instance_exists(o_player) ? (string(o_player.target) 
			+ ":" + string(o_player.path_position) 
			+ ":" + string(o_player.has_path)
			+ ":" + string(path_get_number(o_player.path))) : "???")
		+ "\nUpdates: " + string(game.pf_updates)
			+ ":" + string(instance_exists(o_player) ? string(o_player.idle) : "???")
		+ "\nDanger: " + string(instance_exists(o_player) ? string(o_player.in_danger) : "???")
		+ "\nMouse: " + string(gmx) + "x" + string(gmy)
		+ "\nExit: " + string(instance_exists(o_player) ? string(o_player.can_exit) : "???");
else
	text = string(instance_exists(game) ? string(game.combat) : "???");

draw_text_color_ext(gw, 0, text, c_white, 0.95, f_hud, fa_right);
draw_text_color_ext((gw - string_width(string(fps_real))) / 2, 0, string(fps_real), c_red, 1, f_hud, fa_left);