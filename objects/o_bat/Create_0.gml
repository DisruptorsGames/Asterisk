/// @description Init
event_inherited();

name = choose("Batty", "Bitey", "Hangy", "Fangy", "Dracula");
boss = string_count("Dracula", name);
hp_max = boss ? 60 : 10;
hp = hp_max;
initiative = boss ? 12 : 6;
damage = boss ? 3 : 1;
moves = boss ? 10 : 5;
steps = moves;
xoffset = 8;
yoffset = 15;

// populate inventory
items = [item_type.apple, item_type.script];
for (var i = 0; i < array_length_1d(items); i++)
{
	if (irandom(100) < 35)
		inventory[? items[i]] = 1;
}

ani_map[? anim_type.idle] = [0, 1, 2, 3, 4, 5, 6, 7];
ani_map[? anim_type.run] = [0, 1];