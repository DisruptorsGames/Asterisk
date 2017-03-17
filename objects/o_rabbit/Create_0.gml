/// @description Init
event_inherited();

name = choose("Mr. Wabbit", "Hopper", "Speedy");
boss = string_count("Mr", name) > 0;
hp_max = boss ? 75 : 10;
hp = hp_max;
initiative = boss ? 12 : 6;
damage = boss ? 8 : 1;
passive = true;
moves = boss ? 7 : 3;
steps = moves;
xoffset = 15;
yoffset = 15;

// populate inventory
repeat(3)
{
	ds_map_increment(inventory, choose(s_potion, s_apple, s_pouch, s_book, s_script), 1);
}

ani_map[? anim_type.idle] = [0, 1, 2, 3, 4, 5, 6, 7];
ani_map[? anim_type.run] = [8, 9, 10, 11];
ani_map[? anim_type.lean] = [25];
ani_map[? anim_type.crouch] = [25];
ani_map[? anim_type.death] = [26];
ani_map[? anim_type.meditation] = [16, 17, 18/*, 19, 20, 21, 22, 23*/];