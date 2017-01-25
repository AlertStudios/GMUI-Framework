#define GMUI_GridDraw
///GMUI_GridDraw()
/// Actions done to operate the grid, executed by the GMUI object in the draw event


// Count down initial disable before executing actions
if (GMUI_GridEnabled())
{
    //do grid stuff:
    
    // Assign mouse values here to easily switch out later if needed
    var MX, MY, inRegion, onDirection, mouseHor, mouseVert, ctrlObject;
    MX = mouse_x;
    MY = mouse_y;
    inRegion = false;
    
    // Check if the mouse has moved before checking for any changed selections
    if (MX != mouse_px || MY != mouse_py) {
        // Find if there is a control at that position on the current layer
        ctrlObject = GMUI_GetControlAtPosition(id,MX,MY);
        
        if (ctrlObject != -1) {
            if (DebugData) TestHoverObject = ctrlObject;
            
            if (ctrlObject != previousHoveringControl && !ctrlObject.Disabled && !ctrlObject.NonClickable) {
                GMUI_ResetControlStatus("Hovering");
                if (ctrlObject.IsAdjusted) {
                    if (GMUI_MouseInAdjustedRegion(ctrlObject,MX,MY))
                        inRegion = true;
                }
                else
                    inRegion = true;
                
                if (inRegion) {
                    // The int picker has a region on the right side for up/down
                    if (ctrlObject.ControlType == "intpicker")
                    {
                        onDirection = GMUI_MouseInSpecialRegion(ctrlObject,MX,MY);
                        
                        if (onDirection != global.GMUIHoveringDirection_None)
                            ctrlObject.HoveringDirection = onDirection;
                        else
                            ctrlObject.Hovering = 1;
                    }
                    else {
                        ctrlObject.Hovering = 1;
                    }
                    
                    // Set the hovering control and execute optional hover action if set
                    HoveringControl = ctrlObject;
                    
                    if (GMUI_IsScript(ctrlObject.HoverActionScript)) {
                        script_execute(ctrlObject.HoverActionScript);
                    }
                }
                
            }
        }
        else if (HoveringControl != -1) {
            GMUI_ResetControlStatus("Hovering");
            if (DebugData) TestHoverObject = -1;
        }
    
    
        // Reset previous position
        mouse_px = MX;
        mouse_py = MY;
    }
    
    // Mouse click on grid
    if (mouse_check_button_pressed(mb_left)) {
        GMUI_ResetControlStatus("Selected");

        // Find if there is a control at that position with the current layer
        ctrlObject = GMUI_GetControlAtPosition(id,MX,MY);

        if (ctrlObject != -1) {
            if ((!ctrlObject.Disabled) && (!ctrlObject.NonClickable) && (!ctrlObject.Hidden)) {
                if (ctrlObject.IsAdjusted) {
                    if (GMUI_MouseInAdjustedRegion(ctrlObject,MX,MY))
                        inRegion = true;
                }
                else
                    inRegion = true;
                
                if (inRegion) {
                    // Switch between special types, general input types, and other controls
                    if (ctrlObject.ControlType == "intpicker") {
                        switch (ctrlObject.HoveringDirection) {
                            case global.GMUIHoveringDirection_Up:
                            case global.GMUIHoveringDirection_Right:
                                GMUI_SetValue(ctrlObject.valueName,ctrlObject.value + 1,"integer");
                                break;
                            case global.GMUIHoveringDirection_Left:
                            case global.GMUIHoveringDirection_Down:
                                GMUI_SetValue(ctrlObject.valueName,ctrlObject.value - 1,"integer");
                                break;
                            case global.GMUIHoveringDirection_None:
                                GMUI_GridSelect(ctrlObject);
                                break;
                        }
                    }
                    else if (ctrlObject.ControlInput) {
                        GMUI_GridSelect(ctrlObject);
                    }
                    else if (ctrlObject.ActionScript != -1) {
                        // Control buttons clicked
                        GMUI_ControlActionScript(ctrlObject);
                    }
                }
            }

        }
    }
    
    // Any key event will trigger a set value on a selected control in GMUI_ControlDraw, so here    ..
    if (SelectedControl != -1) {
        if (keyboard_check_pressed(vk_tab)) {
            GMUI_GridNextControl();
        }
        else if (keyboard_check_pressed(vk_enter)) {
            GMUI_ResetControlStatus("Selected");
        }
    }
    
    
    
    // Transitioning entire grid
    
    
    
    
    // Check if the room size has changed to move any anchored controls positions
    // each control needs a relative position...
    

}


