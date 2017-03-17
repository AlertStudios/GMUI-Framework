#define GMUI_ControlDraw
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
                (GMUIP).GMUI_groupActualX[Layer,Group] = script_execute(TransitionScript,T_t,T_bx_group,T_cx_group,T_d);
                (GMUIP).GMUI_groupActualY[Layer,Group] = script_execute(TransitionScript,T_t,T_by_group,T_cy_group,T_d);
            }
        }
        else {
            T_t = T_d;
            Transitioning = false;
            
            if (TransitioningGroup) {
                if ((GMUIP).GMUI_groupMasterControl[Layer,Group] == id) {
                    var _getGroupX,_getGroupY,_diffX,_diffY;
                    _diffX = (GMUIP).GMUI_groupActualX[Layer,Group]-GMUI_CellGetActualX(GMUI_GridGetCellXRoom(GMUIP,Layer,(GMUIP).GMUI_groupActualX[Layer,Group]));
                    _diffY = (GMUIP).GMUI_groupActualY[Layer,Group]-GMUI_CellGetActualY(GMUI_GridGetCellYRoom(GMUIP,Layer,(GMUIP).GMUI_groupActualY[Layer,Group]));
                    
                    _getGroupX = GMUI_GetAnchoredCellX(GMUI_GridGetWidth(GMUIP,Layer),GMUI_GridGetCellXRoom(GMUIP,Layer,(GMUIP).GMUI_groupActualX[Layer,Group]),(GMUIP).GMUI_groupAnchor[Layer,Group]);
                    _getGroupY = GMUI_GetAnchoredCellY(GMUI_GridGetHeight(GMUIP,Layer),GMUI_GridGetCellYRoom(GMUIP,Layer,(GMUIP).GMUI_groupActualY[Layer,Group]),(GMUIP).GMUI_groupAnchor[Layer,Group]);
                    
                    GMUI_GroupSetPositionAnchored(Layer,Group,_getGroupX,_getGroupY,
                        _diffX,_diffY,
                        (GMUIP).GMUI_groupAnchor[Layer,Group]);
                        
                    TransitioningGroup = false;
                }
            }
            else {
                CellX = GMUI_GridGetCellX(GMUIP,Layer,ActualX);
                CellY = GMUI_GridGetCellY(GMUIP,Layer,ActualY);
                
                GMUI_ControlSetPositioning(CellX*(GMUIP).cellsize,CellY*(GMUIP).cellsize_h,ActualW,ActualH);
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
    NeedsDrawUpdate = true;
}

// Set new position if the view offset has changed, or transitioning
if (NeedsPositionUpdate) {
    GMUI_ControlUpdateXY(id);
    NeedsPositionUpdate = false;
    NeedsDrawUpdate = true;
}



// Don't process any input or drawing if hidden
if (Hidden && FadeCalled == 0)
    return false;
//
    

// Process input 
if (Selected && !Hidden) {
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

if (valueChangeDetected) {
    // This may need some checks on if it should be allowed to set value... we'll see
                
    GMUI_SetValue(valueName,value,ControlDataType);
    
    //Reset
    valueChangeDetected = 0;
}


// DRAW //

if (argument0 == true) {

    // Call the draw actions for groups if in one and is set to draw
    if ((GMUIP).GMUI_groupMasterControl[Layer,Group] == id) {
        GMUI_ControlDrawGroup(GMUIP,Layer,Group);
    }

    // Draw the control based on the type and user-defined settings
    var padx, _BackgroundAlpha;
    padx = ControlPaddingX;
    _BackgroundAlpha = min(ControlBackgroundAlpha,FadeAlpha);
    _HoverAlpha = min(ControlHoverAlpha,FadeAlpha);
    _SelectAlpha = min(ControlSelectAlpha,FadeAlpha);
    _OverwriteAlpha = min(ControlOverwriteAlpha,FadeAlpha);
    _FontAlpha = min(ControlFontAlpha,FadeAlpha);
    
        
    // Start drawing the control (inputs and buttons)
    if (ControlInput || ControlDataType == global.GMUIDataTypeButton) {
        if (ControlGraphicMapIsUsed) {
            GMUI_DrawSpriteBox(GMUIP,Layer,Group,0);
        }
        else if (sprite_exists(ControlGraphic)) {
            // Sprite has been substituted for the default drawing
            var subi; subi = ControlGraphicIndex;
            if (Hovering) subi = ControlGraphicHoveringIndex;
            if (Selected) subi = ControlGraphicSelectedIndex;
            
            draw_sprite_ext(ControlGraphic,subi,RoomX,RoomY,ControlGraphicXScale,ControlGraphicYScale,ControlGraphicRotation,ControlGraphicColor,ControlGraphicAlpha);
        }
        else {
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
    
    
    
    // Draw special features for the other types
    // Picker types (integer, double, etc)
    if (ControlPicker) {
        // draw arrows (origin should be on the right and to the corner it is placed at)
        // Top arrow and bottom arrow
        draw_sprite_ext(ControlPickerSpriteRightOrUp,0,RoomW-2,RoomY+2,1,1,0,c_white,_BackgroundAlpha);
        draw_sprite_ext(ControlPickerSpriteLeftOrDown,0,RoomW-2,RoomH-2,1,1,0,c_white,_BackgroundAlpha);
        
        if (ControlPickerDirection == global.GMUIDirectionTypeSideVertical) {
            color_alpha(ControlHoverColor,_HoverAlpha);
            switch (HoveringDirection) {
                case global.GMUIHoveringDirection_Up:
                    draw_rectangle(RoomW-2-ControlPickerWidth,RoomY,RoomW-1,RoomY+(RoomH-RoomY)/2,0);
                    break;
                case global.GMUIHoveringDirection_Down:
                    draw_rectangle(RoomW-2-ControlPickerWidth,RoomH-(RoomH-RoomY)/2,RoomW-1,RoomH,0);
                    break;
            }
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
        GMUI_ThrowErrorDetailed("Invalid font align","GMUI_ControlDraw");
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
        
    // TEMPORARY SOLUTION! :
    if (Disabled)
        draw_set_alpha(_FontAlpha / 2);
        
    // Button with graphic inside
    if (ControlDataType == global.GMUIDataTypeButton) {
        if (sprite_exists(ControlButtonGraphic)) {
            draw_sprite(ControlButtonGraphic,0,dtx, RoomY + midHeight);
            dtx += sprite_get_width(ControlButtonGraphic) + padx;
        }
    }
    
    // Draw value string or button text
    if (ControlShowCursor && Selected && !DoubleSelected)
        Text = Text + "|";
    draw_text(dtx, RoomY + midHeight,Text);
    
}
//

