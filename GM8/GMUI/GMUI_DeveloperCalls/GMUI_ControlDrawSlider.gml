#define GMUI_ControlDrawSlider
///GMUI_ControlDrawSlider(id of tooltip control object)
/// Draw the control as a tooltip

var _tt_id;
_tt_id = argument0;

// TODO: REDO ALL OF THIS FOR THE SLIDER:
// switch between slider styles
// switch between tick styles
// make demo show valuechange action updating a number
// 
// in other scripts:
// create variables to calculate the drawing values
// if the variables are not set, calculate and set them
// if sizes change for the control, re-calculate these variables (update flag)

with (_tt_id) {
    var _txt, cx, cy, cwx, chy, minx, maxx, miny, maxy, padx, pady;
    _txt = valueString;
    cx = RoomX;
    cy = RoomY;
    cwx = RoomW;
    chy = RoomH;
    padx = ControlPaddingX;
    pady = ControlPaddingY;
    
    // Draw the area
    color_alpha(ControlBackgroundColor,min(ControlBackgroundAlpha,FadeAlpha));
    draw_rectangle(cx, cy, cwx+padx*2, chy, 0);
    
    
    // Draw point based on the direction of the tooltip (relative to the parent control)
    // Points are drawn: left corner, right corner, then top
    switch (TT_direction) {
        case global.GMUIAnchorLeft:
            draw_triangle(cx,max(cy,cy+TT_yposition-TT_arrowsize),cx,min(cy+TT_yposition+TT_arrowsize,chy),cx-TT_xposition,cy+TT_yposition,0);
            break;
        case global.GMUIAnchorRight:
            draw_triangle(cwx,max(cy,cy+TT_yposition-TT_arrowsize),cwx,min(cy+TT_yposition+TT_arrowsize,chy),cwx+TT_xposition,cy+TT_yposition,0);
            break;
        case global.GMUIAnchorBottom:
        case global.GMUIAnchorBottomRight:
        case global.GMUIAnchorBottomLeft:
            draw_triangle(max(cx,cx+TT_xposition-TT_arrowsize),chy,min(cx+TT_xposition+TT_arrowsize,cwx),chy,cx+TT_xposition,chy+TT_yposition,0);
            break;
        case global.GMUIAnchorTop:
        case global.GMUIAnchorTopLeft:
        case global.GMUIAnchorTopRight:
            draw_triangle(max(cx,cx+TT_xposition-TT_arrowsize),cy,min(cx+TT_xposition+TT_arrowsize,cwx),cy,cx+TT_xposition,cy-TT_yposition,0);
            break;
    }
    
    color_alpha(ControlFontColor,min(ControlFontAlpha,FadeAlpha));
    
    var _dtx, _midHeight;
    _dtx = cx + padx;
    
    draw_text_ext(_dtx,cy + (chy-cy)/2,_txt,-1,cwx);
}
