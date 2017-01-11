/// @description Init
event_inherited();

name = choose("Rabbit", "Hopper", "Speedy");
sight = 45;
shell = c_maroon;
xoffset = 12;
yoffset = 16;

ds_map_add(ani_map, anim_type.idle, [0]);