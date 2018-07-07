///GMUI_ControlSetButton(Text in button or "" , graphic inside button or -1 , font alignment or -1, text color on hover or -1)
///Set the picker values of the control (to override the defaults)

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control",GMUI_ControlSetButton);
    return false;
}

    ControlButtonText = string(argument0);
    
    if (sprite_exists(argument1))
        ControlButtonGraphic = argument1;
    else
        ControlButtonGraphic = -1;
    
    // Uses same alignment as set in font style
    if (argument2 != -1)
        ControlFontAlign = argument2;
        
    if (argument3 != -1)
    {
        ControlButtonTextHoveringOn = true;
        ControlButtonTextHoverColor = argument3;
    }
    else
    {
        ControlButtonTextHoveringOn = false;
        ControlButtonTextHoverColor = 0;
    }
    

return true;
    

