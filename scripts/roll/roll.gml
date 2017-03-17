/// @function roll
/// @param x1
/// @param x2
/// @param bonus
var x1 = argument0, x2 = argument1, x3 = argument2,
	amount = irandom_range(x1, x2) + x3,
	crit = amount / x2 > 0.75;
if (amount > 0)
{
	var float = instance_create_depth(x, y, depth - 1, o_float);
	float.image_blend = make_color_elm();
	float.image_xscale = crit ? 2 : 1;
	float.image_yscale = crit ? 2 : 1;
	float.text = amount == 0 ? choose("NIL!", "NADA!", "FAIL!", "?!?") : string(amount);
}
return amount;