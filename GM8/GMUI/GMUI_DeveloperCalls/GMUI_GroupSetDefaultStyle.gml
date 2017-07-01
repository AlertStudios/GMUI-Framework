#define GMUI_GroupSetDefaultStyle
///GMUI_GroupSetDefaultStyle(id)
/// Get the default style values from the grid controller

if (!instance_exists(argument0)) {
    GMUI_ThrowErrorDetailed("Invalid control",GMUI_GroupSetDefaultStyle);
    return false;
}

with (argument0) {

    ControlHasGroupStyle = (GMUII()).ControlHasGroupStyle;
    
    if (ControlHasGroupStyle) {
        GMUI_GroupSetStyle(
            (GMUII()).GroupBackgroundColor,
            (GMUII()).GroupBackgroundAlpha,
            (GMUII()).GroupBorderColor,
            (GMUII()).GroupBorderAlpha,
            (GMUII()).GroupIsRoundRect
        );
    }
}

return true;

