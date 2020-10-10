///surface_clear(surface)
///Draws a subtracting rectangle over the whole surface
function surface_clear(argument0) {

var _Surface;

if (surface_exists(argument0)) {
    draw_set_blend_mode_ext(bm_dest_color, bm_zero);
    draw_set_color(c_white);
    draw_set_alpha(0);
    draw_rectangle(0,0,surface_get_width(argument0),surface_get_height(argument0),0);
    draw_set_blend_mode(bm_normal);
}
}

