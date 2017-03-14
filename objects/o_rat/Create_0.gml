/// @description Init
event_inherited();

name = choose("Ratib", "Ratatack", "Ration", "Ratatat", "King Ratserlot");
boss = string_count("King", name);
hp_max = boss ? 120 : 60;
hp = hp_max;
initiative = boss ? 10 : 5;
damage = boss ? 12 : 3;
moves = boss ? 5 : 3;
steps = moves;
xoffset = 15;
yoffset = 15;

// populate inventory
repeat(3)
{
	ds_map_increment(inventory, choose(s_potion, s_apple, s_pouch, s_book, s_script), 1);
}

ani_map[? anim_type.run] = [0, 1, 2, 3, 4, 5];