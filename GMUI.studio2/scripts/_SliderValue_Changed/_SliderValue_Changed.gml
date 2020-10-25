function _SliderValue_Changed() {

GMUI_SetValue("SliderVal",string(round(GMUI_GetValue("Slider"))),global.GMUIDataTypeString);

}