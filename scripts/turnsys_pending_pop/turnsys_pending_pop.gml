var system = o_turn_system;

if (ds_queue_size(system._pending) == 0) {
	util_debug_crash("[TurnSystem] There are no pending actions!");
}

var action = ds_queue_dequeue(system._pending);

// remove the action from the main list too
var mainIndex = ds_list_find_index(system._actions, action);
ds_list_delete(system._actions, mainIndex);

util_debug_message("[TurnSystem] Pending Action removed: ", action);

return action;