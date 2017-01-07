/// @description Init
event_inherited();

name = choose("Chest of doom!", "Chest of luck", "Treasure Chest");
hp = 0;
max_hp = 0;
mana = 0;
max_mana = 0;
shell = c_white;
steps = 0;

ds_map_add(ani_map, anim_type.idle, [0]);