/// @description Player HUD
for (var i = 0; i < max_items; i++)
{
	var s = sprite_get_width(s_highlight),
		cx = (gw - max_items * s) / 2;
	draw_sprite_ext(s_highlight, -1, cx + i * s, gh, 1, 1, 0, c_dkgray, 0.95);
}