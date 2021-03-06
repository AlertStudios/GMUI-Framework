///GMUI_ControlAddOption(OptionKeyValue, OptionText/Sprite)
///Adds an option to the picker control
function GMUI_ControlAddOption(argument0,argument1) {

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlAddOption);
    return false;
}

// Initialize mapping if not yet set
if (!optionsInitialized) {
    OptionsMap = ds_map_create();
    OptionsMin = 0;
    OptionsMax = 0;
    OptionsFirst = argument0;
    OptionsLast = argument0;
    
    optionsInitialized = true;    
}

if (ControlType == "spritepicker" && !sprite_exists(argument1)) {
    GMUI_ThrowErrorDetailed("Sprite does not exist!", GMUI_ControlAddOption);
    return false;
}

if (is_real(argument0)) {
    if (!ds_map_exists(OptionsMap,argument0)) {
    
        ds_map_add(OptionsMap, argument0, argument1);
        
        // Need to double check this for GM:Studio
        OptionsFirst = ds_map_find_first(OptionsMap);
        OptionsLast = ds_map_find_last(OptionsMap);
        
        if (argument0 < OptionsMin)
            OptionsMin = argument0;
        else if (argument0 > OptionsMax)
            OptionsMax = argument0;
            
        return true;
    }
    else {
        GMUI_ThrowErrorDetailed("Key " + string(argument0) + " already exists", GMUI_ControlAddOption);
        return false;
    }
}
}

