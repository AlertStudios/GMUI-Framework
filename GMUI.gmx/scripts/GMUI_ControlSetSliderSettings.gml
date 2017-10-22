///GMUI_ControlSetSliderSettings(ticks amount, min value, max value, round values to ticks[bool], snap [bool], smooth adjust and snap[bool], vertical orientation[bool])
///Required to be called to set the SETTINGS of the slider

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetStyle");
    return false;
}

// Initialize all computed and assignment values if not yet set
if (!sliderInitialized) {
    sliderInitialized = true;
    
    // Default Computed values
    // (Values will be computed for the first time before drawn ['sliderComputed' variable])
    SliderStartEndPadding = 0;
    SliderMidPoint = 0;
    SliderQuarterPoint1 = 0;
    SliderQuarterPoint2 = 0;
    SliderTickDistance = 0;// (size compared to mid/quarter, compared to minumum distance between them, etc.)
    SliderSnapDistance = 1;// distance until it snaps to a tick
    SliderTickPoints[0] = 0;
    SliderTickInterval = 0; // not sure if will be used
    SliderRelativeFinalXorY = 0;
    SliderVertical = false;
    GMUI_ControlSliderUpdate(id);
    SliderRelativeXorY = SliderRelativeFinalXorY;
    SliderRelativePad = 0;
    Slider_t = 0;
    Slider_b = 0;
    Slider_c = 0;
    Slider_d = room_speed/4;
    
    SliderMovementScript = easeExpOut;
    SliderSnapScript = -1;
    
    // Slider_d must be greater than 0 to update correctly
    if (Slider_d <= 0) Slider_d = 1;
    
    // Default Style values
    GMUI_ControlSetSliderStyle(2,2,c_dkgray,0.6,c_ltgray,0.9,c_dkgray,0.4,c_gray,1,c_gray,0.8);

    // Default Sizing values
    GMUI_ControlSetSliderSize(16, 20, 1, 12, 10, 8, 6, 0);
    
}

// If any values are given as negative numbers, those values will remain as the control default
if (argument0 >= 0)
    SliderTickAmount = argument0;
if (is_real(argument1))
    ControlMinValue = argument1;
if (is_real(argument2))
    ControlMaxValue = argument2;
if (argument3 >= 0)
    SliderRoundValuesToSnap = (argument3 > 0);
if (argument4 >= 0)
    SliderSnap = (argument4 > 0);
if (argument5 >= 0)
    SliderSmoothSnap = (argument5 > 0);
if (argument6 >= 0)
    SliderVertical = (argument6 > 0);


return true;
    
