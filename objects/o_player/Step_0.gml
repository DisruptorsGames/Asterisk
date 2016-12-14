/// @description Controls
event_inherited();

var game = o_controller.game;
if (keyboard_check_pressed(up) && grid_free(x, y - game.height))
	y -= game.height;
else if (keyboard_check_pressed(down) && grid_free(x, y + game.height))
	y += game.height;
if (keyboard_check_pressed(left) && grid_free(x - game.width, y))
	x -= game.width;
else if (keyboard_check_pressed(right) && grid_free(x + game.width, y))
	x += game.width;

if (mouse_check_button_pressed(mb_left))
{
	if (target == noone)
		target = o_highlight;
	// ToDo: fix issue with collision on movement
	// ToDo? fix diaginal clipping on movement planning
	// ToDo: fix treasure chest sprite (draw 16x16)
	// ToDo: add mour enemy types
	// ToDo: attack enemy **Milestone**
	// ToDo: add inventory **Milestone**
	// ToDo: add looting  **Milestone**
}

shake = keyboard_key == up || keyboard_key == down 
	|| keyboard_key == left || keyboard_key == right;