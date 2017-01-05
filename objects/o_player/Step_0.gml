/// @description Controls
event_inherited();

var game = o_controller.game,
	keys = keyboard_check_pressed(up) || keyboard_check_pressed(down) 
		|| keyboard_check_pressed(left) || keyboard_check_pressed(right);

// DEBUG
if (keyboard_check_pressed(vk_pageup) && max_items < vw / sprite_get_width(s_highlight))
	max_items++;
else if (keyboard_check_pressed(vk_pageup) && max_items > 1)
	max_items--;

if (!inv_show)
{
	if (keyboard_check_pressed(up) && grid_free(x, y, 0, 0))
		y -= game.height;
	else if (keyboard_check_pressed(down) && grid_free(x, y, 0, 2))
		y += game.height;
	if (keyboard_check_pressed(left) && grid_free(x, y, -1, 1))
	{
		x -= game.width;
		image_xscale = -1;
	}
	else if (keyboard_check_pressed(right) && grid_free(x, y, 1, 1))
	{
		x += game.width;
		image_xscale = 1;
	}
	
	// animation
	shake = keys;
	/*image_index += keys ? 1 : 0;
	if (image_index > 3)
		image_index = 0;*/

	if (mouse_check_button_pressed(mb_left))
	{
		if (target == noone)
			target = o_highlight;
	}
}
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