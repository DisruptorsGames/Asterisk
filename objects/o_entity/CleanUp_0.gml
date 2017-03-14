/// @description Cleanup
ds_map_destroy(inventory);
ds_stack_destroy(actions);
ds_map_destroy(effects);
ds_map_destroy(ani_map);
path_delete(path);