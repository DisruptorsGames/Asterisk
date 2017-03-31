/// @description Init
event_inherited();

scale = 0.5;

sprite_index = sprite_create(s_items, choose(
	item_type.apple,
	item_type.key,
	item_type.potion,
	item_type.script,
	item_type.book,
	item_type.backpack,
	item_type.pouch));

image_xscale = scale;
image_yscale = scale;

x += sprite_width * image_xscale;
y += sprite_height * image_yscale;