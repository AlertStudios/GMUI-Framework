#define _SliderMid_Button
var slider;
slider = GMUI_GetControl("Slider");

GMUI_SetValue("Slider",(slider.ControlMinValue+slider.ControlMaxValue)/2,2);

