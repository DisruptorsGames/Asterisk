/// @description Init
event_inherited();

name = choose("Ratib", "Ratatack", "Ration", "Ratatat");
hp = 60;
hp_max = 60;
initiative = 10;
shell = c_red;
moves = 3;
steps = moves;
xoffset = 12;
yoffset = 15;

// populate inventory
repeat(3)
{
	ds_list_add(inventory, choose(s_potion, s_apple, s_pouch, s_book, s_script));
}
ds_list_shuffle(inventory);