/// @description Draw Entity
event_inherited();

var game = o_controller.game;
image_blend = merge_color((boss ? hp_col : c_white), c_red, (hit / 100));

// path
if (path_position > 0)
{
	//draw_path(path, x, y, true);
	for (var i = 0; i < path_get_number(path); i++)
	{
		var ix = path_get_point_x(path, i), 
			iy = path_get_point_y(path, i);
		draw_circle_color(ix, iy, 2, c_black, c_black, false);
		draw_circle_color(ix, iy, 1, c_green, c_green, false);
		if (global.debug)
			printf(ix, iy, i, c_white, 0.75, f_hud, fa_left, 1, 0, false);
	}
}

// animation
if (dead)
{
	animation_set(id, anim_type.death);
	image_speed = 0;
}
else
{
	var frame = ani_map[? animation];
	if (array_length_1d(frame) > 0 && image_index > frame[array_length_1d(frame) - 1])
		image_index = frame[0];
	// flip image
	if (animation == anim_type.run || animation == anim_type.fight)
	{
		var c = animation == anim_type.run || amenu_target == noone 
			? xprevious > x 
			: amenu_target.x < x;
		image_xscale = c ? -1 : 1;
		sprite_set_offset(sprite_index, c ? -sprite_width : 0, 0);
	}
}

// steps
if (game.entity == id && steps > 0)
	printf(x, y + yoffset, steps, c_white, 0.75, f_hud, fa_left, 1, 0, false);

// health
if (game.entity != id && hp > 0 && hp < hp_max)
{
	draw_border(x, y - 5, x + image_xscale * sprite_width, y - 4, c_black, 1);
	draw_healthbar(x, y - 5, x + image_xscale * sprite_width, y - 4, (hp / hp_max) * 100, c_black, make_color_dpk(hp_col, 0.75, 0.75), hp_col, 0, true, true);
}

// effects
var first = ds_map_find_first(effects);
for (var i = 0; i < ds_map_size(effects); i++)
{
	var value = effects[? first], ticks = value[0], size = 4,
		iy = y + i * (size + 2);
	draw_sprite_ext(s_effects, first, x, iy, 0.25, 0.25, 0, c_white, 1);
	printf(x , iy, string(ticks), c_white, 0.75, f_hud, fa_left, 0.25, 0, false);
	first = ds_map_find_next(effects, first);
}