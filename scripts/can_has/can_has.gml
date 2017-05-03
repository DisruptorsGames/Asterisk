/// @function can_has
/// @param action type
/// @param me
/// @param them
var type = argument0, me = argument1, them = argument2,
    game = o_controller.game;
switch (type)
{
    case action_type.meditation:
        return !ds_map_exists(them.effects, effect_type.med);
    case action_type.attack:
        return instance_exists(them)
            && distance_to_object(them) < me.range * game.width
            && (!me.passive || me.hp < me.hp_max)
            && (object_get_parent(them.object_index) == o_entity && !them.dead);
}