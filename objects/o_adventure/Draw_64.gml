/// @description Turns & Map
var aspect = o_controller.aspect;

if (surface_exists(map_surf))
	draw_surface_ext(map_surf, gw - surface_get_width(map_surf) * aspect, 0, aspect, aspect, 0, c_white, 0.75);

for (var i = 0; i < ds_list_size(order); i++)
{
	var e = order[| i],
		size = 16 * aspect, o = 2 * aspect,
		ix = o + i * (size + o), iy = o,
		left = e.sprite_width > 16 ? 16 : 0;
	draw_rectangle_color(ix, iy, ix + size, iy + size, e.hp_col, e.hp_col, e.hp_col, e.hp_col, false);
	draw_sprite_part_ext(e.sprite_index, 0, e.image_xscale * left, 0, 16, 16, ix, iy, aspect, aspect, c_white, 1);
	printf(ix, iy, string(e.priority), c_white, 1, f_hud, fa_left, 1, 0, true);
	if (global.debug)
		printf(ix, iy + 32, string(e.sprite_xoffset), c_red, 0.5, f_hud, fa_left, 1, 0 , false);
}