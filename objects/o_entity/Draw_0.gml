/// @description Draw Entity
var game = o_controller.game;
// path
if (path_position > 0)
{
	//draw_path(path, x, y, true);
	for (var i = 0; i < path_get_number(path); i++)
	{
		var ix = path_get_point_x(path, i), iy = path_get_point_y(path, i),
			col = i <= steps ? c_green : c_red;
		draw_circle_color(ix, iy, 2, c_black, c_black, false);
		draw_circle_color(ix, iy, 1, col, col, false);
		if (global.debug)
			draw_text_color_ext(ix, iy, i, c_white, 0.75, f_hud, fa_left);
	}
}

// animation
var frame = ani_map[? animation];
if (array_length_1d(frame) > 0 && image_index > frame[array_length_1d(frame) - 1])
	image_index = frame[0];
// flip image
if (animation == anim_type.run)
{
	var c = xprevious > x;
	image_xscale = c ? -1 : 1;
	sprite_set_offset(sprite_index, c ? -sprite_width : 0, 0);
}

// entity
var alpha = point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) ? 0.65 : 0.25;
draw_sprite_ext(sprite_index, image_index, x - 1, y - 1, image_xscale, image_yscale, image_angle, shell, alpha);
draw_sprite_ext(sprite_index, image_index, x + 1, y + 1, image_xscale, image_yscale, image_angle, shell, alpha);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

// steps
if (steps > 0)
	draw_text_color_ext(x, y + yoffset, steps, c_white, 0.75, f_hud, fa_left);	

// health & chi
if (hp > 0 && hp < hp_max)
{
	draw_border(x, y - 5, x + image_xscale * sprite_width, y - 4, c_black, 1);
	draw_healthbar(x, y - 5, x + image_xscale * sprite_width, y - 4, (hp / hp_max) * 100, c_black, make_color_dpk(hp_col, 0.75, 0.75), hp_col, 0, true, true);
}
/*if (idle > 0 && path_position == 0)
	draw_healthbar(x, y - 0.25, x + image_xscale * sprite_width, y, (idle / idle_t) * 100, c_black, c_white, chi_col, 0, false, false);*/

// context menu
for (var i = 0; i < array_length_1d(amenu); i++)
{
	var item = amenu[i], size = 4, 
		sprite = action_sprite(item),
		ix = amenu_x + i * (size + 3),
		iy = amenu_y - size - 2,
		hover = point_in_rectangle(mouse_x, mouse_y, ix - 0.5, iy - 0.5, ix + size + 0.5, iy + size + 0.5),
		index = hover ? 1 : 0,
		alpha = hover ? 0.75 : 0.5, 
		col = hover ? c_yellow : c_ltgray;
	if (hover)
	{
		amenu_item = item;
		if (item == action_type.loot)
		{
			for (var j = 0; j < ds_list_size(amenu_target.inventory); j++)
			{
				var junk = amenu_target.inventory[| j],
					jx = ix + j * (size + 2), 
					jy = iy - size - 2;
				draw_set_alpha(alpha);
					draw_border(jx, jy, jx + size, jy + size, make_color_comp(col), 0.5);
					draw_rectangle_color(jx, jy, jx + size, jy + size, c_black, c_black, c_black, c_black, false);
				draw_set_alpha(1);
				draw_sprite_ext(junk, 0, jx, jy, 0.25, 0.25, 0, c_white, 1);
			}
		}
	}
	draw_set_alpha(alpha);
		draw_border(ix, iy, ix + size, iy + size, col, 0.5);
		draw_rectangle_color(ix, iy, ix + size, iy + size, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	draw_sprite_ext(sprite, index, ix + 0.5, iy + 0.5, 0.25, 0.25, 0, c_white, 1);
}
if (!point_in_rectangle(mouse_x, mouse_y, amenu_x - 0.5, amenu_y - 6.5, amenu_x + array_length_1d(amenu) * 6, amenu_y - 2))
	amenu_item = -1;

// show turn indicator
if (game.entity == id)
	draw_sprite_ext(s_hover, -1, x + image_xscale * sprite_width / 2, y - game.height - 6, 0.75, 0.75, 0, shell, 0.5);

// bounding box data
if (global.debug)
{
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_red, c_red, c_red, c_red, true);
	draw_circle_color(x, y, 1, c_maroon, c_maroon, false);
	draw_text_color_ext(bbox_right, y, depth, c_orange, 0.5, f_hud, fa_right);
	// amenu
	draw_set_alpha(0.20);
		draw_rectangle_color(amenu_x - 0.5, amenu_y - 6.5, amenu_x + array_length_1d(amenu) * 6, amenu_y - 2, c_orange, c_orange, c_orange, c_orange, false);
	draw_set_alpha(1);
}

// draw fog
if (fog_update)
{
	surface_set_target(game.fog_surf);
	draw_clear_alpha(c_black, 0);
	for (var i = 0; i < vw; i++)
	{
		for (var j = 0; j < vh; j++)
		{
			var ix = i * game.width, iy = j * game.height, 
				c = point_distance(x, y, ix, iy) > round(moves * 1.25) * game.width;
			draw_set_alpha(c ? 0.95 : 0);
			draw_rectangle_color(ix, iy, ix + game.width, iy + game.height, c_black, c_black, c_black, c_black, false);
			draw_set_alpha(1);
		}
	}
	surface_reset_target();
	fog_update = false;
}
