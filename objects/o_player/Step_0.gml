/// @description Controls
event_inherited();

var game = o_controller.game;

if (!inv_show)
{
	if (keyboard_check_pressed(up) && grid_free(x, y, 0, 0))
		y -= game.height;
	else if (keyboard_check_pressed(down) && grid_free(x, y, 0, 2))
		y += game.height;
	if (keyboard_check_pressed(left) && grid_free(x, y, -1, 1))
		x -= game.width;
	else if (keyboard_check_pressed(right) && grid_free(x, y, 1, 1))
		x += game.width;

	if (mouse_check_button_pressed(mb_left))
	{
		if (target == noone)
			target = o_highlight;
		// ToDo: add mour enemy types
		// ToDo: attack enemy **Milestone**
		// ToDo: add inventory **Milestone**
		// ToDo: add looting  **Milestone**
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

shake = keyboard_key == up || keyboard_key == down 
	|| keyboard_key == left || keyboard_key == right;