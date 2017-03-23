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
map_surf = surface_create(16, 16);
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
ds_grid_set(map, ds_grid_width(map) / 2, ds_grid_height(map) / 2, 5);
//
surface_resize(map_surf, ds_grid_width(map) * 10, ds_grid_height(map) * 10);
surface_set_target(map_surf);
draw_clear_alpha(c_ltgray, 0);
for (var i = 0; i < ds_grid_width(map); i++)
{
	for (var j = 0; j < ds_grid_height(map); j++)
	{
		var item = map[# i, j], s = 8, 
			ix = i * (s + 2), iy = j * (s + 2),
			col = item == 0 ? c_dkgray : make_color_elm();
		draw_rectangle_color(ix, iy, ix + s, iy + s, col, col, col, col, true);
		printf(ix, iy, item, c_white, 1, f_hud, fa_left, 0.5, 0, true);
	}
}
surface_reset_target();