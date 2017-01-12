/// @description Init
event_inherited();

name = choose("Rabbit", "Hopper", "Speedy");
hp = 10;
max_hp = 10;
moves = 1;
sight = 45;
shell = c_maroon;
xoffset = 12;
yoffset = 16;

ds_map_add(ani_map, anim_type.idle, [0]);