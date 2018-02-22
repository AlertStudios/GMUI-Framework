///GMUI_ControlDraw(Draw the control [bool])
/// The actions done per step for a control added to the grid, along with drawing things

// STEP actions:

// Run transition action
if (Transitioning) {
    if (GMUI_IsScript(TransitionScript)) {
        if (Hovering)
            Hovering = false;
        if (TooltipId != -1)
            GMUI_ControlHide(TooltipId,1);
            
        if (T_t < T_d) {
            T_t += 1;
            ActualX = script_execute(TransitionScript,T_t,T_bx,T_cx,T_d);
            ActualY = script_execute(TransitionScript,T_t,T_by,T_cy,T_d);
            
            if (TransitioningGroup && (GMUIP).GMUI_groupMasterControl[Layer,Group] == id) {
                GMUIP.GMUI_groupActualX[Layer,Group] = script_execute(TransitionScript,T_t,T_bx_group,T_cx_group,T_d);
                GMUIP.GMUI_groupActualY[Layer,Group] = script_execute(TransitionScript,T_t,T_by_group,T_cy_group,T_d);
            }
            
            // Only one control needs to refresh the surface when transitioning, if it can
            if (GMUIP.UIEnableSurfaces) {
                if (GMUIP.GMUI_gridTransitioner[Layer] == -1 && ((!Hidden && !GroupHidden) || (GroupHidden && FadeCalled != 0))) {
                    GMUIP.GMUI_gridTransitioner[Layer] = id;
                }
                GMUI_GridUpdateLayer(GMUIP,Layer);
            }
        }
        else {
            T_t = T_d;
            Transitioning = false;
            if (GMUIP.UIEnableSurfaces) {
                GMUIP.GMUI_gridTransitioner[Layer] = -1;
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
                CellX = GMUI_GridGetCellX(GMUIP,Layer,ActualX);
                CellY = GMUI_GridGetCellY(GMUIP,Layer,ActualY);
                
                GMUI_ControlSetPositioning(CellX*GMUIP.cellsize,CellY*GMUIP.cellsize_h,ActualW,ActualH);
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
        if (FadeAlpha < FadeIn) {
            FadeAlpha += 1/FadeTime;
        }
        else {
            FadeAlpha = FadeIn;
            FadeCalled = 0;
        }
    }
    else {
        if (FadeAlpha > FadeOut) {
            FadeAlpha -= 1/FadeTime;
        }
        else {
            FadeAlpha = FadeOut;
            FadeCalled = 0;
        }
    }
    
    if (GMUIP.UIEnableSurfaces) {
        GMUI_GridUpdateLayer(GMUIP,Layer);
        //GMUIP.GMUI_gridNeedsDrawUpdate[Layer] = 2;
        
        if (GMUIP.GMUI_gridTransitioner[Layer] != -1) {
            //GMUIP.GMUI_groupNeedsDrawUpdate[Layer,Group] = 2;
            NeedsDrawUpdate = true;
            if (FadeCalled == 0) {
                //GMUIP.GMUI_gridFader[Layer] = -1;//GroupIsFading = false;
                if (!Transitioning) {
                    (GMUIP).GMUI_gridTransitioner[Layer] = -1;
                }
            }
        }
    }
}

// Set new position if the view offset has changed, or transitioning
if (NeedsPositionUpdate) {
    GMUI_ControlUpdateXY(id);
    NeedsPositionUpdate = false;
    //GMUI_GridUpdateLayer(GMUIP,Layer);
    //NeedsDrawUpdate = true;
}



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
            Toggle_t += 1;
            //GMUI_GridUpdateLayer(GMUIP,Layer);
            NeedsDrawUpdate = true;
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
                GMUIP.GMUI_gridNeedsDrawUpdate[Layer] = 2;
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
    
    //var Draw;Draw = false;
        
    // If using surfaces for layers and groups
    if (GMUIP.UIEnableSurfaces) {
        // Check for grid update
        if (GMUIP.GMUI_gridNeedsDrawUpdate[Layer] == 2 || GMUIP.GMUI_gridTransitioner[Layer] == id || NeedsDrawUpdate || NeedsGroupUpdate) {
            GMUIP.GMUI_gridSurface[Layer] = surface_target(GMUIP.GMUI_gridSurface[Layer], GMUIP.UIgridwidth, GMUIP.UIgridheight);
            
            if (GMUIP.GMUI_gridNeedsDrawUpdate[Layer] == 2 || (GMUIP).GMUI_gridTransitioner[Layer] == id) {
                surface_clear(GMUIP.GMUI_gridSurface[Layer]);
                GMUIP.GMUI_gridNeedsDrawUpdate[Layer] = 0;
            }
        }
        if (NeedsDrawUpdate || NeedsGroupUpdate) {
            // Update group if in one and visible or fading in/out
            if (Group > 0){// && (!GroupHidden || FadeCalled != 0)) {
                if (GMUIP.GMUI_groupMasterControl[Layer,Group] == id) {
                    GMUIP.GMUI_groupSurface[Layer,Group] = 
                        surface_target(GMUIP.GMUI_groupSurface[Layer,Group],
                        (GMUIP).GMUI_groupCellsW[Layer,Group] * (GMUIP).cellsize + 1, //(GMUIP).GMUI_groupActualX[Layer,Group]
                        (GMUIP).GMUI_groupCellsH[Layer,Group] * (GMUIP).cellsize_h + 1);
                    
                    if ((NeedsGroupUpdate || (GMUIP).GMUI_gridTransitioner[Layer] == id) && GMUIP.GMUI_groupMasterControl[Layer,Group] == id) {
                        surface_clear(GMUIP.GMUI_groupSurface[Layer,Group]);
                        
                        if (!GroupHidden || FadeCalled != 0) {
                            draw_set_blend_mode_ext(bm_one,bm_inv_src_alpha); // Tricky...
                            GMUI_ControlDrawGroup(GMUIP,Layer,Group,FadeAlpha,FadeMode);
                            draw_set_blend_mode(bm_normal);
                        }
                    }
                    
                    
                }
                else if (surface_exists(GMUIP.GMUI_groupSurface[Layer,Group])) {
                    surface_set_target(GMUIP.GMUI_groupSurface[Layer,Group]);
                }
            }
            else if (Group > 0) {
                NeedsDrawUpdate = false;
            }
        }
    //}
    
    
        //if (Group == 0) {
        if (0) {
            if (NeedsDrawUpdate) {
                // Set the surface target if it exists, otherwise create it
                (GMUIP).GMUI_gridSurface[Layer] = 
                    surface_target(GMUIP.GMUI_gridSurface[Layer], GMUIP.UIgridwidth, GMUIP.UIgridheight);
                
                if (GMUIP.GMUI_gridNeedsDrawUpdate[Layer] == 2 || GMUIP.GMUI_gridTransitioner[Layer] == id) {
                    //surface_clear(GMUIP.GMUI_gridSurface[Layer]);
                    
                    GMUIP.GMUI_gridNeedsDrawUpdate[Layer] = 0;
                    NeedsDrawUpdate = false;
                    
                    //if (GMUIP.GMUI_groupMasterControl[Layer,Group] == id)
                    //    GMUIP.GMUI_groupNeedsDrawUpdate[Layer,Group] = true;
    
                }
                else if (GMUIP.GMUI_gridNeedsDrawUpdate[Layer] = 0)
                    NeedsDrawUpdate = false;
            }
            else
                Break = true;
        }
        //else 
        //if (Group > 0 && (!GroupHidden || FadeCalled != 0)) {
        if (0) {
            //if (GMUIP.GMUI_groupMasterControl[Layer,Group] == id)
                //GMUI_ControlDrawGroup(GMUIP,Layer,Group,FadeAlpha,FadeMode);
            if (GMUIP.GMUI_groupNeedsDrawUpdate[Layer,Group] > 0 && GMUIP.GMUI_groupMasterControl[Layer,Group] == id) {
                if (surface_exists(GMUIP.GMUI_groupSurface[Layer,Group])) {
                    GMUIP.GMUI_groupSurface[Layer,Group] = 
                        surface_target(GMUIP.GMUI_groupSurface[Layer,Group],
                        (GMUIP).GMUI_groupCellsW[Layer,Group] * (GMUIP).cellsize + 1, //(GMUIP).GMUI_groupActualX[Layer,Group]
                        (GMUIP).GMUI_groupCellsH[Layer,Group] * (GMUIP).cellsize_h + 1);
                    
                    if (TransitioningGroup && GMUIP.GMUI_groupMasterControl[Layer,Group] == id) {
                        //surface_clear(GMUIP.GMUI_groupSurface[Layer,Group]);
                        GMUIP.GMUI_groupNeedsDrawUpdate[Layer,Group] = 1;
                    }
                    if (!NeedsDrawUpdate)
                    surface_reset_target();
                }
            }
            if (NeedsDrawUpdate) {
                
                if (GMUIP.GMUI_gridNeedsDrawUpdate[Layer] == 2 || GMUIP.GMUI_gridTransitioner[Layer] == id) {
                    (GMUIP).GMUI_gridSurface[Layer] = 
                    surface_target(GMUIP.GMUI_gridSurface[Layer], GMUIP.UIgridwidth, GMUIP.UIgridheight);
                    //surface_clear(GMUIP.GMUI_gridSurface[Layer]);
                    
                    GMUIP.GMUI_gridNeedsDrawUpdate[Layer] = 0;
                    NeedsDrawUpdate = false;
                }
                    
                GMUIP.GMUI_groupSurface[Layer,Group] = 
                    surface_target(GMUIP.GMUI_groupSurface[Layer,Group], //GMUIP.UIgridwidth, GMUIP.UIgridheight);
                        (GMUIP).GMUI_groupCellsW[Layer,Group] * (GMUIP).cellsize + 1, //(GMUIP).GMUI_groupActualX[Layer,Group]
                        (GMUIP).GMUI_groupCellsH[Layer,Group] * (GMUIP).cellsize_h + 1);
                    
                if (GMUIP.GMUI_groupMasterControl[Layer,Group] == id) {
                    //surface_clear(GMUIP.GMUI_groupSurface[Layer,Group]);
                    var i;
                    for(i=0;i<ds_list_size((GMUII()).GMUI_groupControlList[Layer,Group]);i+=1) {
                        // Get the control id
                        ctrl = ds_list_find_value((GMUII()).GMUI_groupControlList[Layer,Group],i);
                        
                        if (instance_exists(ctrl)) {
                            ctrl.NeedsDrawUpdate = true;
                        }
                    }
                    //draw_set_blend_mode_ext(bm_one,bm_inv_src_alpha); // Tricky...
                    //GMUI_ControlDrawGroup(GMUIP,Layer,Group,FadeAlpha,FadeMode);
                    //draw_set_blend_mode(bm_normal);
                }
                
                //GMUIP.GMUI_groupNeedsDrawUpdate[Layer,Group] = false;
                
                if (!NeedsDrawUpdate) {
                    surface_reset_target();
                    Break = true;
                }
                NeedsDrawUpdate = false;
            }
            else
                Break = true;
                
            
            if (0) {
                if (GMUIP.GMUI_groupMasterControl[Layer,Group] == id) {
                    if (surface_exists((GMUIP).GMUI_groupSurface[Layer,Group])) {
                        GMUIP.GMUI_gridSurface[Layer] = 
                        surface_target(GMUIP.GMUI_gridSurface[Layer], GMUIP.UIgridwidth, GMUIP.UIgridheight);
                    
                        if (GMUIP.GMUI_gridNeedsDrawUpdate[Layer] == 2 || GMUIP.GMUI_gridTransitioner[Layer] == id) {
                            surface_clear(GMUIP.GMUI_gridSurface[Layer]);
                            GMUIP.GMUI_gridNeedsDrawUpdate[Layer] = 0;
                        }
                        var xoffset, yoffset;
                        xoffset = GMUI_GridViewOffsetX(GMUIP);
                        yoffset = GMUI_GridViewOffsetY(GMUIP);
                        //draw_set_blend_mode_ext(bm_one,bm_dest_alpha); // Tricky...
                        draw_surface(GMUIP.GMUI_groupSurface[Layer,Group],
                            //0,global.showsurface,surface_get_width(GMUIP.GMUI_groupSurface[Layer,Group]),surface_get_height(GMUIP.GMUI_groupSurface[Layer,Group])-50+global.showsurface, //example
                            GMUIP.GMUI_groupActualX[Layer,Group] + xoffset,GMUIP.GMUI_groupActualY[Layer,Group] + yoffset);
                            //draw_set_blend_mode(bm_normal);
                        surface_reset_target();
                        Break = false;
                        GMUIP.GMUI_groupSurface[Layer,Group] = 
                    surface_target(GMUIP.GMUI_groupSurface[Layer,Group], //GMUIP.UIgridwidth, GMUIP.UIgridheight);
                        GMUIP.GMUI_groupCellsW[Layer,Group] * GMUIP.cellsize + 1, //(GMUIP).GMUI_groupActualX[Layer,Group]
                        GMUIP.GMUI_groupCellsH[Layer,Group] * GMUIP.cellsize_h + 1);
                    }
                    GMUIP.GMUI_groupNeedsDrawUpdate[Layer,Group] -= 1//false;
                }
                // group needs update, but control itself does not, so stop here
                //Break = true;
            }
            //else if (!NeedsDrawUpdate)
            //    Break = true;
        }
        //else if (!NeedsDrawUpdate)
        //    Break = true;
    }
    else if (Group > 0 && GMUIP.GMUI_groupMasterControl[Layer,Group] == id && (!GroupHidden || FadeCalled != 0)) {
        // Draw non-surface group
        GMUI_ControlDrawGroup(GMUIP,Layer,Group,FadeAlpha,FadeMode);
    }
    
    // If hidden and not fading out, no draw is needed...
    if ((Hidden || GroupHidden) && FadeCalled == 0) {
        NeedsDrawUpdate = false;
    }
    else if (!GMUIP.UIEnableSurfaces) {
        NeedsDrawUpdate = true;
    }
    
    
    // Surface has already been updated
    //if (Break) 
    //    return false;
    
        
        
    // TODO:
    // SUBTRACT THE GROUP X AND GROUP Y FROM ROOM X AND ROOM Y FOR DRAWING, IF USING GROUP DRAW ABOVE
    // MOVE SECOND HALF OF GROUP DRAWING ABOVE TO THE BOTTOM OF THIS SCRIPT
    // DRAW THE GROUP AT THE GROUP X AND GROUP Y
        
        
    // Draw the control based on the type and user-defined settings
    if (NeedsDrawUpdate) {
        var padx;
        padx = ControlPaddingX;
        _BackgroundAlpha = min(ControlBackgroundAlpha,FadeAlpha);
        _HoverAlpha = min(ControlHoverAlpha,FadeAlpha);
        _SelectAlpha = min(ControlSelectAlpha,FadeAlpha);
        _OverwriteAlpha = min(ControlOverwriteAlpha,FadeAlpha);
        _FontAlpha = min(ControlFontAlpha,FadeAlpha);
        _SpriteAlpha = min(ControlGraphicAlpha,FadeAlpha);
            
        // Start drawing the control (inputs and buttons)
        if (ControlInput || ControlPicker || ControlDataType == global.GMUIDataTypeButton || ControlType == "image") {
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
                color_alpha(ControlBackgroundColor,_BackgroundAlpha);
                draw_rectangle(RoomX, RoomY, RoomW, RoomH, 0);
                
                // Border
                color_alpha(ControlBorderColor,_BackgroundAlpha);
                draw_rectangle(RoomX, RoomY, RoomW, RoomH, 1);
            
        
                if (Hovering || Selected) {
                    // Draw the hovering effect
                    if (!Selected)
                        color_alpha(ControlHoverColor,_HoverAlpha);
                    else
                        color_alpha(ControlSelectColor,_SelectAlpha);
                    draw_rectangle(RoomX+1,RoomY+1,RoomW-1,RoomH-1, ControlHoverBorder);
                }
                
                if (DoubleSelected && ControlInput) {
                    // Draw 'Overwrite' affect
                    color_alpha(ControlOverwriteColor,_OverwriteAlpha);
                    draw_rectangle(RoomX+2,RoomY+2,RoomW-2,RoomH-2,0);
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
                _ax1 = RoomW-2;
                _ax3 = _ax1-ControlPickerWidth+1;
                _hh = (RoomH-RoomY)/2;
            }
            if (ControlPickerDirection == global.GMUIDirectionTypeHorizontal) {
                _ax2 = RoomX+2;
                _ay2 = _ay1;
            }
            else { // GMUIDirectionTypeSideVertical or GMUIDirectionTypeVertical
                _ax2 = _ax1;
                _ay2 = RoomH-2;
            }
            
            // Top arrow and bottom arrow
            draw_sprite_ext(ControlPickerSpriteRightOrUp,0,_ax1,_ay1,1,1,0,c_white,_BackgroundAlpha);
            draw_sprite_ext(ControlPickerSpriteLeftOrDown,0,_ax2,_ay2,1,1,0,c_white,_BackgroundAlpha);
            
            color_alpha(ControlHoverColor,_HoverAlpha);
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
        else if (ControlDataType == global.GMUIDataTypeString) {
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
            GMUI_ThrowErrorDetailed("Invalid font align",GMUI_ControlDraw);
        }
        
        if (ActualH > 0)
            midHeight = ActualH / 2;
        else
            midHeight = CellHigh * (GMUIP).cellsize_h / 2;
            
        // Set control font and alignment
        draw_set_font(ControlFont);
        align(ControlFontAlign,ControlFontAlignV);
        
        // Specific controls may override display
        if (ControlDataType == global.GMUIDataTypeButton && ControlButtonTextHoveringOn && Hovering)
            color_alpha(ControlButtonTextHoverColor,_FontAlpha);
        else
            color_alpha(ControlFontColor,_FontAlpha);
            
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
                if (ControlInteraction && ControlShowCursor && Selected && !DoubleSelected)
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
        
    }
    
    // Reset the surface if using one, draw the group if needed
    if (GMUIP.UIEnableSurfaces) {
        surface_reset_target();
        if (Group > 0 && GMUIP.GMUI_groupDrawingControl[Layer,Group] == id && (NeedsDrawUpdate || NeedsGroupUpdate)) {
            if (surface_exists(GMUIP.GMUI_groupSurface[Layer,Group])) {
                GMUIP.GMUI_gridSurface[Layer] = surface_target(GMUIP.GMUI_gridSurface[Layer], GMUIP.UIgridwidth, GMUIP.UIgridheight);
                draw_surface(GMUIP.GMUI_groupSurface[Layer,Group],
                    //0,global.showsurface,surface_get_width(GMUIP.GMUI_groupSurface[Layer,Group]),surface_get_height(GMUIP.GMUI_groupSurface[Layer,Group])-50+global.showsurface,
                    GMUIP.GMUI_groupActualX[Layer,Group],GMUIP.GMUI_groupActualY[Layer,Group]);
                surface_reset_target();
            }
        }
        if (GMUIP.GMUI_gridNeedsDrawUpdate[Layer] != 1) {
            NeedsDrawUpdate = false;
            NeedsGroupUpdate = false;
        }
    }
}
//
