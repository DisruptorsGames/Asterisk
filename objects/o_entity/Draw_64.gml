/// @description Heads up Display
var game = o_controller.game, aspect = o_controller.aspect;
if (game.entity != id)
	return;

// portrait
if (portrait != noone)
	draw_sprite_ext(portrait, -1, 0, gh - sprite_get_height(s_portrait) * aspect, aspect, aspect, 0, c_white, 1);
draw_sprite_ext(s_portrait, -1, 0, gh - sprite_get_height(s_portrait) * aspect, aspect, aspect, 0, c_dkgray, 0.95);
draw_text_color_ext(0, gh - sprite_get_height(s_portrait) * aspect - string_height(name), name, hp_col, 0.75, f_hud, fa_left);
var tname = instance_exists(amenu_target) && amenu_target != noone
	? object_get_name(amenu_target.object_index)
	: "";
draw_text_color_ext(string_width(name) + 2, gh - sprite_get_height(s_portrait) * aspect - string_height(tname), tname, c_white, 0.75, f_hud, fa_left);
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
	var hover = point_in_rectangle(gmx, gmy, ix, cy, ix + size, cy + size) && !npc;
	if (hover)
	{
		inventory_item = first;
		draw_tooltip(ix, cy, noone, first, value, size, aspect, 1);
	}
	draw_sprite_ext(first, hover ? 1 : 0, ix + sprite_get_xoffset(first) * aspect, cy, aspect, aspect, 0, c_white, 1);
	if (npc)
	{
		draw_set_alpha(0.85);
			draw_rectangle_color(ix, cy, ix + size, cy + size, c_gray, c_gray, c_gray, c_gray, false);
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