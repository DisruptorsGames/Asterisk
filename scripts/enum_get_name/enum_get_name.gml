/// @function enum_get_name
/// @param enum type
/// @param enum value
var enum_t = argument0, enum_v = argument1;
if (enum_t == enum_type.action)
{
	switch (enum_v)
	{
		case action_type.ambush: return "Ambush";
		case action_type.attack: return "Attack";
		case action_type.defend: return "Defend";
		case action_type.die: return "Die";
		case action_type.inspect: return "Inspect";
		case action_type.leave: return "Leave";
		case action_type.loot: return "Loot";
		case action_type.meditation: return "Meditation";
		case action_type.move: return "Move";
		case action_type.peek: return "Peek";
		case action_type.skip: return "Skip";
		case action_type.unlock: return "Unlock";
	}
}
else if (enum_t == enum_type.item)
{
	switch (enum_v)
	{
		case item_type.apple: return "Apple";
		case item_type.backpack: return "Backpack";
		case item_type.book: return "Book";
		case item_type.key: return "Key";
		case item_type.potion: return "Potion";
		case item_type.pouch: return "Pouch";
		case item_type.script: return "Script";
	}
}