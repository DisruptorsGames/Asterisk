/// @description Controls
event_inherited();

var game = o_controller.game,
	keys = keyboard_check_pressed(up) || keyboard_check_pressed(down) 
		|| keyboard_check_pressed(left) || keyboard_check_pressed(right);

if (path_position == 0)
{
	if (keyboard_check_pressed(toggle_inv))
		inv_show = !inv_show;

	if (!inv_show)
	{
		shake = keys;
		if (mouse_check_button_pressed(mb_left) && target == noone
			&& !tile_get_type(tile_type.solids, [tile_get_value(o_highlight.x, o_highlight.y)]))
			{
				target = o_highlight;
				playfield_update = true;
			}
	}
	
	// look around for danger!
	for (var i = 0; i < ds_list_size(nearme); i++)
	{
		var inst = nearme[| i];
		if (array_contains([o_rat], inst.object_index))
		{
			in_danger = true;
			break;
		}
	}
}