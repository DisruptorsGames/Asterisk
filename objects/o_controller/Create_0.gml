/// @description Init

// macros
#macro gw display_get_gui_width() / o_controller.aspect
#macro gh display_get_gui_height() / o_controller.aspect
#macro sw surface_get_width(application_surface)
#macro sh surface_get_height(application_surface)
#macro cam view_camera[camera_get_active()]
#macro vw camera_get_view_width(view_camera[0])
#macro vh camera_get_view_height(view_camera[0])
#macro vx camera_get_view_x(view_camera[0])
#macro vy camera_get_view_y(view_camera[0])
#macro vt camera_get_view_target(view_camera[0])

// enumerations
enum anim_type
{
	idle,
	walk,
	run,
	lean,
	crouch,
	thumbs_up
}
enum tile_type
{
	solids,
	blank,
	ceiling,
	ground,
	door,
	tree,
	wall
}

// globals
global.debug = false;

randomize();
draw_set_circle_precision(8);

game = noone;
target = noone;
// camera
cam_x = 0;
cam_y = 0;
cam_w = 160;
cam_h = 90;
aspect = display_get_width() / display_get_height();

switch(room)
{
	case r_base:
		room_goto(r_menu_main);
		break;
	case r_menu_main:
		instance_create_depth(0, 0, 0, o_menu_main);
		cam_w = 256;
		cam_h = 224;
		break;
	case r_outside:
	case r_dungeon:
	case r_dungeon2:
		instance_create_depth(0, 0, layer_get_depth("Instances") + 1, o_highlight);
		game = instance_create_depth(0, 0, 0, o_adventure);
		target = o_player;
		// scale surface
		var height = floor(min(768, display_get_height())),
			width = floor(height * aspect);
		surface_resize(application_surface, width, height);
		break;
}

camera_set_view_target(view_camera[0], target);
camera_set_view_size(view_camera[0], cam_w, cam_h);
display_set_gui_maximise(aspect, aspect);

/*


















*/