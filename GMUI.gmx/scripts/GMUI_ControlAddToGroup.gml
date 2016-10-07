///GMUI_ControlAddToGroup(group number)
///Adds control to a group if it exists in the layer

var _Group, _Layer;
_Group = argument0;
// Layer value exists in the control
_Layer = Layer;

// Must be control
if (!GMUI_IsControl()) {
    GMUI_ThrowError("Invalid control for GMUI_ControlAddToGroup");
    return false;
}

// Validate
if (!is_real(_Group)) {
    GMUI_ThrowError("Invalid group for GMUI_ControlAddToGroup");
    return false;
}
if (_Group <= 0) {
    GMUI_ThrowError("Invalid group for GMUI_ControlAddToGroup");
    return false;
}
    
// Control must have a layer that exists (should always be the case)
if (!GMUI_LayerExists(_Layer)) {
    GMUI_ThrowError("Control in layer that doesn't exist: " + string(id) + ". GMUI_ControlAddToGroup");
    return false;
}
    

// Add control to group's control list and assign to control
ds_list_add((GMUII()).GMUI_groupControlList[_Layer,_Group],id);
Group = _Group;


// Reset positioning to base on group's position
CellX = GMUI_GetAnchoredCellX((GMUII()).GMUI_groupCellsW[_Layer,_Group],CellX,Anchor) + (GMUII()).GMUI_groupCellX[_Layer,_Group];
CellY = GMUI_GetAnchoredCellY((GMUII()).GMUI_groupCellsH[_Layer,_Group],CellY,Anchor) + (GMUII()).GMUI_groupCellY[_Layer,_Group];

ActualX = GMUI_CellGetActualX(CellX);
ActualY = GMUI_CellGetActualY(CellY);


// If control is outside of the group boundaries, expand the group to fit it
if (CellX + CellWide > (GMUII()).GMUI_groupCellX[_Layer,_Group] + (GMUII()).GMUI_groupCellsW[_Layer,_Group]) {
    (GMUII()).GMUI_groupCellsW[_Layer,_Group] = CellX + CellWide - (GMUII()).GMUI_groupCellX[_Layer,_Group];
}
if (CellY + CellHigh > (GMUII()).GMUI_groupCellY[_Layer,_Group] + (GMUII()).GMUI_groupCellsH[_Layer,_Group]) {
    (GMUII()).GMUI_groupCellsH[_Layer,_Group] = CellY + CellHigh - (GMUII()).GMUI_groupCellY[_Layer,_Group];
}
    
    
