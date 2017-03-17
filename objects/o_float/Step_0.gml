/// @description Float Around
if (timer > 0)
	timer--;
if (timer == 0)
{
	xx = -xx;
	timer = time;
}
x = lerp(x, x + xx, 1.25);
y = lerp(y, y - 0.25, 2);
image_alpha -= 0.0075;
image_xscale -= 0.0025;
image_yscale -= 0.0025;
if (image_xscale <= 0 || image_yscale <= 0)
	instance_destroy();