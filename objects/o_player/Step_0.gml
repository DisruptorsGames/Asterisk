/// @description Controls
event_inherited();

var game = o_controller.game,
	keys = keyboard_check_pressed(up) || keyboard_check_pressed(down) 
		|| keyboard_check_pressed(left) || keyboard_check_pressed(right);

if (path_position == 0)
{
	if (keyboard_check_pressed(toggle_inv))
	{
		inv_show = !inv_show;
		if (!instance_exists(o_backpack))
		{
			var backpack = instance_create_layer(x + sprite_width, y + sprite_height, "Instances", o_backpack);
			backpack.owner = id;
		}
		else
		{
			// toggle existing backpack
			var backpack = instance_nearest(x, y, o_backpack);
			backpack.x = x + sprite_width;
			backpack.y = y + sprite_height;
			backpack.visible = !backpack.visible;
		}
	}

	if (!inv_show)
	{
		shake = keys;
		if (mouse_check_button_pressed(mb_left) && target == noone
			&& !tile_get_type(tile_type.solids, tile_get_value(o_highlight.x, o_highlight.y)))
				target = o_highlight;
	}
}

/*


















*/