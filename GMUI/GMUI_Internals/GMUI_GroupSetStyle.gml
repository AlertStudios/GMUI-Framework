#define GMUI_GroupSetStyle
///GMUI_GroupSetStyle(Group, Background Color, Background Alpha, Border color, Border Alpha, Is RoundRect)
///Set the style of the controls that will be used for new controls (to override the defaults)
var _SCRIPT, _Layer, _Group;
_SCRIPT = GMUI_GroupSetStyle;
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control",_SCRIPT);
    return false;
}

_Layer = UIAddToLayer;
_Group = argument0;

// Map values if interface is not done being created
if (!GMUII().UIInterfaceSet) {
    if ((GMUII()).GMUI_groupSettingsMap[_Layer,_Group] == -1) {
        (GMUII()).GMUI_groupSettingsMap[_Layer,_Group] = ds_map_create();
    }
    
    ds_map_add((GMUII()).GMUI_groupSettingsMap[_Layer,_Group], "BackgroundColor", argument1);
    ds_map_add((GMUII()).GMUI_groupSettingsMap[_Layer,_Group], "BackgroundAlpha", argument2);
    ds_map_add((GMUII()).GMUI_groupSettingsMap[_Layer,_Group], "BorderColor", argument3);
    ds_map_add((GMUII()).GMUI_groupSettingsMap[_Layer,_Group], "BorderAlpha", argument4);
    ds_map_add((GMUII()).GMUI_groupSettingsMap[_Layer,_Group], "IsRoundRect", argument5);

    return true;
}

// Get master control for menu if it exists
if ((GMUII()).GMUI_groupMasterControl[_Layer,_Group] == -1) {
    GMUI_ThrowErrorDetailed("A control is needed to set style for group: " + _Group, _SCRIPT);
    return false;
}

// Call group style assign
with ((GMUII()).GMUI_groupMasterControl[UIAddToLayer,_Group]) {
    // If any values are given as negative numbers, those values will remain as the control default [Not set in Demo]
    
    if (argument1 >= 0)
    GroupBackgroundColor = argument1;
    if (argument2 >= 0)
    GroupBackgroundAlpha = minmax(argument2,0,1);
    if (argument3 >= 0)
    GroupBorderColor = argument3;
    if (argument4 >= 0)
    GroupBorderAlpha = minmax(argument4,0,1);
    if (argument5 >= 0)
    GroupIsRoundRect = minmax(argument5,0,1);
    
    
    ControlHasGroupStyle = true;
}

return true;
    

