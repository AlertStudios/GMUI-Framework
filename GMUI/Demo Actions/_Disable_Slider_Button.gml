

if (GMUI_GetControl("Slider").Disabled) {

    GMUI_ControlDisable("Slider",false);
    GMUI_ControlDisable("SliderV",false);
    
    with (GMUI_GetControl("BtnDisableSlider")) {
        GMUI_ControlSetButton("Disable It",-1,-1,-1);
    }
}
else {

    GMUI_ControlDisable("Slider",true);
    GMUI_ControlDisable("SliderV",true);
    
    with (GMUI_GetControl("BtnDisableSlider")) {
        GMUI_ControlSetButton("Enable It",-1,-1,-1);
    }
}

