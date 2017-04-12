/// @description Cleanup
ds_grid_destroy(map);
ds_list_destroy(order);
ds_list_destroy(segments);
ds_priority_destroy(turns);
mp_grid_destroy(playfield);
part_system_destroy(particles);
surface_free(fog_surf);