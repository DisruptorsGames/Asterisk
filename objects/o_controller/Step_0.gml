/// @description Camera

// follow target
if (vt != target)
	camera_set_view_target(view_camera[0], target);
if (instance_exists(vt))
{
	cam_x = lerp(cam_x, vt.x + vt.xoffset - vw / 2, 0.1);
	cam_y = lerp(cam_y, vt.y + vt.yoffset - vh / 2, 0.1);
	camera_set_view_pos(cam, cam_x, cam_y);
}