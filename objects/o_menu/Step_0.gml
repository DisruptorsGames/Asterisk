/// @description Controls

if (keyboard_check_pressed(vk_up) && selection > 0)
	selection--;
else if (keyboard_check_pressed(vk_down) && selection < ds_list_size(menu) - 1)
	selection++;
