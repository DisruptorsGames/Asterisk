/// @description Init
event_inherited();

name = choose("Ratib", "Ratatack", "Ration", "Ratatat", "King Ratserlot");
boss = string_count("King", name);
hp_max = boss ? 120 : 60;
hp = hp_max;
initiative = boss ? 10 : 5;
damage = boss ? 12 : 3;
shell = boss ? c_purple : c_red;
moves = boss ? 5 : 3;
steps = moves;
xoffset = 12;
yoffset = 15;

// populate inventory
repeat(3)
{
	ds_list_add(inventory, choose(s_potion, s_apple, s_pouch, s_book, s_script));
}
ds_list_shuffle(inventory);