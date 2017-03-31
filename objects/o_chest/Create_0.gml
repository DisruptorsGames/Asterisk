/// @description Init
event_inherited();

name = choose("Chest of doom!", "Chest of luck", "Treasure Chest");
shell = merge_color(c_yellow, make_color_elm(), 0.5);
locked = true;

// populate inventory
items = [item_type.apple, item_type.book, item_type.potion, item_type.pouch, item_type.script];
for (var i = 0; i < array_length_1d(items); i++)
{
	var p = string_count("doom", name) == 0
		? (string_count("luck", name) > 0 ? 60 : 35)
		: 10;
	if (irandom(100) < p)
		inventory[? items[i]] = 1;
}