#define GMUI_ControlSetSliderSize
///GMUI_ControlSetSliderSize(Slider width, Slider height, Slide height, end tick height [or 0], mid tick height [or 0], quarter tick height [or 0])
///Set the ONLY THE SIZING of the slider

// todo: needs default script, but will only be called if it is a slider control (default is 0 to 100)
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetStyle");
    return false;
}

// If any values are given as negative numbers, those values will remain as the control default

if (argument0 >= 0)
SliderThumbWidth = argument0;
if (argument1 >= 0)
SliderThumbHeight = argument1;
if (argument2 >= 0)
SliderSlideHeight = argument2;
if (argument3 >= 0)
SliderEndTickHeight = argument3;
if (argument4 >= 0)
SliderMidTickHeight = argument4;
if (argument5 >= 0)
SliderQuarterTickHeight = argument5;

return true;
    

