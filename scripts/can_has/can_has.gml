/// @function can_has
/// @param action type
/// @param target
var type = argument0, target = argument1, game = o_controller.game;
switch (type)
{
	case action_type.meditation:
		return !ds_map_exists(target.effects, effect_type.med);
	case action_type.attack:
		return instance_exists(target) 
			&& distance_to_object(target) < range * game.width
			&& (!passive || hp < hp_max)
			&& !target.dead
			/*&& can_has(action_type.meditation, id)*/;
}