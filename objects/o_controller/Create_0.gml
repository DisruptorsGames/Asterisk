/// @description Init

// macros
#macro vw camera_get_view_width(view_camera[0])
#macro vh camera_get_view_height(view_camera[0])
#macro vx camera_get_view_x(view_camera[0])
#macro vy camera_get_view_y(view_camera[0])
#macro vt camera_get_view_target(view_camera[0])

// globals
global.debug = false;
// local vars
game = noone;
// camera
base_w = 160;
base_h = 96;
width = base_w;
height = base_h;

// instances
switch(room)
{
	case r_dynamic:
		instance_create_layer(16, 16, "Instances", o_player);
	case r_dungeon:
	case r_dungeon2:
		instance_create_depth(0, 0, layer_get_depth("Instances") + 1, o_highlight);
		game = instance_create_depth(0, 0, 0, o_arcade);
		break;
}

// create camera
var sw = sprite_get_width(s_player), 
	sh = sprite_get_height(s_player);
view_enabled = true;
view_visible[0] = true;
view_camera[0] = camera_create_view(0, 0, width, height, 0, o_player, -1, -1, 0, 0);

// scale screen
var max_w = display_get_width(), max_h = display_get_height(),
	aspect = window_get_fullscreen() ? (max_w / max_h) : (base_w / base_h);
width = aspect > 1 ? min(base_w, max_w) : (height * aspect);
height = aspect > 1 ? min(base_h, max_h) : (width / aspect);
display_set_gui_size(width, height);
surface_resize(application_surface, width, height);

// set window
window_set_size(1024, 768);
window_set_position((max_w - 1024) / 2, (max_h - 768) / 2);

