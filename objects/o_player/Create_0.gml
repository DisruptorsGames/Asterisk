/// @description Init
event_inherited();

name = "Asterisk";
portrait = s_aster_portrait;
hp = 100;
hp_max = 100;
chi = 0;
chi_max = 100;
initiative = 10;
damage = 10;
npc = false;
moves = 3;
steps = moves;
xoffset = 8;
yoffset = 24;

// animations
ani_map[? anim_type.idle] = [0, 1, 2, 3, 4, 5, 6, 7];
ani_map[? anim_type.run] = [8, 9, 10, 11, 12, 13, 14];
ani_map[? anim_type.fight] = [16, 17, 18];
ani_map[? anim_type.lean] = [24];
ani_map[? anim_type.crouch] = [25];
ani_map[? anim_type.death] = [26];
ani_map[? anim_type.meditation] = [27, 28, 29];