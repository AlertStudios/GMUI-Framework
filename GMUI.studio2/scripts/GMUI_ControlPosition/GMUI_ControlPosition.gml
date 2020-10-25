///GMUI_ControlPosition("control name" or id, cell x, cell y, relative x, relative y, Anchor)
///Set the relative positioning and sizing of the control within its cell
function GMUI_ControlPosition(argument0,argument1,argument2,argument3,argument4,argument5) {

var _ctrl,_Anchor,_CellX,_CellY,_gridW,_gridH;
_CellX = argument1;
_CellY = argument2;
_Anchor = argument5;

if (is_string(argument0))
    _ctrl = ds_map_find_value((GMUII()).GMUI_map,argument0);
else
    _ctrl = argument0;
    
if (!GMUI_IsControlID(_ctrl)) {
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlPosition);
    return false;
}

// Store the relative values provided that reference against the anchor position
if (_Anchor >= 0)
    _ctrl.Anchor = _Anchor;
_ctrl.RelativeCellX = _CellX;
_ctrl.RelativeCellY = _CellY;

// Get the dimensions and round down for grids that have even grid sizes
_gridW = GMUI_GridGetWidth(_ctrl.GMUIP,_ctrl.Layer);
_gridH = GMUI_GridGetHeight(_ctrl.GMUIP,_ctrl.Layer);

// If stretch flag is set, then re-calculate the size&position acording to the anchor
if (_ctrl.StretchToGrid) {
    switch (_Anchor) {
        case global.GMUIAnchorTop:
        case global.GMUIAnchorBottom:
            _CellX = 0 - GMUI_GetAnchoredCellX(_gridW,0 - _ctrl.RelativeCellX,_Anchor);
            _ctrl.CellWide = _gridW - _ctrl.RelativeCellX * 2;
            break;
        case global.GMUIAnchorLeft:
        case global.GMUIAnchorRight:
            _CellY = 0 - GMUI_GetAnchoredCellY(_gridH,0 - _ctrl.RelativeCellY,_Anchor);
            _ctrl.CellHigh = _gridH - _ctrl.RelativeCellY * 2;
            break;
        case global.GMUIAnchorCenter:
            _CellX = 0 - GMUI_GetAnchoredCellX(_gridW,0 - _ctrl.RelativeCellX,_Anchor);
            _ctrl.CellWide = _gridW - _ctrl.RelativeCellX * 2;
            _CellY = 0 - GMUI_GetAnchoredCellY(_gridH,0 - _ctrl.RelativeCellY,_Anchor);
            _ctrl.CellHigh = _gridH - _ctrl.RelativeCellY * 2;
            break;
        case global.GMUIAnchorTopLeft:
            break;
        case global.GMUIAnchorTopRight:
            break;
        case global.GMUIAnchorBottomRight:
            break;
        case global.GMUIAnchorBottomLeft:
            break;
    }
}

// Check grid positioning if it is an interactable control
if (_ctrl.ControlInteraction) {
    if (!GMUI_ValidCellBounds(_Anchor,_CellX,_CellY,_gridW,_gridH)) {
        GMUI_ThrowErrorDetailed("Cell values out of bounds for " + string(argument0),GMUI_ControlPosition);
        return false;
    }
}

// Relative is to the anchor, this position is the actual:
// The relative values when the grid is adjusted has four relative positions: Middle X's, Middle Y's, Right X's, Bottom Y's)
_ctrl.CellX = GMUI_GetAnchoredCellX(_gridW,_CellX,_Anchor);
_ctrl.CellY = GMUI_GetAnchoredCellY(_gridH,_CellY,_Anchor);

// Actual position based on its grid position
_ctrl.ActualX = GMUI_CellGetActualX(_ctrl.CellX);
_ctrl.ActualY = GMUI_CellGetActualY(_ctrl.CellY);

// Relative position is used if the boundary box should be adjusted, must be < cell size
_ctrl.RelativeX = min(argument3,(_ctrl.GMUIP).cellsize - 1);
_ctrl.RelativeY = min(argument4,(_ctrl.GMUIP).cellsize_h - 1);

// Store that this object has an adjusted position
if (_ctrl.ActualW != 0 || _ctrl.ActualH != 0 || _ctrl.RelativeX != 0 || _ctrl.RelativeY != 0)
    _ctrl.IsAdjusted = true;
else
    _ctrl.IsAdjusted = false;
    
if (_ctrl.Group > 0) {
    GMUI_ControlPositionToGroup(_ctrl);
    if ((_ctrl.GMUIP).UIInterfaceSet)
        GMUI_GridSetRegionsLayer(_ctrl.Layer);
    if ((_ctrl.GMUIP).UIEnableSurfaces) {
        GMUI_GridUpdateLayer(_ctrl.GMUIP,_ctrl.Layer);
    }
}
else
    _ctrl.NeedsPositionUpdate = true;

return true;
}


