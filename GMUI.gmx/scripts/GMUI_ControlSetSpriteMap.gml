///GMUI_ControlSetSpriteMap(sprite top, sprite top right, right, bottom right, bottom, bottom left, left, top left, center, center fixed partial [1] / stretched[0])
///Replace the control drawing with a sprite map of each corner, side, and center

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control",GMUI_ControlSetSpriteMap);
    return false;
}

if (sprite_exists(argument0))
    ControlGraphicTop = argument0;
else
    ControlGraphicTop = -1;
    
if (sprite_exists(argument1))
    ControlGraphicTopRight = argument1;
else
    ControlGraphicTopRight = -1;

if (sprite_exists(argument2))
    ControlGraphicRight = argument2;
else
    ControlGraphicRight = -1;
    
if (sprite_exists(argument3))
    ControlGraphicBottomRight = argument3;
else
    ControlGraphicBottomRight = -1;
    
if (sprite_exists(argument4))
    ControlGraphicBottom = argument4;
else
    ControlGraphicBottom = -1;
    
if (sprite_exists(argument5))
    ControlGraphicBottomLeft = argument5;
else
    ControlGraphicBottomLeft = -1;
    
if (sprite_exists(argument6))
    ControlGraphicLeft = argument6;
else
    ControlGraphicLeft = -1;
    
if (sprite_exists(argument7))
    ControlGraphicTopLeft = argument7;
else
    ControlGraphicTopLeft = -1;
    
if (sprite_exists(argument8))
    ControlGraphicCenter = argument8;
else
    ControlGraphicCenter = -1;
    
if (is_real(argument9))
    ControlGraphicCenterIsFixed = !(argument9 < 1);
else
    ControlGraphicCenterIsFixed = 0;


ControlGraphicMapIsUsed = true; 

return true;
