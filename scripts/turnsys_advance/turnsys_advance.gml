/// @description Advancing the TurnSystem will populate the pending queue as well as increment the turn counter.

var system = oTurnSystem;

// the TurnSystem can not be advanced when the currently pending list is not empty.
// this is an undefined state since its not what the client expects
if (ds_queue_size(system._pending) > 0) {
	util_debug_crash("[TurnSystem] Pending action list was not empty when advancing the system. Make sure to fully empty the pending list via turnsys_pending_pop before advancing!");
}

// --- advance turn
system._currentTurnNumber++;
util_debug_message("\n[TurnSystem] It is now turn #", system._currentTurnNumber, "!");

// --- find new pending actions

// advance actions and find those that want to pend
ds_list_clear(system._pending_tmp);

util_debug_message("[TurnSystem] actions to process: ", ds_list_size(system._actions));

for (var i=0; i<ds_list_size(system._actions); i++) {
	var action = ds_list_find_value(system._actions, i);
	var action_turns = action[2];
		
	action_turns--;
	action[@2] = action_turns;
	
	util_debug_message("[TurnSystem] action ", action, " turns: ", action[2]);
	
	if (action_turns == 0) {
		ds_list_add(_pending_tmp, action);
	}
}

// sort the actions by the actors initiative
// note: current implementation uses bubble sort which is generally inefficient.
//       however we only sort extremly rarely on the grand scale of things, so it does not matter at all.
util_debug_message("[TurnSystem] pending_tmp to process: ", ds_list_size(system._pending_tmp));

for (var n=ds_list_size(system._pending_tmp); n>1; n--) {
	for (var i=0; i<n-1; i++) {
		var actionA = ds_list_find_value(system._pending_tmp, i);
		var actionB = ds_list_find_value(system._pending_tmp, i+1);
		var actorA = actionA[0];
		var actorB = actionB[0];
		var initiativeA = actorA.initiative;
		var initiativeB = actorB.initiative;
		
		// note: for now the client has to make sure that each actor has a different initiative value.
		//       this check can be removed though which would make it effectively undefined behaviour
		//       when two actors have the same initiative value.
		if (initiativeA == initiativeB) {
			util_debug_crash("[TurnSystem] Two actors have the same initiative value, disallowed! (value=", initiativeA, ")");
		}
		
		if (initiativeA > initiativeB) {
			// swap places
			ds_list_replace(system._pending_tmp, i, actionB);
			ds_list_replace(system._pending_tmp, i+1, actionA);
		}
	}
}

// -- populate the pending queue
ds_queue_clear(system._pending);

util_debug_message("[TurnSystem] pending_tmp to process: ", ds_list_size(system._pending_tmp));

for (var i=0; i<ds_list_size(system._pending_tmp); i++) {
	var action = ds_list_find_value(system._pending_tmp, i);
	ds_queue_enqueue(system._pending, action);
	util_debug_message("[TurnSystem] Pending action: ", i, ". ", action);
}

util_debug_message("[TurnSystem] pending generated: ", ds_list_size(system._pending));