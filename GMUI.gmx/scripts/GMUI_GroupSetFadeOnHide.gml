#define GMUI_GroupSetFadeOnHide
///GMUI_GroupSetFadeOnHide(Group Number, Speed in steps, Fade Mode [0: alpha-sequential, 1: all-together])
///Set the fade in/out when the control is hidden or not
///Fade Mode: 0 = fade dimmest last, 1 = fade all together

// Arguments
var _SCRIPT,_LayerNumber,_GroupNumber,_Speed,_FadeMode, _ctrl;
_SCRIPT = GMUI_GroupSetFadeOnHide;
_LayerNumber = UIAddToLayer;
_GroupNumber = argument0;
_Speed = max(0,argument1);
_FadeMode = argument2;


// Validate
if (!is_real(_GroupNumber) || !is_real(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Invalid parameters",_SCRIPT);
    return false;
}

if (!GMUI_LayerExists(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Layer " + string(_LayerNumber) + " doesn't exist", _SCRIPT);
    return false;
}

if (!GMUI_GroupExists(_LayerNumber,_GroupNumber)) {
    GMUI_ThrowErrorDetailed("Group " + string(_GroupNumber) + " doesn't exist on layer " + string(_LayerNumber), _SCRIPT);
    return false;
}

// Check that the UI has been fully run, otherwise create the values map
if (!UIInterfaceSet) {
    if (GMUI_groupSettingsMap[_LayerNumber,_GroupNumber] == -1) {
        GMUI_groupSettingsMap[_LayerNumber,_GroupNumber] = ds_map_create();
    }
    
    ds_map_add(GMUI_groupSettingsMap[_LayerNumber,_GroupNumber], "FadeSpeed", _Speed);
    ds_map_add(GMUI_groupSettingsMap[_LayerNumber,_GroupNumber], "FadeMode", _Speed);
    return true;
}

// Set fade on hide rule for all controls
if (ds_list_size((GMUII()).GMUI_groupControlList[_LayerNumber,_GroupNumber]) <= 0) {
    GMUI_ThrowErrorDetailed("Must create controls first! For group: " + string(_GroupNumber) + ", layer " + string(_LayerNumber), _SCRIPT);
    return false;
}
    
var i;
for(i=0;i<ds_list_size((GMUII()).GMUI_groupControlList[_LayerNumber,_GroupNumber]);i+=1) {
    // Get the control id
    ctrl = ds_list_find_value((GMUII()).GMUI_groupControlList[_LayerNumber,_GroupNumber],i);
    
    if (!instance_exists(ctrl))
    {
        GMUI_ThrowErrorDetailed("Control no longer exists (" + _LayerNumber + "," + _GroupNumber + ")", _SCRIPT);
    }
    else {
        GMUI_ControlSetFadeOnHide(ctrl,_Speed);
        ctrl.FadeMode = _FadeMode;
    }
}

return true;

