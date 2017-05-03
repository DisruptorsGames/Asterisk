/// @function draw_shadows
/// @param target
var target = argument0,
    tx = target.x + target.xoffset,
    ty = target.y + target.yoffset;
// build origin ring
var r = target.sprite_width, len = 16;
for (var i = 0; i < 2 * pi * sqr(r); i += 30)
{
    var ix = tx + lengthdir_x(len, i),
        iy = ty + lengthdir_y(len, i);
    if (mp_grid_get_cell(playfield, ix / width, iy / height) == 0)
    {
        draw_circle_color(ix, iy, 1, c_red, c_red, false);
        // build polygon shadows
        /*show_debug_message(ds_list_size(segments));
        draw_primitive_begin(pr_pointlist);
            for (var s = 0; s < ds_list_size(segments); s++)
            {
                var segment = segments[| s],
                    sa = segment[0], sax = sa[0], say = sa[1],
                    sb = segment[1], sbx = sb[0], sby = sb[1],
                    col = c_black;
                //
                //if (point_distance(ix, iy, sax, say) < width)
                //{
                    draw_vertex_color(ix, iy, col, 1);
                    draw_vertex_color(sax, say, col, 1);
                    draw_vertex_color(sbx, sby, col, 1);
                //}
            }
        draw_primitive_end();*/
    }
}