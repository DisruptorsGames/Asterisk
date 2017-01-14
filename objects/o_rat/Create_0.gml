/// @description Init
event_inherited();

name = choose("Ratib", "Ratatack", "Ration", "Ratatat");
hp = 60;
hp_max = 60;
moves = 1;
steps = moves;
sight = 45;
xoffset = 12;
yoffset = 16;

ds_map_add(ani_map, anim_type.idle, [0]);
ds_map_add(ani_map, anim_type.meditation, [0]);