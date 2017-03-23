/// @description Heads up Display
var game = o_controller.game, aspect = o_controller.aspect;
if (game.entity != id)
	return;

// portrait
if (portrait != noone)
	draw_sprite_ext(portrait, -1, 0, gh - sprite_get_height(s_portrait) * aspect, aspect, aspect, 0, merge_color(c_red, c_white, hp / hp_max), 1);
draw_sprite_ext(s_portrait, -1, 0, gh - sprite_get_height(s_portrait) * aspect, aspect, aspect, 0, c_dkgray, 0.95);
// name
printf(0, gh - sprite_get_height(s_portrait) * aspect - string_height(name), name, hp_col, 0.75, f_hud, fa_left, 1.25, 0, true);
var tname = instance_exists(amenu_target) ? ("-> " + amenu_target.name) : "",
	tcol = instance_exists(amenu_target) ? amenu_target.hp_col : c_white;
// target
printf(string_width(name) * 1.25, gh - sprite_get_height(s_portrait) * aspect - string_height(name), tname, tcol, 0.75, f_hud, fa_left, 1.25, 0, true);
// health
var xx = sprite_get_width(s_portrait) * aspect + 2,
	yy = gh - sprite_get_height(s_bar) * aspect;
draw_healthbar(xx + 1, yy + 1, xx + sprite_get_width(s_bar) * aspect - 1, yy + sprite_get_height(s_bar) * aspect - 1, (hp / hp_max) * 100, c_black, hp_col, hp_col, 3, false, true);
draw_sprite_ext(s_bar, -1, xx, yy, aspect, aspect, 0, c_dkgray, 0.95);
printf(xx, yy, hp, c_white, 0.75, f_hud, fa_left, 1, 0, false);
// chi
xx += sprite_get_width(s_bar) * aspect;
draw_healthbar(xx + 1, yy + 1, xx + sprite_get_width(s_bar) * aspect - 1, yy + sprite_get_height(s_bar) * aspect - 1, (chi / chi_max) * 100, c_black, chi_col, chi_col, 3, false, true);
draw_sprite_ext(s_bar, -1, xx, yy, aspect, aspect, 0, c_dkgray, 0.95);
printf(xx, yy, chi, c_white, 0.75, f_hud, fa_left, 1, 0, false);

// inventory
var size = 16 * aspect,
	cx = (gw - ds_map_size(inventory) * size) / 2,
	cy = gh - size - 2,
	first = ds_map_find_first(inventory);
for (var i = 0; i < ds_map_size(inventory); i++)
{
	var value = inventory[? first],
		ix = cx + i * (size + 2);
	draw_sprite_ext(s_highlight, -1, ix, cy, aspect, aspect, 0, c_white, 1);
	var hover = point_in_rectangle(gmx, gmy, ix, cy, ix + size, cy + size) && !npc 
		&& array_length_1d(amenu) == 0;
	draw_sprite_ext(s_items, first, ix + sprite_get_xoffset(s_items) * aspect, cy, aspect, aspect, 0, c_white, 1);
	if (hover)
	{
		inventory_item = first;
		draw_tooltip(ix, cy, first, size, aspect, 1);
	}
	printf(ix, cy, value, c_white, npc ? 0.25 : 0.95, f_hud, fa_left, 1, 0, true);
	if (npc)
	{
		draw_set_alpha(0.85);
			draw_rectangle_color(ix, cy, ix + size, cy + size, c_black, c_black, c_black, c_black, false);
		draw_set_alpha(1);
	}
	first = ds_map_find_next(inventory, first);
}
if (!point_in_rectangle(gmx, gmy, cx, cy, cx + ds_map_size(inventory) * (size + 2), cy + size))
	inventory_item = -1;

if (global.debug)
{
	draw_set_alpha(0.2);
		draw_rectangle_color(cx, cy, cx + ds_map_size(inventory) * (size + 2), cy + size, c_orange, c_orange, c_orange, c_orange, false);
	draw_set_alpha(1);
}