/// @function can_has
/// @param action type
/// @param target
/// @param range
var type = argument0, target = argument1, range = argument2,
	game = o_controller.game;
switch (type)
{
	case action_type.meditation:
		return false;
	case action_type.attack:
		return distance_to_object(target) < range * game.width 
			&& ds_map_exists(effects, effect_type.med);
}