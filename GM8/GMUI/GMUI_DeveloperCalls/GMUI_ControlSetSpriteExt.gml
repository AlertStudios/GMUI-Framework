#define GMUI_ControlSetSpriteExt
///GMUI_ControlSetSpriteExt(sprite, subimage, hover subimage, selected subimage, xscale, yscale, color, alpha)
///Replace the control drawing with a sprite with extra parameters

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control","GMUI_ControlSetSpriteExt");
    return false;
}
    
    if (sprite_exists(argument0))
        ControlGraphic = argument0;
    else
        ControlGraphic = -1;
    
    if (is_real(argument1))
        ControlGraphicIndex = argument1;
    else
        ControlGraphicIndex = 0;
        
    if (is_real(argument2))
        ControlGraphicHoveringIndex = argument2;
    else
        ControlGraphicHoveringIndex = 0;
        
    if (is_real(argument3))
        ControlGraphicSelectedIndex = argument3;
    else
        ControlGraphicSelectedIndex = 0;
        
    if (is_real(argument4))
        ControlGraphicXScale = argument4;
    else
        ControlGraphicXScale = 1;
    
    if (is_real(argument5))
        ControlGraphicYScale = argument5;
    else
        ControlGraphicYScale = 1;
        
    if (is_real(argument6))
        ControlGraphicColor = argument6;
    else
        ControlGraphicColor = c_white;
    
    if (is_real(argument7))
        ControlGraphicAlpha = argument7;
    else
        ControlGraphicAlpha = 1;
        

return true;

