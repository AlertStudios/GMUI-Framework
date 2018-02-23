///GMUI_ControlAddToGroup(group number)
///Adds control to a group if it exists in the layer

var SCRIPT, _Group, _Layer, _Depth;
SCRIPT = GMUI_ControlAddToGroup;
_Group = argument0;

// Must be control
if (!GMUI_IsControl()) {
    GMUI_ThrowErrorDetailed("Invalid control",SCRIPT);
    return false;
}

// Validate
if (!is_real(_Group)) {
    GMUI_ThrowErrorDetailed("Invalid group",SCRIPT);
    return false;
}
if (_Group <= 0) {
    GMUI_ThrowErrorDetailed("Invalid group",SCRIPT);
    return false;
}
    
// Control must have a layer that exists (should always be the case)
// Layer value exists in the control
_Layer = Layer;
if (!GMUI_LayerExists(_Layer)) {
    GMUI_ThrowErrorDetailed("Control in layer that doesn't exist: " + string(id),SCRIPT);
    return false;
}

if (!GMUI_GroupExists(_Layer,_Group)) {
    GMUI_ThrowErrorDetailed("Group "+string(_Group)+" doesn't exist for adding control: " + string(id),SCRIPT);
    return false;
}


// Add control to group's control list and assign to control
ds_list_add(GMUIP.GMUI_groupControlList[_Layer,_Group],id);
Group = _Group;
_Depth = GMUIP.layerDepth_layers-(_Layer*3)-(ControlType=="tooltip")*2;

// The master control will handle drawing and transitioning of the group
if (GMUIP.GMUI_groupMasterControl[_Layer,_Group] == -1 || GMUIP.GMUI_groupMasterControl[_Layer,_Group] > id) {
    if (instance_exists(GMUIP.GMUI_groupMasterControl[_Layer,_Group])) {
        with (GMUIP.GMUI_groupMasterControl[_Layer,_Group]) {
            depth = _Depth-1;
        }
    }
    GMUIP.GMUI_groupMasterControl[_Layer,_Group] = id;
    depth = _Depth;
}
else
    depth = _Depth-1;
    
if (GMUIP.UIEnableSurfaces) {
    if (GMUIP.GMUI_groupDrawingControl[_Layer,_Group] == -1 || GMUIP.GMUI_groupDrawingControl[_Layer,_Group] < id) {
        GMUIP.GMUI_groupDrawingControl[_Layer,_Group] = id;
        NeedsGroupUpdate = true;
    }
}

GMUI_ControlPositionToGroup(id);


return true;
    
    
