/// @description Init
name = "Nobody";
hp = 0;
hp_max = 0;
chi = 0;
chi_max = 0;
hp_col = merge_color(c_red, make_color_elm(), random_range(0.5, 0.75));
chi_col = merge_color(c_white, make_color_elm(), random_range(0.5, 0.75));
//
moves = 0;
steps = moves;
path = path_add();
has_path = false;
idle_t = seconds(10);
idle = idle_t;
in_danger = false;
//
target = noone;
owner = noone;
//
inv_size = 8;
inv_show = false;
inventory = ds_grid_create(4, 3);
//
shake = false;
shell = c_dkgray;
xoffset = sprite_xoffset;
yoffset = sprite_yoffset;
animation = anim_type.idle;
ani_map = ds_map_create();
image_speed = 0.25;
//
playfield_update = false;
fog_update = false;
//
nearme = ds_list_create();
actions = [];