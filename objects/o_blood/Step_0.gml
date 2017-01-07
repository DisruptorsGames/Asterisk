/// @description Scaling
image_alpha -= 0.05;
image_xscale += 0.05 * sign(image_xscale);
image_yscale += 0.02 * sign(image_yscale);

if (image_alpha == 0)
	instance_destroy();