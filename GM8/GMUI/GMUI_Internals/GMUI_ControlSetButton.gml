#define GMUI_ControlSetButton
/// Set the picker values of the control (to override the defaults)
//GMUI_ControlSetButton(Text in button or "" , graphic inside button or -1 , sprite to replace drawn button or -1, font alignment or -1, text color on hover or -1)
if (!GMUI_IsControl() && id != global.GMUIiid)
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetButton");
    return false;
}

    ControlButtonText = string(argument0);
    
    if (sprite_exists(argument1))
        ControlButtonGraphic = argument1;
    else
        ControlButtonGraphic = -1;
        
    if (sprite_exists(argument2))
        ControlButtonReplaceImage = argument2;
    else
        ControlButtonReplaceImage = -1;
    
    // Uses same alignment as set in font style
    if (argument3 != -1)
        ControlFontAlign = argument3;
        
    if (argument4 != -1)
    {
        ControlButtonTextHoveringOn = true;
        ControlButtonTextHoverColor = argument4;
    }
    else
    {
        ControlButtonTextHoveringOn = false;
        ControlButtonTextHoverColor = 0;
    }
    

return true;
    

