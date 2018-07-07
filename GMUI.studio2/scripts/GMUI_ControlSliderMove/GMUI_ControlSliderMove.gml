///GMUI_ControlSliderMove([bool] Move to mouse, else stop and set)
///Called by control. Move the position of the thumb based on mouse position or stop where the mouse is

// Update adjustment
if (argument0) {
    var MX,MY;
    MX = mouse_x-(GMUIP).GMUI_grid_x[Layer];
    MY = mouse_y-(GMUIP).GMUI_grid_y[Layer];
    
    if (!SliderVertical)
        SliderRelativeFinalXorY = minmax(MX,RoomX+SliderStartEndPadding,RoomW-SliderStartEndPadding)-RoomX;
    else
        SliderRelativeFinalXorY = minmax(MY,RoomY+SliderStartEndPadding,RoomH-SliderStartEndPadding)-RoomY;
}
    
// Set value to position
var vald,pad2,vali;
vald = ControlMaxValue-ControlMinValue;
pad2 = SliderStartEndPadding*2;

if (!SliderVertical)
    valueSetting = vald*(SliderRelativeFinalXorY-SliderStartEndPadding)/(RoomW-RoomX-pad2)+ControlMinValue;
else
    valueSetting = vald*(SliderRelativeFinalXorY-SliderStartEndPadding)/(RoomH-RoomY-pad2)+ControlMinValue;
    
if (SliderRoundValuesToSnap) {
    vali = vald/(SliderTickAmount-1);
    valueSetting = round(valueSetting/vali)*vali;
}
    
// Set transitioning values if smoothsnap on
if (SliderSmoothSnap) {
    if (script_exists(SliderMovementScript)) {
        if (round(Slider_c) != round(SliderRelativeFinalXorY-SliderRelativeXorY)) {
            Slider_b = SliderRelativeXorY;
            if (SliderSnap){
                Slider_c = round((SliderRelativeFinalXorY-SliderStartEndPadding)/SliderSnapDistance)*SliderSnapDistance
                    + SliderStartEndPadding - SliderRelativeXorY;
            }
            else {
                Slider_c = SliderRelativeFinalXorY-SliderRelativeXorY;
            }
            
            if (Slider_c != 0)
                Slider_t = 0;
        }
        
        if (Slider_t < Slider_d) {
            Slider_t += 1;
            SliderRelativeXorY = script_execute(SliderMovementScript,Slider_t,Slider_b,Slider_c,Slider_d);
        }
        else {
            Slider_t = Slider_d;
        }
    }
}
else {
    Slider_t = 0;
    
    if (SliderSnap)
        SliderRelativeXorY = round((SliderRelativeFinalXorY-SliderStartEndPadding)/SliderSnapDistance)*SliderSnapDistance
            + SliderStartEndPadding;
    else
        SliderRelativeXorY = SliderRelativeFinalXorY;
}

    
// Update actual value
if (!argument0) {
    if (real(value) != valueSetting)
        GMUI_SetValue(valueName,valueSetting,2);
}


