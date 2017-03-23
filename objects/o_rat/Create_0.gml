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
items = [item_type.apple, item_type.book, item_type.potion, item_type.pouch, item_type.script];
for (var i = 0; i < array_length_1d(items); i++)
{
	if (irandom(100) < 35)
		inventory[? items[i]] = 1;
}

ani_map[? anim_type.idle] = [0, 1, 2, 3, 4, 5, 6, 7];
ani_map[? anim_type.run] = [8, 9, 10, 11, 12, 13];
ani_map[? anim_type.death] = [26];