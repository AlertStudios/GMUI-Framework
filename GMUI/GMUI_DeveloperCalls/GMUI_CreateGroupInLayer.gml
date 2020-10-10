///GMUI_CreateGroupInLayer(layer number, group number, cell# x, cell# y, cells wide, cells high, Anchor)
///Adds a group to a GMUI layer that controls can be put into
function GMUI_CreateGroupInLayerargument0,argument1,argument2,argument3,argument4) {

// Arguments
var _Group,_CellX,_CellY,_Layer,_Anchor;
_Layer = argument0;
_Group = argument1;
_CellX = argument2;
_CellY = argument3;
_Anchor = argument4;


// Validate
if (!is_real(_Group) || !is_real(_Layer) || !is_real(_CellX) || !is_real(_CellY)) {
    GMUI_ThrowError("Invalid parameters for GMUI_CreateGroup");
    return -1;
}

if (_Group <= 0) {
    GMUI_ThrowError("Group number must be greater than 0");
    return -1;
}

if (!GMUI_LayerExists(_Layer)) {
    GMUI_ThrowError("Layer " + string(_Layer) + " doesn't exist. GMUI_CreateGroup");
    return -1;
}

// Create group; add to GMUI group list and create a control list
ds_list_add((GMUII()).GMUI_groupList[_Layer],_Group);

with (GMUII()) {
    GMUI_groupControlList[_Layer,_Group] = ds_list_create();

    // Set defaults
    GMUI_groupRelativeX[_Layer,_Group] = 0;
    GMUI_groupRelativeY[_Layer,_Group] = 0;
    GMUI_groupGraphicMapIsUsed[_Layer,_Group] = false;
    // Default sprite map values
    GMUI_groupGraphicTop[_Layer,_Group] = -1;
    GMUI_groupGraphicTopRight[_Layer,_Group] = -1;
    GMUI_groupGraphicRight[_Layer,_Group] = -1;
    GMUI_groupGraphicBottomRight[_Layer,_Group] = -1;
    GMUI_groupGraphicBottom[_Layer,_Group] = -1;
    GMUI_groupGraphicBottomLeft[_Layer,_Group] = -1;
    GMUI_groupGraphicLeft[_Layer,_Group] = -1;
    GMUI_groupGraphicTopLeft[_Layer,_Group] = -1;
    GMUI_groupGraphicCenter[_Layer,_Group] = -1;
    GMUI_groupGraphicCenterIsTiled[_Layer,_Group] = false;
    
    // Set position
    GMUI_groupCellX[_Layer,_Group] = GMUI_GetAnchoredCellX(GMUI_GridGetWidth(GMUII(),_Layer),_CellX,_Anchor);
    GMUI_groupCellY[_Layer,_Group] = GMUI_GetAnchoredCellY(GMUI_GridGetHeight(GMUII(),_Layer),_CellY,_Anchor);
    GMUI_groupActualX[_Layer,_Group] = GMUI_CellGetActualX(GMUI_groupCellX[_Layer,_Group]);
    GMUI_groupActualY[_Layer,_Group] = GMUI_CellGetActualY(GMUI_groupCellY[_Layer,_Group]);
    GMUI_groupCellsW[_Layer,_Group] = 1;
    GMUI_groupCellsH[_Layer,_Group] = 1;
    GMUI_groupRelativeCellX[_Layer,_Group] = _CellX;
    GMUI_groupRelativeCellY[_Layer,_Group] = _CellY;
    GMUI_groupAnchor[_Layer,_Group] = _Anchor;
    GMUI_groupTransitioning[_Layer,_Group] = false;
    GMUI_groupMasterControl[_Layer,_Group] = -1;
    GMUI_groupSettingsMap[_Layer,_Group] = -1;
    
    GMUI_groupStretch[_Layer,_Group] = global.GMUIAnchorDefault;
    GMUI_groupOverflow[_Layer,_Group] = global.GMUIOverflowResize;
    GMUI_groupOverflowCellsH[_Layer,_Group] = 1;
    GMUI_groupScrollWidth[_Layer,_Group] = cellsize;
    
    // Surface specific
    if (UIEnableSurfaces) {
        GMUI_groupSurface[_Layer,_Group] = noone;
        //GMUI_groupNeedsDrawUpdate[_Layer,_Group] = true;
        GMUI_groupDrawingControl[_Layer,_Group] = -1;
        GMUI_groupDrawingFirst[_Layer,_Group] = -1;
        GMUI_groupDrawingLast[_Layer,_Group] = -1;
    }
}


return GMUII();
}

