///GMUI_ControlSetToggleSettings(padding [pixels], color on, color off, slide shape/sprite, slide color on, slide color off, transition speed, orientation, Toggle Thickness [cell decimal])
///Required to be called to set the SETTINGS of the toggle
function GMUI_ControlSetToggleSettings(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8) {
//todo: create checkbox alias for this script (alpha value will utilize the toggle change vars)

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control",GMUI_ControlSetToggleSettings);
    return false;
}

// Initialize all computed and assignment values if not yet set
if (!toggleInitialized) {
    toggleInitialized = true;
    
    TogglePadding = 0;
    ToggleOrientation = global.GMUIDirectionTypeHorizontal;
    ToggleRelativeXorY = 0;
    ToggleDistance = 0;
    
    ToggleThumbSize = 0;
    ToggleThickness = 0;
    ToggleThumbPad = 4;
    
    ToggleMidPoint = 0;
    
    ToggleSlideAlpha = 1;
    ToggleAlpha = 1;
    
    Toggle_t = 0;
    Toggle_c = 1; // rate (calculated)
    Toggle_d = room_speed;
    
    // Toggle_d must be greater than 0 to update correctly
    if (Toggle_d <= 0)
        Toggle_d = 1;
        
    NeedsPositionUpdate = true;
}

if (NeedsPositionUpdate) {
    GMUI_ControlUpdateXY(id);
    NeedsPositionUpdate = false;
    NeedsDrawUpdate = 1;
}

// If any values are given as negative numbers, those values will remain as the control default
if (argument0 >= 0)
    TogglePadding = argument0;
        
if (argument7 >= 0)
    ToggleOrientation = argument7;
    
if (argument8 >= 0)
    ToggleThickness = argument8;

// Set positions based on orientation
if (ToggleOrientation == global.GMUIDirectionTypeHorizontal) {
    // Set sizing
    ToggleThickness = min(ToggleThickness,CellWide - (ToggleThumbPad/(GMUIP).cellsize));
    if (ToggleThickness <= 0)
        ToggleThickness = min(CellWide,CellHigh);
        
    ToggleThumbSize = ToggleThickness*(GMUIP).cellsize;
    //ToggleThumbSize = RoomH - RoomY - ToggleThumbPad;
    ToggleInitialXorY = RoomX + TogglePadding;
    ToggleFinalXorY = RoomW - TogglePadding*2 - ToggleThumbSize + 1;
}
else {
    // Set sizing
    ToggleThickness = min(ToggleThickness,CellHigh - (ToggleThumbPad/(GMUIP).cellsize_h));
    if (ToggleThickness <= 0)
        ToggleThickness = min(CellWide,CellHigh);
        
    ToggleThumbSize = ToggleThickness*(GMUIP).cellsize_h;
    //ToggleThumbSize = RoomW - RoomX - ToggleThumbPad;
    ToggleInitialXorY = RoomY + TogglePadding;
    ToggleFinalXorY = RoomH - TogglePadding*2 - ToggleThumbSize + 1;
}

ToggleDistance = ToggleFinalXorY - ToggleInitialXorY;

// Set toggle transition speed
if (argument6 >= 0) {
    Toggle_d = argument6;
    Toggle_c = 1/Toggle_d * ToggleDistance;
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
}

