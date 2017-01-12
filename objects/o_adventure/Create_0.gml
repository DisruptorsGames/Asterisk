/// @description Init
width = 16;
height = 16;
snap_width = width / 4;
snap_height = width / 4;
playfield = mp_grid_create(0, 0, room_width / width, room_height / height, width, height);
turns = ds_priority_create();
combat = false;