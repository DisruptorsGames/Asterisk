/// @description Player HUD
var count = 4;
for (var i = 0; i < count; i++)
{
	var s = sprite_get_width(s_highlight),
		cx = (vw - count * s) / 2,
		ix = cx + i * s, 
		iy = vh;
	draw_sprite_ext(s_highlight, -1, ix, iy, 1, 1, 0, c_dkgray, 0.95);
}