/// @description Camera

aspect = room == r_menu_main ? 4/3 : display_get_width() / display_get_height();
cam_w = room == r_menu_main ? 256 : floor(cam_h * aspect);

// surface
var surf_h = floor(min(window_get_height(), display_get_height())),
	surf_w = floor(surf_h * aspect);
if (surf_w != sw || surf_h != sh)
{
	surface_resize(application_surface, surf_w, surf_h);
	display_set_gui_maximise(aspect, aspect);
	camera_set_view_size(view_camera[0], cam_w, cam_h);
	resizes[0]++;
}

// target
if (vt != target)
	camera_set_view_target(view_camera[0], target);
if (instance_exists(vt))
{
	cam_x = lerp(cam_x, vt.x + vt.xoffset - vw / 2, 0.1);
	cam_y = lerp(cam_y, vt.y + vt.yoffset - vh / 2, 0.1);
	camera_set_view_pos(cam, cam_x, cam_y);
}