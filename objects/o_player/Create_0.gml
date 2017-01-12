/// @description Init
event_inherited();

name = "Asterisk";
hp = 100;
max_hp = 100;
chi = 0;
max_chi = 10;
shell = c_dkgray;
moves = 6;
steps = moves;
xoffset = 8;
yoffset = 24;
max_items = 4;
//
hp_col = merge_color(c_red, make_color_elm(), random_range(0.5, 0.75));
chi_col = merge_color(c_white, make_color_elm(), random_range(0.5, 0.75));

// controls
up = ord("W");
down = ord("S");
left = ord("A");
right = ord("D");
toggle_inv = ord("I");

ds_map_add(ani_map, anim_type.idle, [0, 1]);
ds_map_add(ani_map, anim_type.run, [8, 9, 10, 11, 12, 13, 14]);
ds_map_add(ani_map, anim_type.lean, [2]);
ds_map_add(ani_map, anim_type.crouch, [3]);
ds_map_add(ani_map, anim_type.thumbs_up, [4]);

/*


















*/