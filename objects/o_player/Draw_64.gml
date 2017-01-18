/// @description Player HUD

var aspect = o_controller.aspect;

// portrait
draw_sprite_ext(s_aster_portrait, -1, 0, gh - sprite_get_height(s_portrait) * aspect, aspect, aspect, 0, c_white, 1);
draw_sprite_ext(s_portrait, -1, 0, gh - sprite_get_height(s_portrait) * aspect, aspect, aspect, 0, c_dkgray, 0.95); 
// health
var xx = sprite_get_width(s_portrait) * aspect + 2,
	yy = gh - sprite_get_height(s_bar) * aspect;
draw_healthbar(xx + 1, yy + 1, xx + sprite_get_width(s_bar) * aspect - 1, yy + sprite_get_height(s_bar) * aspect - 1, (health / hp_max) * 100, c_black, hp_col, hp_col, 3, false, true);
draw_sprite_ext(s_bar, -1, xx, yy, aspect, aspect, 0, c_dkgray, 0.95);
draw_text_color(xx, yy, hp, c_white, c_white, c_white, c_white, 0.75);
// chi
xx += sprite_get_width(s_bar) * aspect;
draw_healthbar(xx + 1, yy + 1, xx + sprite_get_width(s_bar) * aspect - 1, yy + sprite_get_height(s_bar) * aspect - 1, (chi / chi_max) * 100, c_black, chi_col, chi_col, 3, false, true);
draw_sprite_ext(s_bar, -1, xx, yy, aspect, aspect, 0, c_dkgray, 0.95);
draw_text_color(xx, yy, chi, c_white, c_white, c_white, c_white, 0.75);
// exit icon
if (can_exit)
	draw_sprite_ext(s_exit, 0, xx + sprite_get_width(s_bar) * aspect, yy, aspect, aspect, 0, c_white, 0.95);

// hotbar
for (var i = 0; i < ds_list_size(hotbar); i++)
{
	var values = hotbar[| i], 
		width = 16 * aspect, height = 16 * aspect,
		cx = (gw - ds_list_size(hotbar) * width) / 2,
		ix = cx + i * (width + 2),
		iy = gh - height - 2;
	draw_sprite_ext(s_highlight, -1, ix, iy, aspect, aspect, 0, c_white, 1);
	var hover = point_in_rectangle(gmx, gmy, ix, iy, ix + width, iy + height);
	inv_show = hover;
	for (var j = 0; j < array_length_1d(values); j++)
	{
		var jy = iy - height * j - 2, sprite = values[j];
		if (sprite_exists(sprite) && (/*inv_show &&*/ hover || j == 0))
			draw_sprite_ext(sprite, 0, ix + sprite_get_xoffset(sprite) * aspect, jy, aspect, aspect, 0, c_white, 1);
		if (global.debug)
		{
			draw_text_color_ext(ix, jy, round(jy), c_white, 0.95, f_hud, fa_left);
			draw_rectangle_color(ix, jy, ix + width, jy + height, c_white, c_white, c_white, c_white, true);
		}
	}
}





