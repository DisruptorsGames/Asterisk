/// @description Player HUD

var aspect = o_controller.aspect;

// portrait
draw_sprite_ext(s_portrait, -1, 0, gh - sprite_get_height(s_portrait) * aspect, aspect, aspect, 0, c_dkgray, 0.95); 
// health and mana
draw_sprite_ext(s_bar, -1, sprite_get_width(s_portrait) * aspect + 2, gh - sprite_get_height(s_bar) * aspect, aspect, aspect, 0, c_dkgray, 0.95);

// hotbar
for (var i = 0; i < max_items; i++)
{
	var s = sprite_get_width(s_highlight) * aspect,
		cx = (gw - max_items * s) / 2;
	draw_sprite_ext(s_highlight, -1, cx + i * s, gh - sprite_get_height(s_highlight) / 2 * aspect, aspect, aspect, 0, c_dkgray, 0.95);
}