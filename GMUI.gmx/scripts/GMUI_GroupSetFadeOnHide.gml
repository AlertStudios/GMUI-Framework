///GMUI_GroupSetFadeOnHide(Layer Number, Group Number, speed in steps)
///Set the fade in/out when the control is hidden or not

// Arguments
var SCRIPT,_LayerNumber,_GroupNumber,_Speed, _ctrl;
SCRIPT = "GMUI_GroupSetFadeOnHide";
_LayerNumber = argument0;
_GroupNumber = argument1;
_Speed = max(0,argument2);

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

// Set fade on hide rule for all controls
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
    }
}
