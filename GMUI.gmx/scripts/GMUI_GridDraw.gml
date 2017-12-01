///GMUI_GridDraw()
///Actions done to operate the grid, executed by the GMUI object in the draw event


// Count down initial disable before executing actions
if (GMUI_GridEnabled())
{
    //do grid stuff:
    
    // Assign mouse values here to easily switch out later if needed
    var MX, MY, inRegion, onDirection, mouseHor, mouseVert, ctrlObject, clickOffEvent;
    MX = mouse_x;
    MY = mouse_y;
    inRegion = false;
    
    // Check if the mouse has moved before checking for any changed selections
    if (MX != mouse_px || MY != mouse_py) {
        // Find if there is a control at that position on the current layer
        ctrlObject = GMUI_GetControlAtPosition(id,MX,MY);
        
        if (ctrlObject != -1) {
            if (DebugData) TestHoverObject = ctrlObject;
            
            if (previousHoveringControl != -1 && ctrlObject != previousHoveringControl) {
                (previousHoveringControl).Hovering = 0;
                (previousHoveringControl).HoveringDirection = 0;
                if (GMUI_IsScript((previousHoveringControl).HoverOffActionScript)) {
                    script_execute((previousHoveringControl).HoverOffActionScript);
                }
                previousHoveringControl = -1;
            }
            
            if (!ctrlObject.Disabled && !ctrlObject.NonClickable) {
                ctrlObject.Hovering = 0;
                ctrlObject.HoveringDirection = 0;
                
                if (!ctrlObject.IsAdjusted) {
                    inRegion = true;
                }
                else if (GMUI_MouseInAdjustedRegion(ctrlObject,MX,MY)) {
                    inRegion = true;
                }
                    
                
                if (inRegion) {
                    // The picker controls have a region on the sides for up/down
                    if (ctrlObject.ControlPicker)
                    {
                        onDirection = GMUI_MouseInSpecialRegion(ctrlObject,MX,MY);
                        
                        if (onDirection != global.GMUIHoveringDirection_None) {
                            ctrlObject.HoveringDirection = onDirection;
                        }
                        else {
                            ctrlObject.Hovering = 1;
                        }
                            
                    }
                    else {
                        ctrlObject.Hovering = 1;
                    }
                    
                    // Set the hovering control and execute optional hover action if set
                    if (ctrlObject != previousHoveringControl) {
                        HoveringControl = ctrlObject;
                        previousHoveringControl = ctrlObject;
                        
                        if (GMUI_IsScript(ctrlObject.HoverActionScript)) {
                            script_execute((ctrlObject).HoverActionScript);
                        }
                    }
                }
                
            }
        }
        else if (HoveringControl != -1) {
            if (previousHoveringControl != -1) {
            global.test = previousHoveringControl;
                if (GMUI_IsScript((previousHoveringControl).HoverOffActionScript)) {
                    script_execute((previousHoveringControl).HoverOffActionScript);
                }
                previousHoveringControl = -1;
            }
            GMUI_ResetControlStatus("Hovering",id);
            HoveringControl = -1;
        }
    
    
        // Reset previous position
        mouse_px = MX;
        mouse_py = MY;
    }
    
    // Mouse click on grid
    if (mouse_check_button_pressed(mb_left)) {
        GMUI_ResetControlStatus("Selected",id);
        
        // Check if we are looking at a menu, and if this is a click outside of it first
        clickOffEvent = false;
        if (UILayer >= GMUI_menu_layer && UILayer < GMUI_menu_layer + GMUI_menuLastId) {
            if (GMUI_groupClickOff[UILayer,GMUI_menuCurrent]) {
                if (!GMUI_MouseInGroupRegion(GMUI_menuCurrent,UILayer)) {
                    GMUI_ShowMenuId(GMUI_menuCurrent,false,true);
                    clickOffEvent = true;
                }
            }
        }
        
        if (!clickOffEvent) {
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
                        if (ctrlObject.ControlPicker) {
                            switch (ctrlObject.HoveringDirection) {
                                case global.GMUIHoveringDirection_Up:
                                case global.GMUIHoveringDirection_Right:
                                    if (ctrlObject.ControlType == "intpicker")
                                        GMUI_SetValue(ctrlObject.valueName,ctrlObject.value + 1,"integer");
                                    else if (ctrlObject.ControlType == "doublepicker")
                                        GMUI_SetValue(ctrlObject.valueName,ctrlObject.value + 1,"double");
                                    else if (ctrlObject.optionsInitialized) {
                                        if (ctrlObject.value == ctrlObject.OptionsMax)
                                            ctrlObject.value = ctrlObject.OptionsMin;
                                        else
                                            ctrlObject.value = ds_map_find_next(ctrlObject.OptionsMap,ctrlObject.value);
                                    }
                                    break;
                                case global.GMUIHoveringDirection_Left:
                                case global.GMUIHoveringDirection_Down:
                                    if (ctrlObject.ControlType == "intpicker")
                                        GMUI_SetValue(ctrlObject.valueName,ctrlObject.value - 1,"integer");
                                    else if (ctrlObject.ControlType == "doublepicker")
                                        GMUI_SetValue(ctrlObject.valueName,ctrlObject.value - 1,"double");
                                    else if (ctrlObject.optionsInitialized) {
                                        if (ctrlObject.value == ctrlObject.OptionsMin)
                                            ctrlObject.value = ctrlObject.OptionsMax;
                                        else
                                            ctrlObject.value = ds_map_find_previous(ctrlObject.OptionsMap,ctrlObject.value);
                                    }
                                    break;
                                case global.GMUIHoveringDirection_None:
                                    if (ctrlObject.ControlInput)
                                        GMUI_GridSelect(ctrlObject);
                                    break;
                            }
                        }
                        else if (ctrlObject.ControlSelectable) {
                            // Normal input controls
                            GMUI_GridSelect(ctrlObject);
                        }
                        else if (ctrlObject.ControlType == "checkbox" || ctrlObject.ControlType == "toggle") {
                            GMUI_SetValue(ctrlObject.valueName,1-ctrlObject.value,"integer");
                        }
                        else if (ctrlObject.ActionScript != -1) {
                            // Control buttons clicked
                            GMUI_ControlActionScript(ctrlObject);
                        }
                    }
                }
    
            }
            
        }
    }
    
    // Any key event will trigger a set value on a selected control in GMUI_ControlDraw, so here    ..
    if (SelectedControl != -1) {
        if (GMUI_NavigateNextControl(true)) {
            GMUI_GridNextControl(true);
        }
        else if (GMUI_NavigateNextControl(false)) {
            GMUI_GridNextControl(false);
        }
        else if (keyboard_check_pressed(vk_enter)) {
            GMUI_ResetControlStatus("Selected",id);
        }
    }
    
    // The grid offset has changed, all controls must update their position
    if (UIsnaptoview) {
        if (previousXOffset != view_xview[UIgridview] || previousYOffset != view_yview[UIgridview]) {
            GMUI_ResetControlStatus("Position",id);
            previousXOffset = view_xview[UIgridview];
            previousYOffset = view_yview[UIgridview];
        }
    }
    
    
    // Transitioning entire grid
    
    
    
    // Check if the room size has changed to move any anchored controls positions
    // each control needs a relative position...
    

}


