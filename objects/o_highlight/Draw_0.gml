/// @description Debug Stuffz
var game = o_controller.game;
image_blend = grid_snapped(id) ? c_green : c_red;
draw_self();

if (global.debug)
{
	var text = string(x - sprite_xoffset) + "," + string(y - sprite_yoffset);
	draw_text_color_ext(x, y, text, c_white, 0.75, f_hud, fa_left);
}