/// @description Camera

// calculations
var height = min(cam_w, display_get_height()),
	width = floor(height * aspect);

// follow player
if (instance_exists(vt))
{
	cam_x = lerp(cam_x, vt.x + vt.xoffset - width / 2, 0.1);
	cam_y = lerp(cam_y, vt.y + vt.yoffset - height / 2, 0.1);
	camera_set_view_pos(cam, cam_x, cam_y);
}

// rotate
if (keyboard_check_pressed(vk_pagedown))
{
	cam_a += 90;
	camera_set_view_angle(cam, cam_a);
}

// resize and scale
if (sw != width || sh != height)
{
	surface_resize(application_surface, width, height);
	surface_reset_target();
	display_set_gui_size(width, height);
	//display_set_gui_maximise(aspect, aspect);
	resizes++;
}
