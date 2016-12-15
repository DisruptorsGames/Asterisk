/// @function grid_free
/// @param x
/// @param y
/// @param xoffset
/// @param yoffset
var game = o_controller.game,
	xx = argument0, yy = argument1, 
	xo = argument2 * game.width, yo = argument3 * game.height,
	spot = game.map[# (xx + xo) / game.width, (yy + yo) / game.height];
return spot > 0 && spot < 5;