///GMUI_ControlSetSprite(sprite, subimage, hover subimage, selected subimage)
///Replace the control drawing with a sprite instead

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control",GMUI_ControlSetSprite);
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

return true;


