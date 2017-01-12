/// @description Init
event_inherited();

name = choose("Chest of doom!", "Chest of luck", "Treasure Chest");
shell = c_white;

ds_map_add(ani_map, anim_type.idle, [0]);