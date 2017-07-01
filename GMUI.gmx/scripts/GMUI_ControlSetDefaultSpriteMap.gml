///GMUI_ControlSetDefaultSpriteMap(id)
///Set the default attributes of the control from the controller

if (!instance_exists(argument0)) {
    GMUI_ThrowErrorDetailed("Invalid control",GMUI_ControlSetDefaultSpriteMap);
    return false;
}

with (argument0) {
    GMUI_ControlSetSpriteMap(
        (GMUII()).ControlGraphicTop,
        (GMUII()).ControlGraphicTopRight,
        (GMUII()).ControlGraphicRight,
        (GMUII()).ControlGraphicBottomRight,
        (GMUII()).ControlGraphicBottom,
        (GMUII()).ControlGraphicBottomLeft,
        (GMUII()).ControlGraphicLeft,
        (GMUII()).ControlGraphicTopLeft,
        (GMUII()).ControlGraphicCenter,
        (GMUII()).ControlGraphicCenterIsFixed
    );
    
    ControlGraphicMapIsUsed = false;
}


return true;
