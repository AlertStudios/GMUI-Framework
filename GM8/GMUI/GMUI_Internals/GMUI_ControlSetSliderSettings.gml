#define GMUI_ControlSetSliderSettings
///GMUI_ControlSetSliderSettings(tick interval, ticks amount, min value, max value, round to snap[bool], snap [bool], smooth snap [bool])
///Required to be called to set the SETTINGS of the slider
// todo: next script will set the tick amount, min number, max number, round to snap [bool]
// todo: needs default script, but will only be called if it is a slider control (default is 0 to 100)
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetStyle");
    return false;
}

// Initialize all computed and assignment values if not yet set
if (!sliderInitialized) {

    // Default Style values
    GMUI_ControlSetSliderStyle(2,2,c_dkgray,0.9,c_aqua,0.8,c_black,0.9,c_aqua,1,c_gray,0.8);

    // Default Sizing values
    GMUI_ControlSetSliderSize(16, 16, 1, 16, 12, 6);
    
    // Default Computed values
    // (Values will be computed for the first time before drawn ['sliderComputed' variable])
    SliderStartEndPadding = 0;
    SliderMidPoint = 0;
    SliderQuarterPoint = 0;
    SliderTickDistance = 0;// (size compared to mid/quarter, compared to minumum distance between them, etc.)
    SliderSnapDistance = 0;// distance until it snaps to a tick


    sliderInitialized = true;
}

// If any values are given as negative numbers, those values will remain as the control default

if (argument0 >= 0)
SliderTickInterval = argument0;
if (argument1 >= 0)
SliderTickAmount = argument1;
if (is_real(argument2))
ControlMinValue = argument2;
if (is_real(argument3))
ControlMaxValue = argument3;
if (argument4 >= 0)
SliderRoundToSnap = (argument4 > 0);
if (argument5 >= 0)
SliderSnap = (argument5 > 0);
if (argument6 >= 0)
SliderSmoothSnap = (argument6 > 0);


return true;
    

