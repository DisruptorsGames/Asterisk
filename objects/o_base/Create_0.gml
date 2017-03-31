/// @description Init
amenu = [];
amenu_item = -1;
amenu_target = noone;
amenu_x = x;
amenu_y = y;
inventory = ds_map_create();
locked = false;
name = "Nobody";
shell = c_dkgray;
xoffset = sprite_xoffset;
yoffset = sprite_yoffset;

image_speed = 0;

// default inventory
if (object_index != o_player && instance_exists(o_chest) && distance_to_object(o_chest) < 64)
	inventory[? item_type.key] = 1;
