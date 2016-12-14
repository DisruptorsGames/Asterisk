/// @function grid_snapped
/// @param obj
var obj = argument0, game = o_controller.game;
return (obj.x - obj.sprite_xoffset) % game.width == 0 
	&& (obj.y - obj.sprite_yoffset) % game.height == 0;