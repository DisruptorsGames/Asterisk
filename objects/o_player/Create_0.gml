/// @description Init
event_inherited();

name = "Asterisk";
portrait = s_aster_portrait;
hp = 100;
hp_max = 100;
chi = 0;
chi_max = 100;
initiative = 3;
damage = 10;
range = 2;
npc = false;
moves = 3;
steps = moves;
xoffset = 8;
yoffset = 24;

effects[? effect_type.damage] = [6, 5];
effects[? effect_type.heal] = [3, 2.5];

// populate inventory
items = [s_potion, s_apple, s_pouch, s_script];
for (var i = 0; i < array_length_1d(items); i++)
{
	inventory[? items[i]] = 1;
}

// controls
toggle_inv = ord("I");

// animations
ani_map[? anim_type.idle] = [0, 1, 2, 3, 4, 5, 6, 7];
ani_map[? anim_type.run] = [8, 9, 10, 11, 12, 13, 14];
ani_map[? anim_type.lean] = [24];
ani_map[? anim_type.crouch] = [25];
ani_map[? anim_type.death] = [26];
ani_map[? anim_type.meditation] = [16, 17, 18/*, 19, 20, 21, 22, 23*/];