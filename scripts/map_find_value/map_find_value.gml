/// @function map_find_value
/// @param x
/// @param y
/// @param xoffset
/// @param yoffset
var game = o_controller.game,
	xx = argument0, yy = argument1, 
	xo = argument2 * game.width, yo = argument3 * game.height;
return game.map[# (xx + xo) div game.width, (yy + yo) div game.height];