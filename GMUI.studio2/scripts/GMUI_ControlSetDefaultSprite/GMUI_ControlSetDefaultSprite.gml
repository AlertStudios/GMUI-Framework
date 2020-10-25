///GMUI_ControlSetDefaultSprite(id)
///Set the default attributes of the control from the controller
function GMUI_ControlSetDefaultSprite(argument0) {

if (!instance_exists(argument0)) {
    GMUI_ThrowErrorDetailed("Invalid control",GMUI_ControlSetDefaultSprite);
    return false;
}

with (argument0) {
    GMUI_ControlSetSpriteExt(
        (GMUII()).ControlGraphic,
        (GMUII()).ControlGraphicIndex,
        (GMUII()).ControlGraphicHoveringIndex,
        (GMUII()).ControlGraphicSelectedIndex,
        (GMUII()).ControlGraphicXScale,
        (GMUII()).ControlGraphicYScale,
        (GMUII()).ControlGraphicColor,
        (GMUII()).ControlGraphicAlpha
    );
    
    ControlGraphicRotation = 0;
}


return true;
}

