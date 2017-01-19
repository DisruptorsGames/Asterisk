/// @description Init
event_inherited();

name = "Asterisk";
portrait = s_aster_portrait;
hp = 100;
hp_max = 100;
chi = 0;
chi_max = 100;
initiative = 3;
npc = false;
shell = c_ltgray;
moves = 3;
steps = moves;
xoffset = 8;
yoffset = 24;

// populate hotbar
ds_list_add(hotbar,
	[s_backpack, s_potion, s_apple, s_pouch],
	[s_book, s_script, s_script], 
	[s_attack, s_defend, s_ambush],
	[s_chest, s_potion, s_book, s_script]);
ds_list_shuffle(hotbar);

// controls
toggle_inv = ord("I");

// animations
ani_map[? anim_type.idle] = [0, 1];
ani_map[? anim_type.run] = [8, 9, 10, 11, 12, 13, 14];
ani_map[? anim_type.lean] = [2];
ani_map[? anim_type.crouch] = [3];
ani_map[? anim_type.thumbs_up] = [4];
ani_map[? anim_type.meditation] = [5, 6, 7];