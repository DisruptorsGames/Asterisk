/// @function grid_free
/// @param x
/// @param y
var xx = argument0, yy = argument1,
	game = o_controller.game,
	spot = game.map[# xx / game.width, yy / game.height];
return spot > 0 && spot < 5;