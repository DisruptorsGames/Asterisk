/// @description Init
event_inherited();

name = choose("Chest of doom!", "Chest of luck", "Treasure Chest");
shell = c_yellow;

ds_map_add(ani_map, anim_type.idle, [0]);
ds_map_add(ani_map, anim_type.meditation, [0]);

actions = ["open", "loot", "push", "a", "b", "c", "d", "e"];