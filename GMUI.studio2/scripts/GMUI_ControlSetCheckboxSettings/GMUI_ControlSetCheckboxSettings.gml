///GMUI_ControlSetCheckboxSettings(padding [pixels], color on, color off, outline shape/sprite, outline color on, outline color off, transition speed)
///Required to be called to set the SETTINGS of the checkbox

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control",GMUI_ControlSetCheckboxSettings);
    return false;
}

// Initialize all computed and assignment values if not yet set
if (!toggleInitialized) {
    toggleInitialized = true;
    
    TogglePadding = 0;
    ToggleSlideAlpha = 1;
    ToggleAlpha = 1;

    Toggle_t = 0;
    Toggle_d = room_speed;
    Toggle_c = 1/Toggle_d; // rate (calculated)
    
    // Percentage for alpha
    ToggleRelativeXorY = 0;
    ToggleDistance = 1;
    
    // Toggle_d must be greater than 0 to update correctly
    if (Toggle_d <= 0)
        Toggle_d = 1;
    
    ToggleOrientation = 0; // unused with checkbox
}

if (NeedsPositionUpdate) {
    GMUI_ControlUpdateXY(id);
    NeedsPositionUpdate = false;
    NeedsDrawUpdate = true;
}

// If any values are given as negative numbers, those values will remain as the control default
if (argument0 >= 0)
    TogglePadding = argument0;

// Set toggle transition speed
if (argument6 >= 0) {
    Toggle_d = argument6;
    Toggle_c = 1/Toggle_d;
}


if (argument1 >= 0)
    ToggleColorOn = argument1;
if (argument2 >= 0)
    ToggleColorOff = argument2;
if (is_real(argument3)) {
    ToggleSlideShape = argument3; // Or sprite
    if (argument3 > 0 && !sprite_exists(argument3))
    ToggleSlideShape = -1;    
}
if (argument4 >= 0)
    ToggleSlideColorOn = argument4;
if (argument5 >= 0)
    ToggleSlideColorOff = argument5;

    

return true;
    

