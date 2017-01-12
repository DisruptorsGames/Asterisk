/// @description Follow & Snap
if (mouse_x > 0 && mouse_x < room_width 
	&& mouse_y > 0 && mouse_y < room_height)
{
	x = mouse_x - xoffset;
	y = mouse_y - yoffset;
}
var game = o_controller.game;
move_snap(game.width, game.height);