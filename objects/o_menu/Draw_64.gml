/// @description Menu

// menu
var aspect = o_controller.aspect,
    offset = (is_undefined(menu[| 0]) ? 24 : font_get_size(f_menu)) * aspect,
    ycenter = gh / 2 + offset;
draw_set_font(f_menu);
for (var i = 0; i < ds_list_size(menu); i++)
{
    var item = menu[| i],
        color = i == selection ? make_color_comp($5800e4) : c_white,
        ix = (gw - string_width(item)) / 2,
        iy = ycenter - (ds_list_size(menu) - 1) * offset;
    printf(ix, iy + i * offset, item, color, 1, f_hud, fa_left, aspect, 0, false);
    // selection
    if (i == selection)
        printf(ix - string_width(indicator) - 4, iy + i * offset, indicator, color, aspect, f_hud, fa_left, 1, 0, false);
}
draw_set_font(-1);

// add game version
var version = string(GM_version) + "\n" + string(date_date_string(GM_build_date));
printf(gw / 2, gh - string_height(version), version, c_white, 1, f_hud, fa_center, 1, 0, false);