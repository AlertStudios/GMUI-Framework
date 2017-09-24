#define GMUI_ControlDrawSlider
///GMUI_ControlDrawSlider(id of slider control object)
/// Draw the control as a slider

var _tt_id, _SCRIPT;
_tt_id = argument0;
_SCRIPT = GMUI_ControlDrawSlider;

// TODO: REDO ALL OF THIS FOR THE SLIDER:
// make demo show valuechange action updating a number
// 
// in other scripts:
// create variables to calculate the drawing values
// if the variables are not set, calculate and set them
// if sizes change for the control, re-calculate these variables (update flag)

with (_tt_id) {
    // If this happens, GMUI has a bug
    if (ControlType != "slider") {
        GMUI_ThrowErrorDetailed("Control Type is not slider!",_SCRIPT);
        return false;
    }
    
    // Assign drawing vars
    var cx, cxp, cy, cw, ch, cwx, chy, chy2;
    cx = RoomX;
    cxp = cx+SliderStartEndPadding;
    cy = RoomY;
    cw = RoomW-cx;
    ch = RoomH-cy;
    cwx = RoomW;
    chy2 = (RoomY+RoomH)/2;
    
    // Compute the locations of all drawn elements
    if (!sliderComputed) {
        
        SliderTickDistance = (cw - (SliderStartEndPadding*2)) / max(SliderTickAmount - 1, 1);
        SliderMidPoint = cw/2;
        SliderQuarterPoint1 = SliderMidPoint/2 + SliderStartEndPadding/2;
        SliderQuarterPoint2 = cw - SliderQuarterPoint1;
        SliderSnapDistance = SliderTickDistance/2;
        
        for (i = 0; i < SliderTickAmount; i+=1) {
            SliderTickPoints[i] = SliderStartEndPadding + i*SliderTickDistance;
            
            // If it conflicts with another tick that should be drawn, set to -1 to not draw
            if (i == 0 || i == SliderTickAmount) {
                if (SliderEndTickHeight > 0)
                    SliderTickPoints[i] = -1;
            }
            else if (SliderTickPoints[i] == SliderMidPoint) {
                if (SliderMidTickHeight > 0)
                    SliderTickPoints[i] = -1;
            }
            else if (SliderTickPoints[i] == SliderQuarterPoint1 || SliderTickPoints[i] == SliderQuarterPoint2) {
                if (SliderQuarterTickHeight > 0)
                    SliderTickPoints[i] = -1;
            }
        }
        
        SliderSnapDistance = SliderTickPoints[i-1] - SliderTickPoints[i-2];
        
        // Check if the slider position is within the padding amount
        SliderRelativeFinalXorY = minmax(SliderRelativeXorY,SliderStartEndPadding,RoomW-SliderStartEndPadding);
        SliderRelativeXorY = SliderRelativeFinalXorY;
        Slider_t = Slider_d;
        
        sliderComputed = true;
    }
    
    // Draw the slider region first, based on type
    if (SliderTickStyle == 2 || SliderTickStyle == 3) {
        color_alpha(SliderBackgroundColor,SliderBackgroundAlpha);
    }
    switch (SliderTickStyle) {
        case 1: // Free (No horizontal line)
        
            break;
        case 2: // Single (Horizontal line)
        //todo: actually write this part
            draw_line(cxp,chy2,cwx-SliderStartEndPadding,chy2);
            break;
        case 3: // Rounded rectangle region
            draw_roundrect(cxp,chy2-SliderSlideHeight/2,cwx-SliderStartEndPadding,chy2+SliderSlideHeight/2,false);
            break;
        case 0: // none (slider only), or sprite
        default:
            
            break;
    }
    
    // If 0 draw none, optionally use sprite script instead
    if (SliderTickStyle > 0) {
        // Set the properties of the ticks
        color_alpha(SliderTickColor,SliderTickAlpha);
        
        if (SliderTickHeight > 0 && SliderTickDistance > 1) {
            for (i = 0; i < SliderTickAmount; i+=1) {
                if (SliderTickPoints[i] >= 0) {
                    draw_line(cx+SliderTickPoints[i],chy2-SliderTickHeight,cx+SliderTickPoints[i],chy2+SliderTickHeight);
                }
            }
        }
        
        // Draw the special ticks
        if (SliderEndTickHeight > 0) {
            draw_line(cxp,chy2-SliderEndTickHeight,cxp,chy2+SliderEndTickHeight);
            draw_line(cwx-SliderStartEndPadding,chy2-SliderEndTickHeight,cwx-SliderStartEndPadding,chy2+SliderEndTickHeight);
        }
        
        if (SliderMidTickHeight > 0) {
            draw_line(cx+SliderMidPoint,chy2-SliderMidTickHeight,cx+SliderMidPoint,chy2+SliderMidTickHeight);
        }
        
        if (SliderQuarterTickHeight > 0) {
            draw_line(cx+SliderQuarterPoint1,chy2-SliderQuarterTickHeight,cx+SliderQuarterPoint1,chy2+SliderQuarterTickHeight);
            draw_line(cx+SliderQuarterPoint2,chy2-SliderQuarterTickHeight,cx+SliderQuarterPoint2,chy2+SliderQuarterTickHeight);
        }
    }
    else if (0) {
    //not yet implemented
    }
    
    
    // Draw slider based on type
    switch (SliderStyle) {
        case 1: // Circle
        
            break;
        case 2: // PentagonUp
            draw_primitive_begin(pr_trianglefan);
            draw_vertex_color(cx+SliderRelativeXorY,chy2-SliderThumbHeight/2,SliderColor,SliderAlpha);
            draw_vertex_color(cx+SliderRelativeXorY-SliderThumbWidth/2,chy2-SliderThumbHeight/2+SliderThumbWidth/2,SliderColor,SliderAlpha);
            draw_vertex_color(cx+SliderRelativeXorY-SliderThumbWidth/2,chy2+SliderThumbHeight/2,SliderColor,SliderAlpha);
            draw_vertex_color(cx+SliderRelativeXorY+SliderThumbWidth/2,chy2+SliderThumbHeight/2,SliderColor,SliderAlpha);
            draw_vertex_color(cx+SliderRelativeXorY+SliderThumbWidth/2,chy2-SliderThumbHeight/2+SliderThumbWidth/2,SliderColor,SliderAlpha);
            draw_primitive_end();
            draw_primitive_begin(pr_linestrip);
            draw_vertex_color(cx+SliderRelativeXorY,chy2-SliderThumbHeight/2,SliderBorderColor,SliderBorderAlpha);
            draw_vertex_color(cx+SliderRelativeXorY-SliderThumbWidth/2,chy2-SliderThumbHeight/2+SliderThumbWidth/2,SliderBorderColor,SliderBorderAlpha);
            draw_vertex_color(cx+SliderRelativeXorY-SliderThumbWidth/2,chy2+SliderThumbHeight/2,SliderBorderColor,SliderBorderAlpha);
            draw_vertex_color(-1+cx+SliderRelativeXorY+SliderThumbWidth/2,chy2+SliderThumbHeight/2,SliderBorderColor,SliderBorderAlpha);
            draw_vertex_color(-1+cx+SliderRelativeXorY+SliderThumbWidth/2,chy2-SliderThumbHeight/2+SliderThumbWidth/2,SliderBorderColor,SliderBorderAlpha);
            draw_vertex_color(-1+cx+SliderRelativeXorY,chy2-SliderThumbHeight/2,SliderBorderColor,SliderBorderAlpha);
            draw_primitive_end();
            break;
        case 3: // PentagonDown
            draw_primitive_begin(pr_trianglefan);
            draw_vertex_color(cx+SliderRelativeXorY,chy2+SliderThumbHeight/2,SliderColor,SliderAlpha);
            draw_vertex_color(cx+SliderRelativeXorY+SliderThumbWidth/2,chy2+SliderThumbHeight/2-SliderThumbWidth/2,SliderColor,SliderAlpha);
            draw_vertex_color(cx+SliderRelativeXorY+SliderThumbWidth/2,chy2-SliderThumbHeight/2,SliderColor,SliderAlpha);
            draw_vertex_color(cx+SliderRelativeXorY-SliderThumbWidth/2,chy2-SliderThumbHeight/2,SliderColor,SliderAlpha);
            draw_vertex_color(cx+SliderRelativeXorY-SliderThumbWidth/2,chy2+SliderThumbHeight/2-SliderThumbWidth/2,SliderColor,SliderAlpha);
            draw_primitive_end();
            draw_primitive_begin(pr_linestrip);
            draw_vertex_color(-1+cx+SliderRelativeXorY,chy2+SliderThumbHeight/2,SliderColor,SliderAlpha);
            draw_vertex_color(-1+cx+SliderRelativeXorY+SliderThumbWidth/2,chy2+SliderThumbHeight/2-SliderThumbWidth/2,SliderColor,SliderAlpha);
            draw_vertex_color(-1+cx+SliderRelativeXorY+SliderThumbWidth/2,chy2-SliderThumbHeight/2,SliderColor,SliderAlpha);
            draw_vertex_color(cx+SliderRelativeXorY-SliderThumbWidth/2,chy2-SliderThumbHeight/2,SliderColor,SliderAlpha);
            draw_vertex_color(cx+SliderRelativeXorY-SliderThumbWidth/2,chy2+SliderThumbHeight/2-SliderThumbWidth/2,SliderColor,SliderAlpha);
            draw_vertex_color(cx+SliderRelativeXorY,chy2+SliderThumbHeight/2,SliderColor,SliderAlpha);
            draw_primitive_end();
            break;
        case 4: // Rectangle
        //SliderThumbWidth
        //SliderThumbHeight
        //SliderRelativeX
        //SliderRelativeFinalX
        // slider location????
            //draw_rectangle(
            break;
        case 5: // Rounded Rectangle
        
            break;
    }
    
    //user defined (move these to the step portion? controldraw?)
    //SliderRoundToSnap = (argument4 > 0);
    //SliderSnap = (argument5 > 0);
    //SliderSmoothSnap = (argument6 > 0);
    
    // implement these above:
    //SliderBorderColor = argument6;
    //SliderBorderAlpha = minmax(argument7,0,1);
    //SliderSelectColor = argument8;
    //SliderSelectAlpha = minmax(argument9,0,1);
    
    
    
    //todo: drawing the value in the control may be an option later on?
    
    //color_alpha(ControlFontColor,min(ControlFontAlpha,FadeAlpha));
    
    //var _dtx, _midHeight;
    //_dtx = cx + padx;
    
    //draw_text_ext(_dtx,cy + (chy-cy)/2,_txt,-1,cwx);
}

