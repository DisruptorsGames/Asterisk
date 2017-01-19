/// @description Init
event_inherited();

name = choose("Rabbit", "Hopper", "Speedy");
hp = 10;
hp_max = 10;
initiative = 6;
shell = $eeeeff;
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