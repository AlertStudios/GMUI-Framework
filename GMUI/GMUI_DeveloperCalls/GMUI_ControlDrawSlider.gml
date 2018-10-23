///GMUI_ControlDrawSlider(id of slider control object)
/// Draw the control as a slider

var _tt_id, _SCRIPT;
_tt_id = argument0;
_SCRIPT = GMUI_ControlDrawSlider;

// todo: check if sizes change for the control, re-calculate these variables (update flag)

with (_tt_id) {
    // If this happens, GMUI has a bug
    if (ControlType != "slider") {
        GMUI_ThrowErrorDetailed("Control Type is not slider!",_SCRIPT);
        return false;
    }
    
    // Assign drawing vars
    var cx, cp, cy, cw, ch, cwx, cwx2, chy, chy2, cworh, RoomWorH, SC, SA, _SBA;
    cx = RoomX;
    cy = RoomY;
    if (!SliderVertical)
        cp = cx+SliderStartEndPadding;
    else
        cp = cy+SliderStartEndPadding;

    cw = RoomW-cx;
    ch = RoomH-cy;
    cwx = RoomW;
    cwx2 = (RoomX+RoomW)/2;
    chy = RoomH;
    chy2 = (RoomY+RoomH)/2;
    
    // Compute the locations of all drawn elements
    if (!sliderComputed) {
        if (!SliderVertical) {
            RoomWorH = RoomW;
            cworh = cw;
        }
        else {
            RoomWorH = RoomH;
            cworh = ch;
        }
            
        SliderTickDistance = (cworh - (SliderStartEndPadding*2)) / max(SliderTickAmount - 1, 1);
        SliderMidPoint = cworh/2;
        SliderQuarterPoint1 = SliderMidPoint/2 + SliderStartEndPadding/2;
        SliderQuarterPoint2 = cworh - SliderQuarterPoint1;
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
        GMUI_ControlSliderUpdate(id);
        SliderRelativeFinalXorY = minmax(SliderRelativeFinalXorY,SliderStartEndPadding,RoomWorH-SliderStartEndPadding);
        SliderRelativeXorY = SliderRelativeFinalXorY;
        Slider_t = Slider_d;
        
        sliderComputed = true;
    }
    
    // Draw the slider region first, based on type
    if (SliderTickStyle == 2 || SliderTickStyle == 3) {
        color_alpha(SliderBackgroundColor,min(SliderBackgroundAlpha,FadeAlpha));
    }
    switch (SliderTickStyle) {
        case 1: // Free (No horizontal line)
        
            break;
        case 2: // Single (Horizontal line)
            if (!SliderVertical)
                draw_line(cp,chy2,cwx-SliderStartEndPadding,chy2);
            else
                draw_line(cwx2,cp,cwx2,chy-SliderStartEndPadding);
            break;
        case 3: // Rounded rectangle region
            if (!SliderVertical)
                draw_roundrect(cp,chy2-SliderSlideHeight/2,cwx-SliderStartEndPadding,chy2+SliderSlideHeight/2,false);
            else
                draw_roundrect(cwx2-SliderSlideHeight/2,cp,cwx2+SliderSlideHeight/2,chy-SliderStartEndPadding,false);
            break;
        case 0: // none (slider only), or sprite
        default:
            
            break;
    }
    
    // If 0 draw none, optionally use sprite script instead
    if (SliderTickStyle > 0) {
        // Set the properties of the ticks
        color_alpha(SliderTickColor,min(SliderTickAlpha,FadeAlpha));
        
        if (SliderTickHeight > 0 && SliderTickDistance > 1) {
            if (!SliderVertical) {
                for (i = 0; i < SliderTickAmount; i+=1) {
                    if (SliderTickPoints[i] >= 0) {
                        draw_line(cx+SliderTickPoints[i],chy2-SliderTickHeight,cx+SliderTickPoints[i],chy2+SliderTickHeight);
                    }
                }
            }
            else {
                for (i = 0; i < SliderTickAmount; i+=1) {
                    if (SliderTickPoints[i] >= 0) {
                        draw_line(cwx2-SliderTickHeight,cy+SliderTickPoints[i],cwx2+SliderTickHeight,cy+SliderTickPoints[i]);
                    }
                }
            }
        }
        
        // Draw the special ticks
        if (!SliderVertical) {
            if (SliderEndTickHeight > 0) {
                draw_line(cp,chy2-SliderEndTickHeight,cp,chy2+SliderEndTickHeight);
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
        else {
            if (SliderEndTickHeight > 0) {
                draw_line(cwx2-SliderEndTickHeight,cp,cwx2+SliderEndTickHeight,cp);
                draw_line(cwx2-SliderEndTickHeight,chy-SliderStartEndPadding,cwx2+SliderEndTickHeight,chy-SliderStartEndPadding);
            }
            
            if (SliderMidTickHeight > 0) {
                draw_line(cwx2-SliderMidTickHeight,cy+SliderMidPoint,cwx2+SliderMidTickHeight,cy+SliderMidPoint);
            }
            
            if (SliderQuarterTickHeight > 0) {
                draw_line(cwx2-SliderQuarterTickHeight,cy+SliderQuarterPoint1,cwx2+SliderQuarterTickHeight,cy+SliderQuarterPoint1);
                draw_line(cwx2-SliderQuarterTickHeight,cy+SliderQuarterPoint2,cwx2+SliderQuarterTickHeight,cy+SliderQuarterPoint2);
            }
        }
    }
    else if (0) {
    //not yet implemented
    }
    
    // Check if selected or not
    //todo: implement
    SC = SliderColor;
    SA = min(SliderAlpha,FadeAlpha);
    _SBA = min(SliderBorderAlpha,FadeAlpha);
    
    // Draw slider based on type
    switch (SliderStyle) {
        case 1: // Circle
        
            break;
        case 2: // PentagonUp
            if (!SliderVertical) {
                draw_primitive_begin(pr_trianglefan);
                draw_vertex_color(cx+SliderRelativeXorY,chy2-SliderThumbHeight/2,SC,SA);
                draw_vertex_color(cx+SliderRelativeXorY-SliderThumbWidth/2,chy2-SliderThumbHeight/2+SliderThumbWidth/2,SC,SA);
                draw_vertex_color(cx+SliderRelativeXorY-SliderThumbWidth/2,chy2+SliderThumbHeight/2,SC,SA);
                draw_vertex_color(cx+SliderRelativeXorY+SliderThumbWidth/2,chy2+SliderThumbHeight/2,SC,SA);
                draw_vertex_color(cx+SliderRelativeXorY+SliderThumbWidth/2,chy2-SliderThumbHeight/2+SliderThumbWidth/2,SC,SA);
                draw_primitive_end();
                draw_primitive_begin(pr_linestrip);
                draw_vertex_color(cx+SliderRelativeXorY,chy2-SliderThumbHeight/2,SliderBorderColor,_SBA);
                draw_vertex_color(cx+SliderRelativeXorY-SliderThumbWidth/2,chy2-SliderThumbHeight/2+SliderThumbWidth/2,SliderBorderColor,_SBA);
                draw_vertex_color(cx+SliderRelativeXorY-SliderThumbWidth/2,chy2+SliderThumbHeight/2,SliderBorderColor,_SBA);
                draw_vertex_color(-1+cx+SliderRelativeXorY+SliderThumbWidth/2,chy2+SliderThumbHeight/2,SliderBorderColor,_SBA);
                draw_vertex_color(-1+cx+SliderRelativeXorY+SliderThumbWidth/2,chy2-SliderThumbHeight/2+SliderThumbWidth/2,SliderBorderColor,_SBA);
                draw_vertex_color(-1+cx+SliderRelativeXorY,chy2-SliderThumbHeight/2,SliderBorderColor,_SBA);
                draw_primitive_end();
            }
            else {
                draw_primitive_begin(pr_trianglefan);
                draw_vertex_color(cwx2+SliderThumbHeight/2,cy+SliderRelativeXorY,SC,SA);
                draw_vertex_color(cwx2+SliderThumbHeight/2-SliderThumbWidth/2,cy+SliderRelativeXorY-SliderThumbWidth/2,SC,SA);
                draw_vertex_color(cwx2-SliderThumbHeight/2,cy+SliderRelativeXorY-SliderThumbWidth/2,SC,SA);
                draw_vertex_color(cwx2-SliderThumbHeight/2,cy+SliderRelativeXorY+SliderThumbWidth/2,SC,SA);
                draw_vertex_color(cwx2+SliderThumbHeight/2-SliderThumbWidth/2,cy+SliderRelativeXorY+SliderThumbWidth/2,SC,SA);
                draw_primitive_end();
                draw_primitive_begin(pr_linestrip);
                draw_vertex_color(-1+cwx2+SliderThumbHeight/2,cy+SliderRelativeXorY,SliderBorderColor,_SBA);
                draw_vertex_color(-1+cwx2+SliderThumbHeight/2-SliderThumbWidth/2,cy+SliderRelativeXorY-SliderThumbWidth/2,SliderBorderColor,_SBA);
                draw_vertex_color(cwx2-SliderThumbHeight/2,cy+SliderRelativeXorY-SliderThumbWidth/2,SliderBorderColor,_SBA);
                draw_vertex_color(cwx2-SliderThumbHeight/2,cy+SliderRelativeXorY+SliderThumbWidth/2,SliderBorderColor,_SBA);
                draw_vertex_color(-1+cwx2+SliderThumbHeight/2-SliderThumbWidth/2,cy+SliderRelativeXorY+SliderThumbWidth/2,SliderBorderColor,_SBA);
                draw_vertex_color(-1+cwx2+SliderThumbHeight/2,cy+SliderRelativeXorY,SliderBorderColor,_SBA);
                draw_primitive_end();
            }
            break;
        case 3: // PentagonDown
            if (!SliderVertical) {
                draw_primitive_begin(pr_trianglefan);
                draw_vertex_color(cx+SliderRelativeXorY,chy2+SliderThumbHeight/2,SliderColor,SA);
                draw_vertex_color(cx+SliderRelativeXorY+SliderThumbWidth/2,chy2+SliderThumbHeight/2-SliderThumbWidth/2,SC,SA);
                draw_vertex_color(cx+SliderRelativeXorY+SliderThumbWidth/2,chy2-SliderThumbHeight/2,SC,SA);
                draw_vertex_color(cx+SliderRelativeXorY-SliderThumbWidth/2,chy2-SliderThumbHeight/2,SC,SA);
                draw_vertex_color(cx+SliderRelativeXorY-SliderThumbWidth/2,chy2+SliderThumbHeight/2-SliderThumbWidth/2,SC,SA);
                draw_primitive_end();
                draw_primitive_begin(pr_linestrip);
                draw_vertex_color(-1+cx+SliderRelativeXorY,chy2+SliderThumbHeight/2,SliderBorderColor,_SBA);
                draw_vertex_color(-1+cx+SliderRelativeXorY+SliderThumbWidth/2,chy2+SliderThumbHeight/2-SliderThumbWidth/2,SliderBorderColor,_SBA);
                draw_vertex_color(-1+cx+SliderRelativeXorY+SliderThumbWidth/2,chy2-SliderThumbHeight/2,SliderBorderColor,_SBA);
                draw_vertex_color(cx+SliderRelativeXorY-SliderThumbWidth/2,chy2-SliderThumbHeight/2,SliderBorderColor,_SBA);
                draw_vertex_color(cx+SliderRelativeXorY-SliderThumbWidth/2,chy2+SliderThumbHeight/2-SliderThumbWidth/2,SliderBorderColor,_SBA);
                draw_vertex_color(cx+SliderRelativeXorY,chy2+SliderThumbHeight/2,SliderBorderColor,_SBA);
                draw_primitive_end();
            }
            else {
                draw_primitive_begin(pr_trianglefan);
                draw_vertex_color(cwx2-SliderThumbHeight/2,cy+SliderRelativeXorY,SC,SA);
                draw_vertex_color(cwx2-SliderThumbHeight/2+SliderThumbWidth/2,cy+SliderRelativeXorY+SliderThumbWidth/2,SC,SA);
                draw_vertex_color(cwx2+SliderThumbHeight/2,cy+SliderRelativeXorY+SliderThumbWidth/2,SC,SA);
                draw_vertex_color(cwx2+SliderThumbHeight/2,cy+SliderRelativeXorY-SliderThumbWidth/2,SC,SA);
                draw_vertex_color(cwx2-SliderThumbHeight/2+SliderThumbWidth/2,cy+SliderRelativeXorY-SliderThumbWidth/2,SC,SA);
                draw_primitive_end();
                draw_primitive_begin(pr_linestrip);
                draw_vertex_color(cwx2-SliderThumbHeight/2,cy+SliderRelativeXorY,SliderBorderColor,_SBA);
                draw_vertex_color(cwx2-SliderThumbHeight/2+SliderThumbWidth/2,cy+SliderRelativeXorY+SliderThumbWidth/2,SliderBorderColor,_SBA);
                draw_vertex_color(-1+cwx2+SliderThumbHeight/2,cy+SliderRelativeXorY+SliderThumbWidth/2,SliderBorderColor,_SBA);
                draw_vertex_color(-1+cwx2+SliderThumbHeight/2,cy+SliderRelativeXorY-SliderThumbWidth/2,SliderBorderColor,_SBA);
                draw_vertex_color(cwx2-SliderThumbHeight/2+SliderThumbWidth/2,cy+SliderRelativeXorY-SliderThumbWidth/2,SliderBorderColor,_SBA);
                draw_vertex_color(cwx2-SliderThumbHeight/2,cy+SliderRelativeXorY,SliderBorderColor,_SBA);
                draw_primitive_end();
            }
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
        case 6: // Hexagon
        
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
    
    
    
    //todo: drawing the value in/below the control may be an option later on?
    
    //color_alpha(ControlFontColor,min(ControlFontAlpha,FadeAlpha));
    
    //var _dtx, _midHeight;
    //_dtx = cx + padx;
    
    //draw_text_ext(_dtx,cy + (chy-cy)/2,_txt,-1,cwx);
}

