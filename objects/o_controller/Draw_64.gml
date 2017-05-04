/// @description Heads up Display
show_debug_overlay(global.debug);

var game = o_controller.game;
if (global.debug)
{
    var text = tostr([
        tostr(["Aspect",aspect],": "),
        tostr(["Window",tostr([window_get_width(),window_get_height()],"x")],": "),
        tostr(["Surface",tostr([sw,sh],"x")],": "),
        tostr(["View",tostr([vw,vh],"x")],": "),
        tostr(["Port",tostr([view_wport[0],view_hport[0]],"x")],": "),
        tostr(["GUI",tostr([gw,gh],"x")],": "),
        tostr(["Room",tostr([room_width,room_height],"x")],": "),
        tostr(["Resizes",tostr(resizes,"|")],": "),
        tostr(["Amenu",instance_exists(o_amenu) ? tostr(o_amenu.menu,";") : "???"],": ")
    ], "\n");
    printf(gw, 0, text, c_white, 0.95, f_hud, fa_right, 1, 0, false);
    draw_line_color(gw / 2, 0, gw / 2, gh, c_white, c_white);
    draw_line_color(0, gh / 2, gw, gh / 2, c_white, c_white);
}
printf((gw - string_width(string(fps_real))) / 2, 0, string(fps_real), c_red, 1, f_hud, fa_left, 1, 0, false);