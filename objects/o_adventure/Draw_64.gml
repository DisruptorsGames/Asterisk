/// @description Display Turns
if (!global.debug)
{
	var text = "Turn: " + string(entity > 0 ? string(entity.name) : "noone")
		+ "\nLog: " + array_join("\n", log);
	draw_text_color_ext(gw, 0, text, c_white, 0.95, f_hud, fa_right);
}