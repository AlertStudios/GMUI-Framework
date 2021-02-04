///GMUI_ControlDrawEvent(Draw the control [bool])
/// The actions done per step for a control added to the grid, along with drawing things
function GMUI_ControlDrawEvent(argument0) {

// STEP actions:

// Run transition action
if (Transitioning) {
    if (GMUI_IsScript(TransitionScript)) {
        if (Hovering)
            Hovering = false;
        if (TooltipId != -1)
            GMUI_ControlHide(TooltipId,1);
            
        if (T_t < T_d && GMUIP.UIDrawAnimations) {
            T_t += 1;
            ActualX = script_execute(TransitionScript,T_t,T_bx,T_cx,T_d);
            ActualY = script_execute(TransitionScript,T_t,T_by,T_cy,T_d);
            
            if (TransitioningGroup && (GMUIP).GMUI_groupMasterControl[Layer,Group] == id) {
                GMUIP.GMUI_groupActualX[Layer,Group] = script_execute(TransitionScript,T_t,T_bx_group,T_cx_group,T_d);
                GMUIP.GMUI_groupActualY[Layer,Group] = script_execute(TransitionScript,T_t,T_by_group,T_cy_group,T_d);
            }
            
            // Only one control needs to refresh the surface when transitioning, if it can
            if (GMUIP.UIEnableSurfaces) {
            GMUI_GridUpdateLayer(GMUIP,Layer);
                if (GMUIP.GMUI_gridMasterControl[Layer] == id && ((!Hidden && !GroupHidden) || (GroupHidden && FadeCalled != 0))) {
                    //GMUIP.GMUI_gridMasterControl[Layer] = id;
                    GMUIP.GMUI_gridNeedsDrawUpdate[Layer] = 2;
                }
                
            }
        }
        else {
            T_t = T_d;
            Transitioning = false;
            if (GMUIP.UIEnableSurfaces) {
                //GMUIP.GMUI_gridMasterControl[Layer] = -1;
                if (GMUIP.GMUI_gridMasterControl[Layer] == id)
                GMUIP.GMUI_gridNeedsDrawUpdate[Layer] = 2;
            }
            
            if (TransitioningGroup) {
                if (GMUIP.GMUI_groupMasterControl[Layer,Group] == id) {
                    var _getGroupX,_getGroupY,_diffX,_diffY, _origRelCellX, _origRelCellY;
                    _diffX = GMUIP.GMUI_groupActualX[Layer,Group]-GMUI_CellGetActualX(GMUI_GridGetCellXRoom(GMUIP,Layer,T_dx_group));
                    _diffY = GMUIP.GMUI_groupActualY[Layer,Group]-GMUI_CellGetActualY(GMUI_GridGetCellYRoom(GMUIP,Layer,T_dy_group));
                    
                    // This part uses a left anchor temporarily
                    _getGroupX = GMUI_GetAnchoredCellX(GMUI_GridGetWidth(GMUIP,Layer),GMUI_GridGetCellXRoom(GMUIP,Layer,(GMUIP).GMUI_groupActualX[Layer,Group]),global.GMUIAnchorDefault);
                    _getGroupY = GMUI_GetAnchoredCellY(GMUI_GridGetHeight(GMUIP,Layer),GMUI_GridGetCellYRoom(GMUIP,Layer,(GMUIP).GMUI_groupActualY[Layer,Group]),global.GMUIAnchorDefault);
                    
                    _origRelCellX = GMUIP.GMUI_groupRelativeCellX[Layer,Group];
                    _origRelCellY = GMUIP.GMUI_groupRelativeCellY[Layer,Group];
                    
                    GMUI_GroupSetPositionAnchored(Layer,Group,_getGroupX,_getGroupY,
                        _diffX,_diffY,
                        global.GMUIAnchorDefault);
                    
                    // Reassigning original relative-to-anchor coordinates
                    GMUIP.GMUI_groupRelativeCellX[Layer,Group] = _origRelCellX;
                    GMUIP.GMUI_groupRelativeCellY[Layer,Group] = _origRelCellY;
                        
                    TransitioningGroup = false;
                }
            }
            else {
                var _getCellX,_getCellY;
                _getCellX = GMUI_GridGetCellXOffset(GMUIP,Layer,ActualX,0);
                _getCellY = GMUI_GridGetCellYOffset(GMUIP,Layer,ActualY,0);
                
                if (Group > 0) {
                    CellX = GMUI_GetAnchoredCellX(GMUI_GridGetWidth(GMUIP,Layer),_getCellX - GMUIP.GMUI_groupCellX[Layer,Group],Anchor);
                    CellY = GMUI_GetAnchoredCellY(GMUI_GridGetHeight(GMUIP,Layer),_getCellY - GMUIP.GMUI_groupCellY[Layer,Group],Anchor);
                }
                else {
                    CellX = GMUI_GetAnchoredCellX(GMUI_GridGetWidth(GMUIP,Layer),_getCellX,Anchor);
                    CellY = GMUI_GetAnchoredCellY(GMUI_GridGetHeight(GMUIP,Layer),_getCellY,Anchor);
                }
                RelativeX = ActualX - GMUI_CellGetActualX(_getCellX);
                RelativeY = ActualY - GMUI_CellGetActualY(_getCellY);
                
                GMUI_ControlPosition(id,CellX,CellY,RelativeX,RelativeY,Anchor);
            }            
        }
       
        // Update control draw location in the room
        NeedsPositionUpdate = true;
    }
    else {
        Transitioning = false;
    }
}

// Run fade in/out action
if (FadeCalled != 0) {
    // Fade in, else, fade out
    if (FadeCalled > 0) {
        if (FadeAlpha < FadeIn && GMUIP.UIDrawAnimations) {
            FadeAlpha += 1/FadeTime;
        }
        else {
            FadeAlpha = FadeIn;
            FadeCalled = 0;
        }
    }
    else {
        if (FadeAlpha > FadeOut && GMUIP.UIDrawAnimations) {
            FadeAlpha -= 1/FadeTime;
        }
        else {
            FadeAlpha = FadeOut;
            FadeCalled = 0;
        }
    }
    
    if (GMUIP.UIEnableSurfaces) {
        GMUI_GridUpdateLayer(GMUIP,Layer);
        if (GMUIP.GMUI_gridMasterControl[Layer] == id)
            GMUIP.GMUI_gridNeedsDrawUpdate[Layer] = 2;
        
        if (GMUIP.GMUI_gridMasterControl[Layer] != -1) {
            //GMUIP.GMUI_groupNeedsDrawUpdate[Layer,Group] = 2;
            NeedsDrawUpdate = 1;
            if (FadeCalled == 0) {
                //GMUIP.GMUI_gridFader[Layer] = -1;//GroupIsFading = false;
                if (!Transitioning) {
                    //(GMUIP).GMUI_gridMasterControl[Layer] = -1;
                }
            }
        }
    }
}

// Handle scrollbar actions, if there is one
if (Group > 0) {
    if (GMUIP.GMUI_groupMasterControl[Layer,Group] == id) {
        if (GroupHasScrollbar) {
            if (Scrollbar_dragging) {
                if (mouse_check_button(mb_left)) {
                    // Recalculate drag position (from GMUI_GridGetCellYOffset)
                    // may need to apply offset here
                    Scrollbar_y = GMUIminmax(Scrollbar_padding,Scrollbar_maxtop,//todo: test for group and non-group control
                        mouse_y - GMUIP.GMUI_grid_y[Layer] - GMUI_groupActualY[Layer,Group] - Scrollbar_drag_y);
                }
                else {
                    Scrollbar_dragging = false;
                }
            }
            else if (Scrollbar_hover) {
                if (mouse_x != GMUIP.mouse_px || mouse_y != GMUIP.mouse_py) {
                    // Check to un-hover
                    if (GMUI_GroupMouseOnScrollbar(GMUIP, mouse_x) != id) {
                        Scrollbar_hover = false;
                    }
                }
            }
        }
    }
}

// Set new position if the view offset has changed, or transitioning
if (NeedsPositionUpdate) {
    GMUI_ControlUpdateXY(id);
    NeedsPositionUpdate = false;
    if (Group <= 0)
        GMUIP.NeedsRegionsUpdate = true;
    //NeedsDrawUpdate = true;
}

var skipgroup; skipgroup = false;

// PROCESS INPUT //
// Don't process any input or drawing if hidden
if (!Hidden) {
    // Easing update if slider control
    if (ControlType == "slider") {
        if (HoldingTime == 1) {
            GMUI_ControlSliderMove(true);
            GMUI_GridUpdateLayer(GMUIP,Layer);
            
            GMUIP.GMUI_gridNeedsDrawUpdate[Layer] = 1;
        }
        else if (Slider_t < Slider_d && sliderComputed) {
            GMUI_ControlSliderMove(false);
            GMUI_GridUpdateLayer(GMUIP,Layer);
            if (!SliderSmoothSnap)
                Slider_t = Slider_d;
        }
    }
    else if (ControlType == "toggle" || ControlType == "checkbox") {
        // Fade or Slide update if checkbox/toggle control
        if (Toggle_t < Toggle_d) {
            if (GMUIP.UIDrawAnimations)
                Toggle_t += 1;
            else
                Toggle_t = Toggle_d;
            GMUI_GridUpdateLayer(GMUIP,Layer);
            NeedsDrawUpdate = 1;
            if (string(value) == "0")
                ToggleRelativeXorY = ToggleDistance - (Toggle_c * Toggle_t);
            else if (string(value) == "1")
                ToggleRelativeXorY = Toggle_c * Toggle_t;
        }
    }
    if (Selected) {
        // Holding click event
        if (mouse_check_button(mb_left)) {
            HoldingTime += 1;            
            if (!Holding && HoldingTime > HoldingThreshold)
                Holding = true;
        }
        if (Holding) {
            if (mouse_check_button_released(mb_left)) {
                Holding = false;
                HoldingTime = 0;
            }
            else if (ControlType == "slider") {
                // Special case for slider: Holding will move the thumb
                GMUI_ControlSliderMove(true);
            }
        }
        
    
        // Filter keyboard string to type of input allowed
        if (ControlInput && (keyboard_lastkey > 20 || keyboard_lastkey == vk_backspace)) {
            if (keyboard_check(vk_anykey)) {
                //If 'Overwriting', then reset back to just selected
                if (DoubleSelected) {
                    if (string_length(keyboard_string) > 0 && string_length(GMUI_ControlFilterInput(ControlType,keyboard_lastchar)) > 0)
                        keyboard_string = string_copy(keyboard_string,string_length(keyboard_string),1);
                    else
                        keyboard_string = "";
                        
                    DoubleSelected = false;
                }
                else {
                    // On keypress, sanitize input per the type
                    keyboard_string = GMUI_ControlFilterInput(ControlType,keyboard_string);
                    
                    // Max characters allowed for the control's string
                    if (ControlMaxStringLength > 0)
                        keyboard_string = string_copy(keyboard_string,1,ControlMaxStringLength);
                }
                
                GMUI_GridUpdateLayer(GMUIP,Layer);
                //if (Group < 1)
                //skipgroup = true;
                //if (Group > 0) {
                //    if (GMUIP.GMUI_groupMasterControl[Layer,Group] == id)
                //        GMUIP.GMUI_gridNeedsDrawUpdate[Layer] = 2;
                //}
            }
            
            // Only does assignment of the value once the key is released (and not transitioning)
            if (Transitioning) {
                keyboard_string = valueString;
            }
            else if (keyboard_check_released(vk_anykey)) {
                // On release, we need to filter again incase somebody "fat-fingers" multiple keys fast enough to miss the first filter.. interesting.
                keyboard_string = GMUI_ControlFilterInput(ControlType,keyboard_string);
                
                // Assign keyboard string as the value string
                valueString = keyboard_string;
                
                if (ControlIsNumeric) {
                    // As long as the string is valid, assign stripped zeros to value string, and then assign value
                    if (valueString != "." && valueString != "-") {
                        valueString = keyboard_string;
                        value = real(valueString);
                        if (ControlDataType == global.GMUIDataTypeInteger) {
                            value = round(value);
                        }
                        
                        // Found the change!
                        valueChangeDetected = 1;
                    }
                }
                else if (ControlIsString) {
                    value = valueString;
                }
            }
        }
    }
}

// Check release of control scrollbar, if this has one
if (ControlHasScrollbar) {
    if (Scrollbar_dragging) {
        if (mouse_check_button_released(mb_left)) {
            Scrollbar_dragging = false;
            Scrollbar_hover = false;
        }
        else {
            GMUI_ControlScrollbarSelect(id,mouse_x,mouse_y);
        }
        NeedsDrawUpdate = 1;
    }
}

if (valueChangeDetected) {
    // This may need some checks on if it should be allowed to set value... we'll see
                
    GMUI_SetValue(valueName,value,ControlDataType);
    
    //Reset
    valueChangeDetected = 0;
}



// DRAW //
// Draw if set, and if using surfaces draw if an update is needed
if (argument0 == true) {
    // Don't process any drawing if hidden or update not needed
    //if ((Hidden || GroupHidden) && FadeCalled == 0 && !NeedsDrawUpdate and !TransitioningGroup) {
    //    return false;
    //}
    
    var SurfaceSet, CurrentSurface, CurrentSurfaceW, CurrentSurfaceH;
    SurfaceSet = false; CurrentSurface = -1; CurrentSurfaceW = 0; CurrentSurfaceH = 0;
        
    // If using surfaces for layers and groups
    if (GMUIP.UIEnableSurfaces) {
        // If we need to update something, we need to check the drawing order
        if (GMUIP.GMUI_gridDrawFirst[Layer] == noone) {
            GMUIP.GMUI_gridMasterControl[Layer] = id;
            GMUIP.GMUI_gridDrawFirst[Layer] = id;
        }
        if (Group > 0) {
            if (GMUIP.GMUI_groupDrawingFirst[Layer,Group] != noone) {
                if (GMUIP.GMUI_groupDrawingFirst[Layer,Group] == -1) {
                    GMUIP.GMUI_groupDrawingFirst[Layer,Group] = id;
                    GMUIP.GMUI_groupDrawingLast[Layer,Group] = id;
                }
                else if (GMUIP.GMUI_groupDrawingFirst[Layer,Group] == id) {
                    GMUIP.GMUI_groupMasterControl[Layer,Group] = id;
                    GMUIP.GMUI_groupDrawingControl[Layer,Group] = GMUIP.GMUI_groupDrawingLast[Layer,Group];
                    GMUIP.GMUI_groupDrawingFirst[Layer,Group] = noone;
                }
                else {
                    GMUIP.GMUI_groupDrawingLast[Layer,Group] = id;
                }
            }
        }
		
		if (GMUIP.ControlLayerRedraw == id) {
            GMUI_GridUpdateLayer(GMUIP,Layer);
            GMUIP.ControlLayerRedraw = -1;
        }
        
        // Create surfaces for controls that use them first, and later draw to grid
        if (NeedsDrawUpdate > 0 || NeedsGroupUpdate > 0) {
            if (ControlType == "selectlist") {
                // Only create the surface of the list and return
                SelectListSurface = GMUI_ControlDrawItemList(id, true);
                if (Group > 0) {
                    if (surface_exists(GMUIP.GMUI_groupSurface[Layer,Group]))
                        GMUIsurface_target(GMUIP.GMUI_groupSurface[Layer,Group],-1,-1);
                }
            }
        }
        
        // Check for grid update
        if (GMUIP.GMUI_gridNeedsDrawUpdate[Layer] == 2 || GMUIP.GMUI_gridMasterControl[Layer] == id || NeedsDrawUpdate > 0 || NeedsGroupUpdate > 0) {
            CurrentSurfaceW = GMUIP.UIgridwidth;
            CurrentSurfaceH = GMUIP.UIgridheight;
            GMUIsurface_reset();
            CurrentSurface = GMUIsurface_target(GMUIP.GMUI_gridSurface[Layer], CurrentSurfaceW, CurrentSurfaceH);
            GMUIP.GMUI_gridSurface[Layer] = CurrentSurface;
            SurfaceSet = true;
            
            if (GMUIP.GMUI_gridNeedsDrawUpdate[Layer] == 2 && (GMUIP).GMUI_gridMasterControl[Layer] == id) {
                GMUIsurface_clear(GMUIP.GMUI_gridSurface[Layer]);
                GMUIP.GMUI_gridNeedsDrawUpdate[Layer] = 0;
            }
        }
        if (NeedsDrawUpdate > 0 || NeedsGroupUpdate > 0) {
            // Update group if in one and visible or fading in/out
            if (Group > 0) {// && (!GroupHidden || FadeCalled != 0)) {
                if (GMUIP.GMUI_groupMasterControl[Layer,Group] == id) {
                    if (SurfaceSet)
                        GMUIsurface_reset();
                    CurrentSurfaceW = (GMUIP).GMUI_groupCellsW[Layer,Group] * (GMUIP).cellsize + 1; //(GMUIP).GMUI_groupActualX[Layer,Group]
                    CurrentSurfaceH = (GMUIP).GMUI_groupCellsH[Layer,Group] * (GMUIP).cellsize_h + 1;
                    CurrentSurface = GMUIsurface_target(GMUIP.GMUI_groupSurface[Layer,Group], CurrentSurfaceW, CurrentSurfaceH);
                    GMUIP.GMUI_groupSurface[Layer,Group] = CurrentSurface;
                    
                    //(GMUIP).GMUI_gridMasterControl[Layer] == id
                    if (NeedsGroupUpdate > 0 && GMUIP.GMUI_groupMasterControl[Layer,Group] == id) {
                        GMUIsurface_clear(GMUIP.GMUI_groupSurface[Layer,Group]);
                        //if (!skipgroup) {
                        if (!GroupHidden || FadeCalled != 0){
                            draw_set_blend_mode_ext(bm_one,bm_inv_src_alpha); // Tricky...
                            GMUI_ControlDrawGroup(GMUIP,Layer,Group,FadeAlpha,FadeMode);
                            draw_set_blend_mode(bm_normal);
                        }//}
                    }
                    
                    
                }
                else if (surface_exists(GMUIP.GMUI_groupSurface[Layer,Group])) {
                    if (SurfaceSet)
                        GMUIsurface_reset();
                    GMUIsurface_target(GMUIP.GMUI_groupSurface[Layer,Group],-1,-1);
                }
            }
            else if (Group > 0) {
                NeedsDrawUpdate = 0;
            }
        }
    
    }
    else if (Group > 0 && GMUIP.GMUI_groupMasterControl[Layer,Group] == id && (!GroupHidden || FadeCalled != 0)) {
        // Draw non-surface group
        GMUI_ControlDrawGroup(GMUIP,Layer,Group,FadeAlpha,FadeMode);
    }
    
    // If hidden and not fading out, no draw is needed...
    if ((Hidden || GroupHidden) && FadeCalled == 0) {
        NeedsDrawUpdate = 0;
    }
    else if (!GMUIP.UIEnableSurfaces) {
        NeedsDrawUpdate = 1;
    }
        
        
    // Draw the control based on the type and user-defined settings
    if (NeedsDrawUpdate > 0) {
        var padx;
        padx = ControlPaddingX;
        _BackgroundAlpha = min(ControlBackgroundAlpha,FadeAlpha);
        _HoverAlpha = min(ControlHoverAlpha,FadeAlpha);
        _SelectAlpha = min(ControlSelectAlpha,FadeAlpha);
        _OverwriteAlpha = min(ControlOverwriteAlpha,FadeAlpha);
        _FontAlpha = min(ControlFontAlpha,FadeAlpha);
        _SpriteAlpha = min(ControlGraphicAlpha,FadeAlpha);
            
        // Start drawing the control (inputs and buttons)
        if (ControlInput || ControlPicker || ControlDataType == global.GMUIDataTypeButton 
            || ControlType == "image" || ControlType == "label" || ControlType == "dropdown") {
            if (ControlGraphicMapIsUsed) {
                GMUI_DrawSpriteBox(GMUIP,Layer,Group,0,1);
            }
            else if (sprite_exists(ControlGraphic)) {
                // Sprite has been substituted for the default drawing
                var subi; subi = ControlGraphicIndex;
                if (Hovering) subi = ControlGraphicHoveringIndex;
                if (Selected) subi = ControlGraphicSelectedIndex;
                
                draw_sprite_ext(ControlGraphic,subi,RoomX,RoomY,ControlGraphicXScale,ControlGraphicYScale,ControlGraphicRotation,ControlGraphicColor,_SpriteAlpha);
            }
            else if (ControlType != "image") {
                // Background
                if (ControlBackgroundColor > -1) {
                    GMUIcolor_alpha(ControlBackgroundColor,_BackgroundAlpha);
                    draw_rectangle(RoomX, RoomY, RoomW, RoomH, 0);
                }
                
                // Border
                if (ControlBorderColor > -1) {
                    GMUIcolor_alpha(ControlBorderColor,_BackgroundAlpha);
                    draw_rectangle(RoomX, RoomY, RoomW, RoomH, 1);
                }
            
        
                if (Hovering || Selected) {
                    // Draw the hovering effect
                    if (!Selected && ControlHoverColor > -1)
                        GMUIcolor_alpha(ControlHoverColor,_HoverAlpha);
                    else if (ControlSelectColor > -1)
                        GMUIcolor_alpha(ControlSelectColor,_SelectAlpha);
                        
                    if ((!Selected && ControlHoverColor > -1) || (Selected && ControlSelectColor > -1))
                    draw_rectangle(RoomX+1,RoomY+1,RoomW-1,RoomH-1, ControlHoverBorder);
                }
                
                if (DoubleSelected && ControlInput && ControlOverwriteColor > -1) {
                    // Draw 'Overwrite' affect
                    GMUIcolor_alpha(ControlOverwriteColor,_OverwriteAlpha);
                    draw_rectangle(RoomX+2,RoomY+2,RoomW-2,RoomH-2,0);
                }
                
                if (ControlType == "dropdown") {
                    var _dax1,_dhh,_day2;
                    _dax1 = RoomW-ControlPickerWidth/2;
                    _dhh = (RoomH-RoomY)/2;
                    _day2 = RoomH-ControlPickerHeight/3;
                    GMUIcolor_alpha(ControlBorderColor, 1);
                    draw_triangle(_dax1,_day2-ControlPickerHeight/3,
                        _dax1-ControlPickerWidth/4,_day2-_dhh,_dax1+ControlPickerWidth/4,_day2-_dhh,0);
                }
            }
        }
        else if (ControlType == "tooltip") {
            GMUI_ControlDrawTooltipById(id);
        }
        else if (ControlType == "slider") {
            GMUI_ControlDrawSlider(id);
        }
        else if (ControlType == "checkbox" || ControlType == "toggle") {
            GMUI_ControlDrawToggle(id);
        }
        else if (ControlType == "selectlist") {
            if (GMUIP.UIEnableSurfaces) {
                if (surface_exists(SelectListSurface)) {
                    draw_surface_part(SelectListSurface,0,ItemListOffsetY,RoomW-RoomX,RoomH-RoomY,RoomX,RoomY);
                }
            }
            else
                GMUI_ControlDrawItemList(id, false);
        }
        
        
        // Draw special features for the other types
        // Picker types (integer, double, etc)
        if (ControlPicker) {
            // draw arrows (origin should be on the right/left and to the corner it is placed at)
            var _ax1,_ax2,_ay1,_ay2,_hh,_ax3;
            _ay1 = RoomY+2;
            if (ControlPickerDirection == global.GMUIDirectionTypeVertical) {
                _ax3 = RoomX+1;
                _ax1 = RoomX + (RoomW-RoomX)/2;
                _hh = ControlPickerHeight;
            }
            else {
                _ax1 = RoomW-ControlPickerWidth/2;
                _ax3 = RoomW-2-ControlPickerWidth+1;
                _hh = (RoomH-RoomY)/2;
            }
            if (ControlPickerDirection == global.GMUIDirectionTypeHorizontal) {
                _ax1 = RoomW-2;
                _ax2 = RoomX+2;
                _ay1 = RoomY+_hh;
                _ay2 = _ay1;
            }
            else { // GMUIDirectionTypeSideVertical or GMUIDirectionTypeVertical
                _ax2 = _ax1;
                _ay2 = RoomH-2;
            }
            
            // Top arrow and bottom arrow
            if (ControlPickerSpriteRightOrUp > -1)
                draw_sprite_ext(ControlPickerSpriteRightOrUp,0,_ax1,_ay1,1,1,0,c_white,_BackgroundAlpha);
            else {
                GMUIcolor_alpha(ControlBorderColor, 1);
                if (ControlPickerDirection == global.GMUIDirectionTypeHorizontal)
                    draw_triangle(_ax1-ControlPickerWidth/4,_ay1,
                        _ax1-ControlPickerWidth/2,_ay1-_hh/2,_ax1-ControlPickerWidth/2,_ay1+_hh/2,0);
                else
                    draw_triangle(_ax1,_ay1+ControlPickerHeight/6,
                        _ax1-ControlPickerWidth/4,_ay1+_hh/2,_ax1+ControlPickerWidth/4,_ay1+_hh/2,0);
            }
            if (ControlPickerSpriteLeftOrDown > -1)
                draw_sprite_ext(ControlPickerSpriteLeftOrDown,0,_ax2,_ay2,1,1,0,c_white,_BackgroundAlpha);
            else {
                GMUIcolor_alpha(ControlBorderColor, 1);
                if (ControlPickerDirection == global.GMUIDirectionTypeHorizontal)
                    draw_triangle(_ax2+ControlPickerWidth/4,_ay1,
                        _ax2+ControlPickerWidth/2,_ay1-_hh/2,_ax2+ControlPickerWidth/2,_ay1+_hh/2,0);
                else
                    draw_triangle(_ax1,_ay2-ControlPickerHeight/6,
                        _ax1-ControlPickerWidth/4,_ay2-_hh/2,_ax1+ControlPickerWidth/4,_ay2-_hh/2,0);
            }
            
            // Top arrow and bottom arrow selection regions
            GMUIcolor_alpha(ControlHoverColor,_HoverAlpha);
            if (ControlPickerDirection == global.GMUIDirectionTypeHorizontal) {
                if (HoveringDirection == global.GMUIHoveringDirection_Right)
                    draw_rectangle(_ax3,RoomY+1,RoomW-1,RoomH,0);
                else if (HoveringDirection == global.GMUIHoveringDirection_Left)
                    draw_rectangle(_ax2-1, RoomY+1, _ax2+ControlPickerWidth,RoomH,0);
            }
            else { //GMUIDirectionTypeSideVertical or GMUIDirectionTypeVertical
                if (HoveringDirection == global.GMUIHoveringDirection_Up)
                    draw_rectangle(_ax3,RoomY+1,RoomW-1,RoomY+_hh,0);
                else if (HoveringDirection == global.GMUIHoveringDirection_Down)
                    draw_rectangle(_ax3,RoomH-_hh,RoomW-1,RoomH,0);
            }
            
        }
        
        
        // Draw the text inside of the keyboard string or value
        var Text, dtx, midHeight;
        if (ControlInput) {
            if (Selected)
                Text = keyboard_string;
            else
                Text = valueString;
        }
        else if (ControlDataType == global.GMUIDataTypeButton) {
            Text = ControlButtonText;
        }
        else if (ControlDataType == global.GMUIDataTypeString || ControlType == "dropdown") {
            Text = valueString;
        }
        else
            Text = "";
        
        // Default is for fa_left:
        dtx = RoomX + padx;    
        if (ControlFontAlign == fa_center)
            dtx = RoomX+(RoomW-RoomX)/2;
        else if (ControlFontAlign == fa_right)
            dtx = RoomW - padx;
        else if (ControlFontAlign != fa_left) {
            ControlFontAlign = (GMUIP).ControlFontAlign;
            GMUI_ThrowErrorDetailed("Invalid font align",GMUI_ControlDrawEvent);
        }
        
        if (ActualH > 0)
            midHeight = ActualH / 2;
        else
            midHeight = CellHigh * (GMUIP).cellsize_h / 2;
            
        // Set control font and alignment
        if (ControlFont != noone)
            draw_set_font(ControlFont);
        GMUIalign(ControlFontAlign,ControlFontAlignV);
        
        // Specific controls may override display
        if (ControlDataType == global.GMUIDataTypeButton && ControlButtonTextHoveringOn && Hovering)
            GMUIcolor_alpha(ControlButtonTextHoverColor,_FontAlpha);
        else
            GMUIcolor_alpha(ControlFontColor,_FontAlpha);
            
        // TEMPORARY SOLUTION FOR DISABLED CONTROLS! :
        if (Disabled)
            draw_set_alpha(_FontAlpha / 2);
            
        // Button with graphic inside
        if (ControlDataType == global.GMUIDataTypeButton) {
            if (sprite_exists(ControlButtonGraphic)) {
                draw_sprite_ext(ControlButtonGraphic,0,dtx, RoomY + midHeight,1,1,0,c_white,_SpriteAlpha);
                dtx += sprite_get_width(ControlButtonGraphic) + padx;
            }
        }
        
        // Draw value string or button text
        if (Text != "") {
            if (ControlShowValue) {
                if (ControlInteraction && ControlInput && ControlShowCursor && Selected && !DoubleSelected)
                    Text = Text + "|";
                    
                if (ControlType != "label")
                    draw_text(dtx, RoomY + midHeight, Text);
                else
                    draw_text_ext(dtx, RoomY + midHeight, Text, -1, RoomW-RoomX-padx*2);
            }
        }
        else if (ControlType == "spritepicker" && optionsInitialized) {
            // Special case for sprite picker
            var _spr; _spr = ds_map_find_value(OptionsMap,value);
            draw_sprite(_spr,0,
                dtx-(sprite_get_width(_spr)/2)+sprite_get_xoffset(_spr),
                RoomY+midHeight-(sprite_get_height(_spr)/2)+sprite_get_yoffset(_spr));
        }
        
        
        // Draw scrollbar for control or for group if it has one
        if (ControlHasScrollbar || GroupHasScrollbar) {
            var cy1,cy2,cy3,cx1,_sbw,_sbc;
            
            if (!GMUIP.UIEnableSurfaces) {
                _sbc = id;
            }
            else if (GroupHasScrollbar && GMUIP.GMUI_groupDrawingControl[Layer,Group] == id) {
                _sbc = GroupScrollbarHandler;
            }
            else {
                _sbc = id;
            }
                //cy1 = GMUIP.GMUI_groupActualY[Layer,Group]+GMUI_GridViewOffsetY(GMUIP)+GMUIP.GMUI_grid_y[Layer]*!GMUIP.UIEnableSurfaces;
                //cy2 = cy1 + GMUIP.GMUI_groupCellsH[Layer,Group]*GMUIP.cellsize_h;
                //_sbw = GMUIP.GMUI_groupScrollWidth[Layer,Group];
            //}
            //else {
                cy1 = _sbc.Scrollbar_y+GMUIP.GMUI_grid_y[Layer]*!GMUIP.UIEnableSurfaces;
                if (!GMUIP.UIEnableSurfaces)
                    cy1 += GMUI_GridViewOffsetY(GMUIP);
                cy2 = cy1 + CellHigh*GMUIP.cellsize_h;
                _sbw = _sbc.Scrollbar_width;
            //}
            cy3 = _sbc.Scrollbar_pos_y+GMUIP.GMUI_grid_y[Layer]*!GMUIP.UIEnableSurfaces;
            cx1 = _sbc.Scrollbar_x+GMUIP.GMUI_grid_x[Layer]*!GMUIP.UIEnableSurfaces;
            if (!GMUIP.UIEnableSurfaces) {
                cy3 += GMUI_GridViewOffsetY(GMUIP);
                cx1 += GMUI_GridViewOffsetX(GMUIP);
            }
            
            // draw scrollbar area
            if (Scrollbar_hover) {
                draw_set_color(_sbc.Scrollbar_bgcolor_hover);
                draw_set_alpha(min(FadeAlpha,_sbc.Scrollbar_bgalpha_hover));
            }
            else {
                draw_set_color(Scrollbar_bgcolor);
                draw_set_alpha(min(FadeAlpha,_sbc.Scrollbar_bgalpha));
            }
            
            draw_rectangle(cx1,cy1,cx1+_sbw,cy2,0);
            
            // draw scrollbar select area
            if (Scrollbar_hover) {
                draw_set_color(_sbc.Scrollbar_color_hover);
                draw_set_alpha(min(FadeAlpha,_sbc.Scrollbar_alpha_hover));
            }
            else {
                draw_set_color(_sbc.Scrollbar_color);
                draw_set_alpha(min(FadeAlpha,_sbc.Scrollbar_alpha));
            }
            
            draw_rectangle(cx1 + 1,cy3 + 1,cx1+_sbw - 1,cy3+_sbc.Scrollbar_height - 1, 0);
        }
    }
    
    // Reset the surface if using one, draw the group if needed
    if (GMUIP.UIEnableSurfaces) {
        GMUIsurface_reset();
        if (Group > 0 && GMUIP.GMUI_groupDrawingControl[Layer,Group] == id && (NeedsDrawUpdate > 0 || NeedsGroupUpdate > 0)) {
            if (surface_exists(GMUIP.GMUI_groupSurface[Layer,Group])) {
                GMUIP.GMUI_gridSurface[Layer] = GMUIsurface_target(GMUIP.GMUI_gridSurface[Layer], GMUIP.UIgridwidth, GMUIP.UIgridheight);
                draw_surface(GMUIP.GMUI_groupSurface[Layer,Group],
                    //0,global.showsurface,surface_get_width(GMUIP.GMUI_groupSurface[Layer,Group]),surface_get_height(GMUIP.GMUI_groupSurface[Layer,Group])-50+global.showsurface,
                    GMUIP.GMUI_groupActualX[Layer,Group],GMUIP.GMUI_groupActualY[Layer,Group]);
                GMUIsurface_reset();
            }
        }
        
        if (GMUIP.GMUI_gridNeedsDrawUpdate[Layer] != 1) {
            NeedsDrawUpdate -= (NeedsDrawUpdate > 0)*1;
            NeedsGroupUpdate -= (NeedsGroupUpdate > 0)*1;
        }
    }
}
}

