/// @description Init
event_inherited();

name = choose("Ratib", "Ratatack", "Ration", "Ratatat");
hp = 60;
max_hp = 60;
moves = 1;
sight = 45;
shell = c_maroon;
xoffset = 12;
yoffset = 16;

ds_map_add(ani_map, anim_type.idle, [0]);