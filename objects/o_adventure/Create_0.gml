/// @description Init
width = 16;
height = 16;
snap_width = width / 4;
snap_height = width / 4;
map = ds_grid_create(7, 3);
playfield = mp_grid_create(0, 0, room_width / width, room_height / height, width, height);
pf_updates = 0;
entity = noone;
time = seconds(1.75);
timer = time;
turns = ds_priority_create();
order = ds_list_create();
fog_surf = surface_create(room_width, room_height);
fog_update = false;
map_surf = surface_create(16, 16);
map_update = true;
particles = part_system_create();
part_system_depth(particles, layer_get_depth("Instances") - 10);

depth = layer_get_depth("Instances") - 1;

// build the world
for (var i = 0; i < ds_grid_width(map); i++)
{
	for (var j = 0; j < ds_grid_height(map); j++)
	{
		ds_grid_add(map, i, j, irandom(1));
	}
}
ds_grid_set(map, ds_grid_width(map) / 2, ds_grid_height(map) / 2, r_outside);

// backpack REMOVE ME!!!
var pack = instance_create_layer(32, 64, "Instances", o_item);
pack.sprite_index = sprite_create(s_items, 1);