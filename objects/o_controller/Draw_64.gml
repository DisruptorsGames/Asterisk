/// @description Heads up Display

var text = "", game = o_controller.game;

if (global.debug)
	text = "Surface: " + string(sw) + "x" + string(sh)
		+ "\nView: " + string(vw) + "x" + string(vh) + ":" + string(camera_get_active())
		+ "\nPort: " + string(view_wport[0]) + "x" + string(view_hport[0])
		+ "\nGUI: " + string(gw) + "x" + string(gh)
		+ "\nRoom: " + string(room_width) + "x" + string(room_height)
		+ "\nMouse: " + string(o_highlight.x) + "x" + string(o_highlight.y)
		+ "\nEntity:" + string(game.entity > 0 ? (string(game.entity.x) + "x" + string(game.entity.y)) : "???")
		+ "\nAMenu: " + string(game.entity > 0 ? string(game.entity.amenu_item) : "???")
		+ "\nInv: " + string(game.entity > 0 ? string(game.entity.inventory_item) : "???");

draw_text_color_ext(gw, 0, text, c_white, 0.95, f_hud, fa_right);
draw_text_color_ext((gw - string_width(string(fps_real))) / 2, 0, string(fps_real), c_red, 1, f_hud, fa_left);