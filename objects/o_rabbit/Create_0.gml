/// @description Init
event_inherited();

name = choose("Rabbit", "Hopper", "Speedy");
hp = 10;
hp_max = 10;
moves = 1;
steps = moves;
sight = 45;
xoffset = 12;
yoffset = 16;

ds_map_add(ani_map, anim_type.idle, [0]);
ds_map_add(ani_map, anim_type.meditation, [0]);

actions = ["kick", "pet", "attack"];