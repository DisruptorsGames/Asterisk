/// @description Init
name = "NoBody";
hp = 100;
max_hp = 100;
mana = 100;
max_mana = 100;
//
sight = 25;
sight_dist = 6;
//
steps = 1;
moves = 1;
shake = false;
//
shell = c_black;
shadow_xscale = image_xscale;
shadow_angle = image_angle;
xoffset = sprite_xoffset;
yoffset = sprite_yoffset;
//
path = path_add();
has_path = false;
move_time = seconds(1) / 2;
//
target = noone;
owner = noone;
//
inv_size = 8;
inv_show = false;
inventory = ds_grid_create(4, 3);
//
animation = anim_type.idle;
flip = false;
ani_map = ds_map_create();
image_speed = 0.25;