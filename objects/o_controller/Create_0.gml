/// @description Init

// macros
#macro gw display_get_gui_width()
#macro gh display_get_gui_height()
#macro sw surface_get_width(application_surface)
#macro sh surface_get_height(application_surface)
#macro cam view_camera[camera_get_active()]
#macro vw camera_get_view_width(cam)
#macro vh camera_get_view_height(cam)
#macro vx camera_get_view_x(cam)
#macro vy camera_get_view_y(cam)
#macro vt camera_get_view_target(cam)

// globals
global.debug = false;

randomize();

//
game = noone;
// camera
cam_a = 0;
cam_x = 0;
cam_y = 0;
cam_w = 160;
cam_h = 96;
aspect = cam_w / cam_h;
resizes = 0;

switch(room)
{
	case r_menu_main:
		instance_create_depth(0, 0, 0, o_menu_main);
		cam_w = 256;
		cam_h = 244;
		break;
	case r_dynamic:
		instance_create_layer(16, 16, "Instances", o_player);
	case r_dungeon:
	case r_dungeon2:
		instance_create_depth(0, 0, layer_get_depth("Instances") + 1, o_highlight);
		game = instance_create_depth(0, 0, 0, o_arcade);
		break;
}

// camera
view_enabled = true;
view_visible[0] = true;
view_camera[0] = camera_create_view(0, 0, cam_w, cam_h, 0, o_player, -1, -1, 0, 0);
camera_set_default(cam);

// set window size
if (!window_get_fullscreen())
{
	window_set_size(1024, 768);
	window_set_position((display_get_width() - 1024) / 2, (display_get_height() - 768) / 2);
}
