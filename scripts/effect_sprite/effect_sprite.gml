/// @function effect_sprite
/// @param effect_type
var type = argument0, sprite = s_peek;
switch (type)
{
	case effect_type.med:
		sprite = s_meditation;
		break;
	case effect_type.damage:
		sprite = s_bleed;
		break;
	case effect_type.heal:
		sprite = s_heal;
		break;
}
return sprite;

/*
	med,
	heal,
	damage,
	drain
*/