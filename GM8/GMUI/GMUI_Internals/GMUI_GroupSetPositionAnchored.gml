#define GMUI_GroupSetPositionAnchored
///GMUI_GroupSetPositionAnchored(Group Number, Cell X, Cell Y, X Adjustment, Y Adjustment, Anchor)
///Change the position of the group (and all of the controls inside it) according to its anchor

// Arguments
var _SCRIPT, _LayerNumber,_GroupNumber,_CellX,_CellY,_AdjustmentX,_AdjustmentY, ctrl, _MasterControl;
_SCRIPT = GMUI_GroupSetPositionAnchored;
_LayerNumber = argument0;
_GroupNumber = argument1;
_CellX = argument2;
_CellY = argument3;
_AdjustmentX = argument4;
_AdjustmentY = argument5;
_Anchor = argument6;


// Validate
if (!is_real(_GroupNumber) || !is_real(_LayerNumber) || !is_real(_CellX) || !is_real(_CellY) || _GroupNumber <= 0) {
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

// Max adjustment values
_AdjustmentX = min(_AdjustmentX, (GMUII()).cellsize - 1);
_AdjustmentY = min(_AdjustmentY, (GMUII()).cellsize_h - 1);

_MasterControl = (GMUII()).GMUI_groupMasterControl[_LayerNumber,_GroupNumber];

// Change group position
(GMUII()).GMUI_groupRelativeCellX[_LayerNumber,_GroupNumber] = _CellX;
(GMUII()).GMUI_groupRelativeCellY[_LayerNumber,_GroupNumber] = _CellY;
(GMUII()).GMUI_groupCellX[_LayerNumber,_GroupNumber] = GMUI_GetAnchoredCellX(GMUI_GridGetWidth(GMUII(),_LayerNumber),_CellX,_Anchor);
(GMUII()).GMUI_groupCellY[_LayerNumber,_GroupNumber] = GMUI_GetAnchoredCellY(GMUI_GridGetHeight(GMUII(),_LayerNumber),_CellY,_Anchor);
(GMUII()).GMUI_groupRelativeX[_LayerNumber,_GroupNumber] = _AdjustmentX;
(GMUII()).GMUI_groupRelativeY[_LayerNumber,_GroupNumber] = _AdjustmentY;
(GMUII()).GMUI_groupActualX[_LayerNumber,_GroupNumber] = GMUI_CellGetActualX((GMUII()).GMUI_groupCellX[_LayerNumber,_GroupNumber]) + _AdjustmentX;
(GMUII()).GMUI_groupActualY[_LayerNumber,_GroupNumber] = GMUI_CellGetActualY((GMUII()).GMUI_groupCellY[_LayerNumber,_GroupNumber]) + _AdjustmentY;

// If not a transition move, then set the new primary (aka previous) location to this new one
if (!(_MasterControl).TransitioningGroup) {
    (_MasterControl).T_px_group = (GMUII()).GMUI_groupActualX[_LayerNumber,_GroupNumber];
    (_MasterControl).T_py_group = (GMUII()).GMUI_groupActualY[_LayerNumber,_GroupNumber];
    (_MasterControl).T_hx_group = (_MasterControl).T_px_group + (_MasterControl).T_hrelx_group;
    (_MasterControl).T_hy_group = (_MasterControl).T_py_group + (_MasterControl).T_hrely_group;
    
    if ((_MasterControl).GroupHidden) {
        (GMUII()).GMUI_groupActualX[_LayerNumber,_GroupNumber] = (_MasterControl).T_hx_group;
        (GMUII()).GMUI_groupActualY[_LayerNumber,_GroupNumber] = (_MasterControl).T_hy_group;
    }
}


// Re-position all controls within the group
var i;
for(i=0;i<ds_list_size((GMUII()).GMUI_groupControlList[_LayerNumber,_GroupNumber]);i+=1) {
    // Get the control id
    ctrl = ds_list_find_value((GMUII()).GMUI_groupControlList[_LayerNumber,_GroupNumber],i);
    
    if (!instance_exists(ctrl)) {
        GMUI_ThrowErrorDetailed("Control no longer exists (" + _LayerNumber + "," + _GroupNumber + ")", _SCRIPT);
    }
    else {
        var groupWidth,groupHeight;
        groupWidth = (GMUII()).GMUI_groupCellsW[_LayerNumber,_GroupNumber];
        groupHeight = (GMUII()).GMUI_groupCellsH[_LayerNumber,_GroupNumber];
        
        // Reset positioning based on group's position
        (ctrl).CellX = GMUI_GetAnchoredCellX(groupWidth,(ctrl).RelativeCellX,(ctrl).Anchor)
            + (GMUII()).GMUI_groupCellX[_LayerNumber,_GroupNumber];
        (ctrl).CellY = GMUI_GetAnchoredCellY(groupHeight,(ctrl).RelativeCellY,(ctrl).Anchor)
            + (GMUII()).GMUI_groupCellY[_LayerNumber,_GroupNumber];
        (ctrl).RelativeX = (GMUII()).GMUI_groupRelativeX[_LayerNumber,_GroupNumber];
        (ctrl).RelativeY = (GMUII()).GMUI_groupRelativeY[_LayerNumber,_GroupNumber];
        
        // Properly have control configure its own adjustments (sets IsAdjusted and adds cell boundary as necessary)
        with (ctrl) {
            GMUI_ControlSetPositioning(RelativeX,RelativeY,ActualW,ActualH);
        }
        (ctrl).ActualX = GMUI_CellGetActualX((ctrl).CellX);
        (ctrl).ActualY = GMUI_CellGetActualY((ctrl).CellY);
        
        if ((_MasterControl).T_hspeed_group > 0 && !(_MasterControl).TransitioningGroup && (_MasterControl).GroupHidden) {
            (ctrl).ActualX += (_MasterControl).T_hrelx_group;
            (ctrl).ActualY += (_MasterControl).T_hrely_group;
        }
    }
}

// Reset all control regions for the layer
GMUI_GridSetRegionsLayer(_LayerNumber);


