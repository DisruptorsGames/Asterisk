/// @description Think
var turn = ds_priority_find_min(turns);
if (is_undefined(turn))
{
	// roll for initiative
	for (var i = 0; i < instance_count; i++)
	{
		var inst = instance_id[i];
		if (inst.x > vx && inst.x < vx + vw && inst.y > vy && inst.y < vy + vh)
		{
		}
	}
}
else
{
	// take turn
}