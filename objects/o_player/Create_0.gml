/// @description Init
event_inherited();

name = "Asterisk";
hp = 100;
hp_max = 100;
chi = 0;
chi_max = 100;
moves = 3;
steps = moves;
xoffset = 8;
yoffset = 24;
//
hotbar = ds_list_create();
ds_list_add(hotbar,
	[s_backpack, s_potion, s_apple, s_pouch],
	[s_book, s_script, s_script], 
	[s_attack, s_defend, s_ambush],
	[s_chest, s_potion, s_book, s_script]);
ds_list_shuffle(hotbar);
// controls
up = ord("W");
down = ord("S");
left = ord("A");
right = ord("D");
toggle_inv = ord("I");
// animations
ds_map_add(ani_map, anim_type.idle, [0, 1]);
ds_map_add(ani_map, anim_type.run, [8, 9, 10, 11, 12, 13, 14]);
ds_map_add(ani_map, anim_type.lean, [2]);
ds_map_add(ani_map, anim_type.crouch, [3]);
ds_map_add(ani_map, anim_type.thumbs_up, [4]);
ds_map_add(ani_map, anim_type.meditation, [5, 6, 7]);
//
playfield_update = true;
fog_update = true;
can_exit = false;