///GMUI_ControlSetSliderStyle(tick style [0 for none], slider style [0 for none/use sprite], Slide bg color, Slide bg alpha, Slider color, Slider alpha, border color, border alpha, Select color, Select alpha, tick color, tick alpha)
///Set the ONLY THE STYLE of the slider
// Tick styles:
// 0: none (slider only)
// 1: Free (No horizontal line)
// 2: Single (Horizontal line)
// 3: Rounded rectangle region
// Slider styles:
// 0: Draw none, optionally use sprite script instead
// 1: Circle
// 2: PentagonUp
// 3: PentagonDown
// 4: Rectangle
// 5: Rounded Rectangle
// 6: hexagon
function GMUI_ControlSetSliderStyle(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11) {

if (!GMUI_IsControl() && id != GMUII()) {
    GMUI_ThrowErrorDetailed("Invalid control",GMUI_ControlSetSliderStyle);
    return false;
}

if (!sliderInitialized) {
    GMUI_ThrowErrorDetailed("Must call GMUI_ControlSetSettings() first",GMUI_ControlSetSliderSize);
    return false;
}

// If any values are given as negative numbers, those values will remain as the control default

if (argument0 >= 0)
SliderTickStyle = round(argument0);
if (argument1 >= 0)
SliderStyle = round(argument1);
if (argument2 >= 0)
SliderBackgroundColor = argument2;
if (argument3 >= 0)
SliderBackgroundAlpha = GMUIminmax(argument3,0,1);
if (argument4 >= 0)
SliderColor = argument4;
if (argument5 >= 0)
SliderAlpha = GMUIminmax(argument5,0,1);
if (argument6 >= 0)
SliderBorderColor = argument6;
if (argument7 >= 0)
SliderBorderAlpha = GMUIminmax(argument7,0,1);
if (argument8 >= 0)
SliderSelectColor = argument8;
if (argument9 >= 0)
SliderSelectAlpha = GMUIminmax(argument9,0,1);
if (argument10 >= 0)
SliderTickColor = argument10;
if (argument11 >= 0)
SliderTickAlpha = GMUIminmax(argument11,0,1);



return true;
}

