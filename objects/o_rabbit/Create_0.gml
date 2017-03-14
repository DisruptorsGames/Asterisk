/// @description Init
event_inherited();

name = choose("Mr. Wabbit", "Hopper", "Speedy");
boss = string_count("Mr", name);
hp_max = boss ? 75 : 10;
hp = hp_max;
initiative = boss ? 12 : 6;
damage = boss ? 8 : 1;
moves = boss ? 7 : 3;
steps = moves;
xoffset = 15;
yoffset = 15;

// populate inventory
repeat(3)
{
	ds_map_increment(inventory, choose(s_potion, s_apple, s_pouch, s_book, s_script), 1);
}

ani_map[? anim_type.run] = [0, 1, 2, 3];