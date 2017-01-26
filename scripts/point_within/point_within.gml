/// @function point_within
/// @param px
/// @param py
/// @param x1
/// @param y1
/// @param x2
/// @param y2
var px = argument0, py = argument1,
	x1 = argument2, y1 = argument3,
	x2 = argument4, y2 = argument5,
	game = o_controller.game;
return px > x1 && px < x2 && py > y1 && py < y2;