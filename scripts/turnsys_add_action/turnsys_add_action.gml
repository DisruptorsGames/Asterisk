/// @param action

var system = o_turn_system;
var action = argument0;

ds_list_add(system._actions, action);
util_debug_message("[TurnSystem] Registered action: ", action);