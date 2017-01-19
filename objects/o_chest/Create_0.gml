/// @description Init
event_inherited();

name = choose("Chest of doom!", "Chest of luck", "Treasure Chest");
shell = c_yellow;

// populate inventory
repeat(6)
{
	ds_list_add(inventory, choose(s_potion, s_apple, s_pouch, s_book, s_script));
}
ds_list_shuffle(inventory);