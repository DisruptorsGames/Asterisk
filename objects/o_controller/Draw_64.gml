/// @description Heads up Display

var text = "";

if (global.debug)
	text = "Surface: " + string(sw) + "x" + string(sh)
		+ "\nView: " + string(vw) + "x" + string(vh) + ":" + string(camera_get_active())
		+ "\nPort: " + string(view_wport[0]) + "x" + string(view_hport[0])
		+ "\nGUI: " + string(gw) + "x" + string(gh)
		+ "\nRoom: " + string(room_width) + "x" + string(room_height)
		+ "\nPlayer: " + string(instance_exists(o_player) ? (string(o_player.animation) + ">" + string(o_player.image_index)) : "???")
		+ "\nDir: " + string(instance_exists(o_player) ? string(o_player.direction) : "???");
else
	text = string(instance_exists(game) ? string(game.combat) : "???");

draw_text_color_ext(gw, 0, text, c_white, 0.95, f_hud, fa_right);

draw_text_color_ext((gw - string_width(string(fps_real))) / 2, 0, string(fps_real), c_red, 1, f_hud, fa_left);