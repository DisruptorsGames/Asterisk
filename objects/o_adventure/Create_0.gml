/// @description Init
width = 16;
height = 16;
snap_width = width / 4;
snap_height = width / 4;
playfield = mp_grid_create(0, 0, room_width / width, room_height / height, width, height);
map = ds_grid_create(3, 3);
pf_updates = 0;
fog_surf = surface_create(room_width, room_height);
turns = ds_priority_create();
combat = false;
depth = -1;

//music_set(sfx_cave_ambient);

ds_grid_add(map, 0, 0, -1);
ds_grid_add(map, 0, 1, -1);
ds_grid_add(map, 0, 2, -1);
ds_grid_add(map, 1, 0, -1);
ds_grid_add(map, 1, 1, r_outside);
ds_grid_add(map, 1, 2, r_dungeon1);
ds_grid_add(map, 2, 0, -1);
ds_grid_add(map, 2, 1, -1);
ds_grid_add(map, 2, 2, r_dungeon2);
/*
	[NULL,	 NULL,		NULL]
	[NULL,	 OUTSIDE,	DUNGEON1 ],
	[NULL,	 NULL,		DUNGEON2 ]
*/