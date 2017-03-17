/// @description Init
event_inherited();

name = choose("Chest of doom!", "Chest of luck", "Treasure Chest");
shell = c_yellow;
locked = true;

// populate inventory
repeat(6)
{
	ds_map_increment(inventory, choose(s_potion, s_apple, s_pouch, s_book, s_script), 1);
}