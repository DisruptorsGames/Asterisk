/// @description Init
event_inherited();

name = "Asterisk";
shell = c_dkgray;
steps = 6;
moves = 6;
shadow_xscale = -image_xscale;
shadow_angle = image_angle + 45;
xoffset = 8;
yoffset = 24;
max_items = 4;
//
hp_col = merge_color(c_red, make_color_elm(), random_range(0.5, 0.75));
mana_col = make_color_comp(hp_col);

// controls
up = ord("W");
down = ord("S");
left = ord("A");
right = ord("D");
toggle_inv = ord("I");

ds_map_add(ani_map, anim_type.idle, [0, 1]);
ds_map_add(ani_map, anim_type.run, [2, 3, 4, 5, 6, 7]);
ds_map_add(ani_map, anim_type.lean, [8]);
ds_map_add(ani_map, anim_type.crouch, [9]);
ds_map_add(ani_map, anim_type.thumbs_up, [10]);
depth = -1;

/*


















*/