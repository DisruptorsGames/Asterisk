/// @description Bleed!
hp -= 1;
repeat(4)
{
	var b = instance_create_layer(x + xoffset, y + sprite_height / 2, "Instances", o_blood);
	b.dmg = 1;
}