///GMUI_ControlDraw(Draw the control [bool])
/// The actions done per step for a control added to the grid, along with drawing things


// TEMPORARY SOLUTION??:
if (Hidden) return false;

// STEP actions:
if (Selected) {
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
        
        // Only does assignment of the value once the key is released
        if (keyboard_check_released(vk_anykey)) {
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
                
    // String form of the data type
    //var DataType;
    //if (ControlDataType == global.GMUIDataTypeInteger) {
    //    DataType = "integer";
    //}
    //else if (ControlDataType == global.GMUIDataTypeDecimal) {
    //    DataType = "double";
    //}
    //else {
    //    DataType = "string";
    //}
    GMUI_SetValue(valueName,value,ControlDataType);
    
    //Reset
    valueChangeDetected = 0;
}



// DRAW //

if (argument0 == true) {
    // Cell x,y and Cell width/height x,y
    var cx, cy, cwx, chy, padx;
    //cx = (GMUII()).cellsize * CellX + RelativeX;
    //cy = (GMUII()).cellsize_h * CellY + RelativeY;
    cx = ActualX + RelativeX;
    cy = ActualY + RelativeY;
    
    if (ActualW > 0)
        cwx = cx + ActualW;
    else
        cwx = cx + GMUI_CellGetActualX(CellWide);
    if (ActualH > 0)
        chy = cy + ActualH;
    else
        chy = cy + GMUI_CellGetActualY(CellHigh);
        
    padx = 4;
    
        
    // Start drawing the control
    if (ControlInput || ControlDataType == global.GMUIDataTypeButton) {
        if (sprite_exists(ControlGraphic)) {
            // Sprite has been substituted for the default drawing
            var subi; subi = ControlGraphicIndex;
            if (Hovering) subi = ControlGraphicHoveringIndex;
            if (Selected) subi = ControlGraphicSelectedIndex;
            
            draw_sprite_ext(ControlGraphic,subi,cx,cy,ControlGraphicXScale,ControlGraphicYScale,ControlGraphicRotation,ControlGraphicColor,ControlGraphicAlpha);
        }
        else {
            // Background
            color_alpha(ControlBackgroundColor,ControlBackgroundAlpha);
            draw_rectangle(cx, cy, cwx, chy, 0);
            
            // Border
            color_alpha(ControlBorderColor,ControlBackgroundAlpha);
            draw_rectangle(cx, cy, cwx, chy, 1);
        
    
            if (Hovering || Selected) {
                // Draw the hovering effect
                if (!Selected)
                    color_alpha(ControlHoverColor,ControlHoverAlpha);
                else
                    color_alpha(ControlSelectColor,ControlSelectAlpha);
                draw_rectangle(cx+1,cy+1,cwx-1,chy-1, ControlHoverBorder);
            }
        }
    }
    
    if (DoubleSelected && ControlInput) {
        // Draw 'Overwrite' affect
        color_alpha(ControlOverwriteColor,ControlOverwriteAlpha);
        draw_rectangle(cx+2,cy+2,cwx-2,chy-2,0);
    }
    
    // Draw special features for the other types
    // Picker types (integer, double, etc)
    if (ControlPicker) {
        // draw arrows (origin should be on the right and to the corner it is placed at)
        // Top arrow and bottom arrow
        draw_sprite(ControlPickerSpriteRightOrUp,0,cwx-2,cy+2);
        draw_sprite(ControlPickerSpriteLeftOrDown,0,cwx-2,chy-2);
        
        if (ControlPickerDirection == global.GMUIDirectionTypeSideVertical) {
            color_alpha(ControlHoverColor,ControlHoverAlpha);
            switch (HoveringDirection) {
                case global.GMUIHoveringDirection_Up:
                    draw_rectangle(cwx-2-ControlPickerWidth,cy,cwx-1,cy+(chy-cy)/2,0);
                    break;
                case global.GMUIHoveringDirection_Down:
                    draw_rectangle(cwx-2-ControlPickerWidth,chy-(chy-cy)/2,cwx-1,chy,0);
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
    dtx = cx + padx;    
    if (ControlFontAlign == fa_center)
        dtx = cx+(cwx-cx)/2;
    else if (ControlFontAlign == fa_right)
        dtx = cwx - padx;
    else if (ControlFontAlign != fa_left) {
        ControlFontAlign = (GMUII()).ControlFontAlign;
        GMUI_ThrowErrorDetailed("Invalid font align","GMUI_ControlDraw");
    }
    
    if (ActualH > 0)
        midHeight = ActualH / 2;
    else
        midHeight = CellHigh * (GMUII()).cellsize_h / 2;
        
    // Set control font and alignment
    draw_set_font(ControlFont);
    align(ControlFontAlign,ControlFontAlignV);
    
    // Specific controls may override display
    if (ControlDataType == global.GMUIDataTypeButton && ControlButtonTextHoveringOn && Hovering)
        color_alpha(ControlButtonTextHoverColor,ControlFontAlpha);
    else
        color_alpha(ControlFontColor,ControlFontAlpha);
        
    // TEMPORARY SOLUTION! :
    if (Disabled)
        draw_set_alpha(ControlFontAlpha / 2);
        
    // Button with graphic inside
    if (ControlDataType == global.GMUIDataTypeButton) {
        if (sprite_exists(ControlButtonGraphic)) {
            draw_sprite(ControlButtonGraphic,0,dtx, cy + midHeight);
            dtx += sprite_get_width(ControlButtonGraphic) + padx;
        }
    }
    
    // Draw value string or button text
    if (ControlShowCursor && Selected && !DoubleSelected)
        Text = Text + "|";
    draw_text(dtx, cy + midHeight,Text);
    
}
//
