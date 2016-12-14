/// @description Camera
x = lerp(x, vt.x - vw / 2, 0.1);
y = lerp(y, vt.y - vh / 2, 0.1);
camera_set_view_pos(view_camera[0], x, y);