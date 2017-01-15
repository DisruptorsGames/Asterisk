var system = o_turn_system;
var pendingCount = ds_queue_size(system._pending);

return pendingCount > 0;