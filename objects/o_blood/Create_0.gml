/// @description Initialize
image_index = random(image_number);
image_speed = 0;
direction = random(360);
speed = random_range(1, 2);
gravity = random_range(0.25, 0.75);
alarm[0] = seconds(1);
image_xscale = choose(1, -1);
image_yscale = choose(1, -1);
depth = -y;
dmg = 0;