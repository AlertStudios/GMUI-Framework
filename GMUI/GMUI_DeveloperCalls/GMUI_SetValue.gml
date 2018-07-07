///GMUI_SetValue("ControlName", value, value type - string:0, integer:1, decimal:2)
///Set the value of a control to GMUI to reference in user code (GMUI_GetValue)

with (GMUII())
{
    // Retrieve control from the reference map
    var control,a2,c,_invalid;
    control = ds_map_find_value(GMUI_map,argument0);
    _invalid = false;
    
    a2 = string(argument2);
    // If integer or decimal, we will need to do some work to convert the string to an acceptable format
    if (a2 == "0" || string_lower(a2) == "string")
    {
        (control).value = string_copy(string(argument1),0,(control).ControlMaxStringLength);
        (control).valueString = (control).value;
    }
    else if (a2 == "1" || string_lower(a2) == "integer" || string_lower(a2) == "int")
    {
        (control).value = minmax(round(real(argument1)),(control).ControlMinValue,(control).ControlMaxValue);
        (control).valueString = string((control).value);
    }
    else if (a2 == "2" || string_lower(a2) == "double")
    {
        (control).value = minmax(real(argument1),(control).ControlMinValue,(control).ControlMaxValue);
        // Remove any trailing zeros if option is turned on, otherwise use simple format
        var formatValue,c,z,strLenFmtVal;
        formatValue = string_format((control).value,(control).ControlMaxStringLength,(control).ControlMaxDecimalLength);
        
        if (GMUIRemoveExtraDecimalZeros && formatValue != "0")
        {
            z = 0;
            strLenFmtVal = string_length(formatValue);
            for (c=0;c<=strLenFmtVal;c+=1) {
                if (string_char_at(formatValue,strLenFmtVal-c) == "0")
                    z += 1;
                else
                    break;
            }
            formatValue = string_copy(formatValue,0,strLenFmtVal-z);
            if (string_char_at(formatValue,string_length(formatValue)) == ".")
            formatValue = string_copy(formatValue,0,string_length(formatValue)-1);
        }
        (control).valueString = formatValue;
    }
    else
    {
        GMUI_ThrowErrorDetailed("Unknown value type",GMUI_SetValue);
        _invalid = true;
    }
    
    // If not a string, check if we need to update a slider or toggle
    if (a2 != "0" && string_lower(a2) != "string") {
        if ((control).ControlType == "slider") {
            GMUI_ControlSliderUpdate(control);
        }
        else if ((control).ControlType == "checkbox" || (control).ControlType == "toggle") {
            GMUI_ControlToggleUpdate(control);
        }
    }
    
    // If a value was set and a script is assigned to value change, execute it
    if (!_invalid && GMUI_IsScript((control).ValueChangedActionScript)) {
        script_execute((control).ValueChangedActionScript);
    }
}

