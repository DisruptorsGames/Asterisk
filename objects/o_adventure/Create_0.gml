/// @description Init
width = 16;
height = 16;
snap_width = width / 4;
snap_height = width / 4;
//
entity = noone;
fog_surf = surface_create(room_width, room_height);
map = ds_grid_create(7, 3);
map_surf = surface_create(16, 16);
map_update = true;
order = ds_list_create();
playfield = mp_grid_create(0, 0, room_width / width, room_height / height, width, height);
time = seconds(1.75);
timer = time;
turns = ds_priority_create();
segments = ds_list_create();
//
particles = part_system_create();
part_system_depth(particles, layer_get_depth("Instances") - 10);
//
depth = layer_get_depth("Instances") - 1;
// add the backpack to the map
var pack = instance_create_layer(32, 64, "Instances", o_item);
pack.sprite_index = sprite_create(s_items, 1);