/// @description Init
name = "Nobody";
hp = 0;
max_hp = 0;
chi = 0;
max_chi = 0;
sight = 25;
sight_dist = 6;
moves = 0;
steps = moves;
shake = false;
shell = c_black;
xoffset = sprite_xoffset;
yoffset = sprite_yoffset;
path = path_add();
has_path = false;
move_time = seconds(1) / 2;
target = noone;
owner = noone;
//
inv_size = 8;
inv_show = false;
inventory = ds_grid_create(4, 3);
//
animation = anim_type.idle;
ani_map = ds_map_create();
image_speed = 0.25;

//
//var game = o_controller.game;
//ds_priority_add(game.turns, id, 10);