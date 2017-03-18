/// @description Cleanup
mp_grid_destroy(playfield);
ds_grid_destroy(map);
ds_priority_destroy(turns);
ds_list_destroy(order);
surface_free(fog_surf);
part_system_destroy(particles);