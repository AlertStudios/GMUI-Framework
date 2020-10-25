

if (argument0 == 1) {
    GMUI_ControlDisable("BtnDisable1",true);
    GMUI_ControlDisable("BtnDisable2",false);
}
else {
    GMUI_ControlDisable("BtnDisable2",true);
    GMUI_ControlDisable("BtnDisable1",false);
}

