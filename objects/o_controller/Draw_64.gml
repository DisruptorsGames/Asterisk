/// @description Heads up Display

var text = "", game = o_controller.game;

show_debug_overlay(global.debug);
if (global.debug)
{
    text = "Aspect: " + string(aspect)
        + "\nWindow: " + string(window_get_width()) + "x" + string(window_get_height())
        + "\nSurface: " + string(sw) + "x" + string(sh)
        + "\nView: " + string(vw) + "x" + string(vh) + ":" + string(camera_get_active())
        + "\nPort: " + string(view_wport[0]) + "x" + string(view_hport[0])
        + "\nGUI: " + string(gw) + "x" + string(gh)
        + "\nRoom: " + string(room_width) + "x" + string(room_height)
        + "\nResizes: " + string(resizes)
        + "\nAmenu: " + string(instance_exists(o_amenu)
            ? string(array_length_1d(o_amenu.menu))
            : "???");
    //
    draw_line_color(gw / 2, 0, gw / 2, gh, c_white, c_white);
    draw_line_color(0, gh / 2, gw, gh / 2, c_white, c_white);
}

printf(gw, 0, text, c_white, 0.95, f_hud, fa_right, 1, 0, false);
printf((gw - string_width(string(fps_real))) / 2, 0, string(fps_real), c_red, 1, f_hud, fa_left, 1, 0, false);