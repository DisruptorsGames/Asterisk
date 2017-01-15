/// @param action

var system = oTurnSystem;
var action = argument0;

ds_list_add(system._actions, action);
util_debug_message("[TurnSystem] Registered action: ", action);