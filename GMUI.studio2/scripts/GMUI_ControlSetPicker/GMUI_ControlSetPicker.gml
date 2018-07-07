///GMUI_ControlSetPicker(picker width, picker height, picker direction, picker_right/up sprite, picker_left/down sprite)
///Set the picker values of the control (to override the defaults)
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetPicker");
    return false;
}

    if (argument0 >= 0)
        ControlPickerWidth = argument0;
    if (argument1 >= 0)
        ControlPickerHeight = argument1;
    if (argument2 >= 0) {
        ControlPickerDirection = argument2;
        if (argument2 != global.GMUIDirectionTypeSideVertical)
            ControlFontAlign = fa_center;
    }
    
    if (sprite_exists(argument3))
        ControlPickerSpriteRightOrUp = argument3;
    if (sprite_exists(argument4))
        ControlPickerSpriteLeftOrDown = argument4;
    

return true;


