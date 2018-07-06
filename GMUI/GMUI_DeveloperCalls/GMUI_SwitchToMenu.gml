#define GMUI_SwitchToMenu
///GMUI_SwitchToMenu(GMUI, Menu number)
///Switches the depth of all controls in the menu of the current layer

// Arguments
var _SCRIPT, _GMUII, _LayerNumber, _MenuNumber, _MasterControl;
_SCRIPT = GMUI_SwitchToMenu;
_GMUII = argument0;
_MenuNumber = argument1;
_LayerNumber = GMUI_GetMenuLayer(_GMUII,_MenuNumber);

// Validate
if (!is_real(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Invalid parameter",_SCRIPT);
    return false;
}

if (!GMUI_LayerExists(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Layer " + string(_LayerNumber) + " doesn't exist",_SCRIPT);
    return false;
}

GMUI_SwitchToLayer(_LayerNumber);

_MasterControl = (_GMUII).GMUI_groupMasterControl[_LayerNumber,_MenuNumber];
(_MasterControl).PreviousMenu = (_GMUII).GMUI_menuCurrent;
(_MasterControl).PreviousMenuLayer = (_GMUII).UILayerPrevious;

(GMUII()).GMUI_menuCurrent = _MenuNumber;

var i;
for(i=0;i<ds_list_size((_GMUII).GMUI_groupControlList[_LayerNumber,_MenuNumber]);i+=1) {
    // Get the control id
    ctrl = ds_list_find_value((_GMUII).GMUI_groupControlList[_LayerNumber,_MenuNumber],i);
    
    if (!instance_exists(ctrl))
    {
        GMUI_ThrowErrorDetailed("Control no longer exists (" + _LayerNumber + "," + _MenuNumber + ")", _SCRIPT);
    }
    else {
        // Set control depth to the # of menu's open if master control, -1 for not master, -2 for tooltip, etc.
        (ctrl).depth = GMUI_MenuControlDepth(_GMUII,(_GMUII).GMUI_menuOpenCount,(ctrl).ControlType)
            - (_MasterControl != ctrl);
    }
}


