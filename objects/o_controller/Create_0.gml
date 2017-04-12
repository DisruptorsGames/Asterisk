/// @description Init

// macros
#macro gw display_get_gui_width() / o_controller.aspect
#macro gh display_get_gui_height() / o_controller.aspect
#macro gmx device_mouse_x_to_gui(0)
#macro gmy device_mouse_y_to_gui(0)
#macro sw surface_get_width(application_surface)
#macro sh surface_get_height(application_surface)
#macro cam view_camera[camera_get_active()]
#macro vw camera_get_view_width(view_camera[0])
#macro vh camera_get_view_height(view_camera[0])
#macro vx camera_get_view_x(view_camera[0])
#macro vy camera_get_view_y(view_camera[0])
#macro vt camera_get_view_target(view_camera[0])

// enumerations
enum action_type { ambush, attack, defend, die, inspect, leave, loot, meditation, move, peek, skip, unlock }
enum anim_type { crouch, death, fight, idle, lean, meditation, run, walk }
enum effect_type { bleed, drain, heal, med }
enum enum_type { action, animation, effect, item }
enum item_type { apple, backpack, book, key, potion, pouch, script }
enum point { xx, yy, angle }
enum tile_type { blank, ceiling, door, ground, solids, tree, wall }

global.debug = false;

randomize();
draw_set_circle_precision(8);

game = noone;
target = noone;
aspect = window_get_width() / window_get_height();
resizes = [0, 0];
cam_x = 0;
cam_y = 0;
cam_h = 90;
cam_w = cam_h * aspect;

switch(room)
{
	case r_base:
		room_goto(r_menu_main);
		break;
	case r_menu_main:
		instance_create_depth(0, 0, 0, o_menu_main);
		cam_w = 326;
		cam_h = 256;
		break;
	case r_outside:
		instance_create_depth(0, 0, layer_get_depth("Instances") + 1, o_highlight);
		game = instance_create_depth(0, 0, 0, o_adventure);
		target = o_player;
		break;
}
camera_set_view_size(view_camera[0], cam_w, cam_h);
display_set_gui_maximise(aspect, aspect);
