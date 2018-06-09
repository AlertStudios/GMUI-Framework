#define GMUI_DrawEvent
///GMUI_GridDraw()
///Actions done to operate the grid, executed by the GMUI object in the draw event


// Count down initial disable before executing actions
if (GMUI_GridEnabled())
{
    //do grid stuff:
    
    // Assign mouse values here to easily switch out later if needed
    var MX, MY, inRegion, onDirection, mouseHor, mouseVert, ctrlObject, clickOffEvent, mouseEvent;
    MX = mouse_x;
    MY = mouse_y;
    inRegion = false;
    mouseEvent = true;
    
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
            
            if (!ctrlObject.Disabled && !ctrlObject.NonClickable && !ctrlObject.Hidden) {
                if (ctrlObject.ControlHasScrollbar) {
                    if (!ctrlObject.Scrollbar_dragging)
                        ctrlObject.Scrollbar_hover = false;
                }
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
                    else if (ctrlObject.ControlHasScrollbar) {
                        if (MX >= ctrlObject.Scrollbar_x) {
                            ctrlObject.Scrollbar_hover = true;
                        }
                        else {
                            ctrlObject.Hovering = 1;
                        }
                    }
                    else {
                        ctrlObject.Hovering = 1;
                    }
                    
                    if (!ctrlObject.Hidden)
                        GMUI_GridUpdateLayer(ctrlObject.GMUIP,ctrlObject.Layer);
                    
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
        else {
            // No control at mouse, reset hover
            if (HoveringControl != -1) {
                if (previousHoveringControl != -1) {
                global.test = previousHoveringControl;
                GMUI_GridUpdateLayer(previousHoveringControl.GMUIP,previousHoveringControl.Layer);
                    if (GMUI_IsScript((previousHoveringControl).HoverOffActionScript)) {
                        script_execute((previousHoveringControl).HoverOffActionScript);
                    }
                    previousHoveringControl = -1;
                }
                GMUI_ResetControlStatus("Hovering",id);
                HoveringControl = -1;
            }
            
            // Check for scrollbar actions
            var _MC; _MC = GMUI_GroupMouseOnScrollbar(id, MX);
            if (_MC > -1) {
                _MC.Scrollbar_hover = true;
            }
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
                        GMUI_GridUpdateLayer(ctrlObject.GMUIP,ctrlObject.Layer);
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
                                        if (ctrlObject.value == ctrlObject.OptionsLast)
                                            ctrlObject.value = ctrlObject.OptionsFirst;
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
                                        if (ctrlObject.value == ctrlObject.OptionsFirst)
                                            ctrlObject.value = ctrlObject.OptionsLast;
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
                        else if (ctrlObject.ControlItemList) {
                            // For lists that have a scrollbar, check which region we are in
                            if (ctrlObject.ControlHasScrollbar) {
                                if (MX >= ctrlObject.Scrollbar_x) {
                                    // Drag the scrollbar
                                    var _MPos,_SPos;
                                    _MPos = MY - ctrlObject.ActualY;
                                    _SPos = ctrlObject.Scrollbar_pos_y - ctrlObject.Scrollbar_y;
                                    ctrlObject.Scrollbar_dragging = true;
                                    
                                    if (_MPos >= _SPos && _MPos < _SPos + ctrlObject.Scrollbar_height)
                                        ctrlObject.Scrollbar_drag_y = _MPos - _SPos;
                                    else
                                        ctrlObject.Scrollbar_drag_y = ctrlObject.Scrollbar_height/2;
                                        
                                }
                                else {
                                    // Select List Region click
                                    GMUI_ControlListOffset(ctrlObject, UIEnableSurfaces, MX, MY);
                                    if (ctrlObject.ItemListHoverIndex > 0) {
                                        ctrlObject.ItemListSelectedId = ctrlObject.ItemListId[ctrlObject.ItemListHoverIndex];
                                        if (script_exists(ctrlObject.ItemListActionScript))
                                            script_execute(ctrlObject.ItemListActionScript,ctrlObject.ItemListSelectedId);
                                    }
                                }
                            }
                            else {
                                // Select List Region click
                                GMUI_ControlListOffset(ctrlObject, UIEnableSurfaces, MX, MY);
                                if (ctrlObject.ItemListHoverIndex > 0) {
                                    ctrlObject.ItemListSelectedId = ctrlObject.ItemListId[ctrlObject.ItemListHoverIndex];
                                    if (script_exists(ctrlObject.ItemListActionScript))
                                        script_execute(ctrlObject.ItemListActionScript,ctrlObject.ItemListSelectedId);
                                }
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
                        else
                            mouseEvent = false;
                        // If enabled, consume the mouse event if triggered
                        if (mouseEvent && CaptureMouseEvents)
                            mouse_clear(mb_left);
                        
                    }
                }
    
            }
            else {
                // No control on mouse
                GMUI_GridUpdateLayer(id,GMUI_GetCurrentLayer());
                
                // Check for scrollbar actions
                var _MC, _MPos; _MC = GMUI_GroupMouseOnScrollbar(id, MX);
                if (_MC > -1) {
                    _MC.Scrollbar_dragging = true;
                    _MPos = MY - GMUI_groupActualY[_MC.Layer,_MC.Group];
                    if (_MPos > _MC.Scrollbar_y && _MPos < _MC.Scrollbar_y + _MC.Scrollbar_height)
                        _MC.Scrollbar_drag_y = _MPos - _MC.Scrollbar_y;
                    else
                        _MC.Scrollbar_drag_y = _MC.Scrollbar_height/2;
                }
            }
        }
    }
    
    // Any key event will trigger a set value on a selected control in GMUI_ControlDraw; navigate to next...
    if (SelectedControl != -1) {
        if (GMUI_NavigateNextControl(true)) {
            GMUI_GridNextControl(true);
            GMUI_GridUpdateLayer(id,GMUI_GetCurrentLayer());
        }
        else if (GMUI_NavigateNextControl(false)) {
            GMUI_GridNextControl(false);
            GMUI_GridUpdateLayer(id,GMUI_GetCurrentLayer());
        }
        else if (keyboard_check_pressed(vk_enter)) {
            GMUI_ResetControlStatus("Selected",id);
            GMUI_GridUpdateLayer(id,GMUI_GetCurrentLayer());
        }
    }
    
    // The grid offset has changed, all controls must update their position if not drawn on surfaces
    if (UIsnaptoview && !UIEnableSurfaces) {
        if (previousXOffset != view_xview[UIgridview] || previousYOffset != view_yview[UIgridview]) {
            GMUI_ResetControlStatus("Position",id);
            previousXOffset = view_xview[UIgridview];
            previousYOffset = view_yview[UIgridview];
        }
    }
    
    
    // Draw surface layers, and/or adjust a transitioning layer
    if (GMUI_grid_Transition || UIEnableSurfaces) {
        // Loop through each layer
        var _i, _l, _j, _g, _c;
        for(_i=0;_i<ds_list_size(GMUI_gridlist);_i+=1) {
            // Check for transition
            _l = ds_list_find_value(GMUI_gridlist,_i);
            
            if (GMUI_StudioCheckDefined(_l)) {
                if (GMUI_grid_Transitioning[_l]) {
                    GMUI_grid_Transition = true;
                    
                    if (GMUI_grid_T_t[_l] < GMUI_grid_T_d[_l]) {
                        GMUI_grid_T_t[_l] += 1;
                        GMUI_grid_x[_l] = script_execute(GMUI_grid_T_script[_l],GMUI_grid_T_t[_l],GMUI_grid_T_bx[_l],GMUI_grid_T_cx[_l],GMUI_grid_T_d[_l]);
                        GMUI_grid_y[_l] = script_execute(GMUI_grid_T_script[_l],GMUI_grid_T_t[_l],GMUI_grid_T_by[_l],GMUI_grid_T_cy[_l],GMUI_grid_T_d[_l]);
                    }
                    else {
                        GMUI_grid_T_t[_l] = GMUI_grid_T_d[_l];
                        GMUI_grid_Transitioning[_l] = false;
                        GMUI_grid_Transition = false;
                    }
                }
                
                // Draw layer surface
                if (UIEnableSurfaces) {
                    if (surface_exists(GMUI_gridSurface[_l])) {
                        // Adjust surface position to view if enabled
                        draw_surface(GMUI_gridSurface[_l],
                            GMUI_grid_x[_l]+view_xview[UIgridview]*UIsnaptoview,
                            GMUI_grid_y[_l]+view_yview[UIgridview]*UIsnaptoview);
                        // Reset update flag
                        if (GMUI_gridNeedsDrawUpdate[_l] == 1)
                            GMUI_gridNeedsDrawUpdate[_l] = 2;
                    }
                }
            }
        }
        
        // Need to redraw each step if not using surfaces
        if (!UIEnableSurfaces) { // This was used for layer surfaces... but couldn't get it to work
            GMUI_ResetControlStatus("Position",id);
        }
    }
    
    
    
    // Check if the room size has changed to move any anchored controls positions?
    

}


