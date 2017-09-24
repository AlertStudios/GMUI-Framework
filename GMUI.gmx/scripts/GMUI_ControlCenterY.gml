///GMUI_ControlCenterY("control name" or id)
///Centers the control in its layer vertically

var _NameOrId, _Control;
_NameOrId = argument0;

// Retrieve control from the reference map
if (is_string(_NameOrId))
    _Control = ds_map_find_value((GMUII()).GMUI_map,_NameOrId);
else
    _Control = _NameOrId;
    
if (string(_Control) == "0") {
    GMUI_ThrowErrorDetailed("Control not found: " + string(_NameOrId), GMUI_ControlCenterY);
    return false;
}
else {
    // Center if control exists
    GMUI_ControlPosition((_Control).valueName, (_Control).RelativeCellX,
        GMUI_CenterY((_Control).Layer, (_Control).CellHigh, (_Control).Anchor),
        (_Control).RelativeX, (_Control).RelativeY, (_Control).Anchor);
        
    if (((_Control).GMUIP).InitialDisable <= 0)
        GMUI_GridSetRegionsLayer((_Control).Layer);
        
    return true;
}
