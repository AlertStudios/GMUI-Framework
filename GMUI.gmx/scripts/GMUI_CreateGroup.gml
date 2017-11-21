#define GMUI_CreateGroup
///GMUI_CreateGroup (layer number, group number, cell# x, cell# y, cells wide, cells high, Anchor)
///Adds a group to a GMUI layer that controls can be put into


// Arguments
var _groupNumber,_CellX,_CellY,_layerNumber,_Anchor;
_layerNumber = argument0;
_groupNumber = argument1;
_CellX = argument2;
_CellY = argument3;
_Anchor = argument4;


// Validate
if (!is_real(_groupNumber) || !is_real(_layerNumber) || !is_real(_CellX) || !is_real(_CellY)) {
    GMUI_ThrowError("Invalid parameters for GMUI_CreateGroup");
    return false;
}

if (_groupNumber <= 0) {
    GMUI_ThrowError("Group number must be greater than 0");
    return false;
}

if (!GMUI_LayerExists(_layerNumber)) {
    GMUI_ThrowError("Layer " + string(_layerNumber) + " doesn't exist. GMUI_CreateGroup");
    return false;
}

// Create group; add to GMUI group list and create a control list
ds_list_add((GMUII()).GMUI_groupList[_layerNumber],_groupNumber);

with (GMUII()) {
    GMUI_groupControlList[_layerNumber,_groupNumber] = ds_list_create();

    // Set defaults
    GMUI_groupRelativeX[_layerNumber,_groupNumber] = 0;
    GMUI_groupRelativeY[_layerNumber,_groupNumber] = 0;
    GMUI_groupGraphicMapIsUsed[_layerNumber,_groupNumber] = false;
    // Default sprite map values
    GMUI_groupGraphicTop[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicTopRight[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicRight[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicBottomRight[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicBottom[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicBottomLeft[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicLeft[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicTopLeft[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicCenter[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicCenterIsTiled[_layerNumber,_groupNumber] = false;
    
    // Set position
    GMUI_groupCellX[_layerNumber,_groupNumber] = GMUI_GetAnchoredCellX(GMUI_GridGetWidth(GMUII(),_layerNumber),_CellX,_Anchor);
    GMUI_groupCellY[_layerNumber,_groupNumber] = GMUI_GetAnchoredCellY(GMUI_GridGetHeight(GMUII(),_layerNumber),_CellY,_Anchor);
    GMUI_groupActualX[_layerNumber,_groupNumber] = GMUI_CellGetActualX(GMUI_groupCellX[_layerNumber,_groupNumber]);
    GMUI_groupActualY[_layerNumber,_groupNumber] = GMUI_CellGetActualY(GMUI_groupCellY[_layerNumber,_groupNumber]);
    GMUI_groupCellsW[_layerNumber,_groupNumber] = 1;
    GMUI_groupCellsH[_layerNumber,_groupNumber] = 1;
    GMUI_groupRelativeCellX[_layerNumber,_groupNumber] = _CellX;
    GMUI_groupRelativeCellY[_layerNumber,_groupNumber] = _CellY;
    GMUI_groupAnchor[_layerNumber,_groupNumber] = _Anchor;
    GMUI_groupTransitioning[_layerNumber,_groupNumber] = false;
    GMUI_groupMasterControl[_layerNumber,_groupNumber] = -1;
}



return true;

