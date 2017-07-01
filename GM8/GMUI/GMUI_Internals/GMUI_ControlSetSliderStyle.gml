#define GMUI_ControlSetSliderStyle
///GMUI_ControlSetSliderStyle(tick style [0 for none], slider style [0 for none/use sprite], Slider color, Slider alpha, bg color, bg alpha, border color, border alpha, Select color, Select alpha, tick color, tick alpha)
///Set the ONLY THE STYLE of the slider
// Tick styles:
// 0: none (slider only)
// 1: Free (No horizontal line)
// 2: Single (Horizontal line)
// 3: Rounded rectangle region
// Slider styles:
// 0: Draw none, optionally use sprite script instead
// 1: Circle
// 2: Pentagon
// 3: Rectangle
// 4: Rounded Rectangle

// todo: needs default script, but will only be called if it is a slider control (default is 0 to 100)
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetStyle");
    return false;
}

// If any values are given as negative numbers, those values will remain as the control default

if (argument0 >= 0)
SliderTickStyle = round(argument0);
if (argument1 >= 0)
SliderStyle = round(argument1);
if (argument2 >= 0)
SliderColor = argument2;
if (argument3 >= 0)
SliderAlpha = minmax(argument3,0,1);
if (argument4 >= 0)
SliderBackgroundColor = argument4;
if (argument5 >= 0)
SliderBackgroundAlpha = minmax(argument5,0,1);
if (argument6 >= 0)
SliderBorderColor = argument6;
if (argument7 >= 0)
SliderBorderAlpha = minmax(argument7,0,1);
if (argument8 >= 0)
SliderSelectColor = argument8;
if (argument9 >= 0)
SliderSelectAlpha = minmax(argument9,0,1);
if (argument10 >= 0)
SliderTickColor = argument10;
if (argument11 >= 0)
SliderTickAlpha = minmax(argument11,0,1);



return true;
    

