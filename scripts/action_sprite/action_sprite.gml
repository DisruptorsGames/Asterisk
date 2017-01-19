/// @function action_sprite
/// @param action_type
var type = argument0, sprite = s_peek;
switch (type)
{
	case action_type.meditation:
		sprite = s_meditation;
		break;
	case action_type.ambush:
		sprite = s_ambush;
		break;
	case action_type.attack:
		sprite = s_attack;
		break;
	case action_type.defend:
		sprite = s_defend;
		break;
	case action_type.inspect:
		sprite = s_inspect;
		break;
	case action_type.loot:
		sprite = s_loot;
		break;
	case action_type.peek:
		sprite = s_peek;
		break;
	case action_type.leave:
		sprite = s_exit;
		break;
}
return sprite;

/*
	die,
	meditation,
	move,
	ambush,
	attack,
	defend,
	inspect,
	loot,
	peek,
	leave
*/