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
items = [item_type.apple];
for (var i = 0; i < array_length_1d(items); i++)
{
    if (irandom(100) < 35)
        inventory[? items[i]] = 1;
}

ani_map[? anim_type.idle] = [0, 1, 2, 3, 4, 5, 6, 7];
ani_map[? anim_type.run] = [8, 9, 10, 11];
ani_map[? anim_type.fight] = [16, 17, 18, 19];
ani_map[? anim_type.lean] = [24];
//ani_map[? anim_type.crouch] = [25];
ani_map[? anim_type.death] = [26];
//ani_map[? anim_type.meditation] = [27, 28, 29];