/// @description Camera
if (instance_exists(vt))
{
	x = lerp(x, vt.x + vt.xoffset - vw / 2, 0.1);
	y = lerp(y, vt.y + vt.yoffset - vh / 2, 0.1);
	camera_set_view_pos(view_camera[0], x, y);
}