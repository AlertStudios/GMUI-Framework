///GMUI_GridAdjustLayer(Layer Number [or all: -1], cells wide, cells high)
/// Adjusts the layer's grid based on new dimensions and moves the controls according to their anchors

// Layer needs to exist
if (!GMUI_LayerExists(argument0))
    return false;


var _GMUI,_Layer, CW, CH, _prevLayer;
_GMUI = GMUII();
_Layer = floor(argument0);

// If cells wide/high are 0, then it is assumed to be adjusted to the room or view dimensions
if (argument1 == 0)
    CW = ceil((_GMUI).UIgridwidth/(_GMUI).cellsize);
else
    CW = argument1;

if (argument2 == 0)
    CH = ceil((_GMUI).UIgridheight/(_GMUI).cellsize_h);
else
    CH = argument2;

ds_grid_resize((_GMUI).GMUI_grid[_Layer],CW,CH);

(_GMUI).UIgridwidth = max((_GMUI).UIgridwidth, CW * (_GMUI).cellsize);
(_GMUI).UIgridheight = max((_GMUI).UIgridheight, CH * (_GMUI).cellsize_h);
(_GMUI).GMUI_grid_w[_Layer] = CW * (_GMUI).cellsize;
(_GMUI).GMUI_grid_h[_Layer] = CH * (_GMUI).cellsize_h;

// Reset any surfaces
if ((_GMUI).UIEnableSurfaces) {
    if (surface_exists((_GMUI).GMUI_gridSurface[_Layer]))
        surface_free((_GMUI).GMUI_gridSurface[_Layer]);
    (_GMUI).GMUI_gridSurface[_Layer] = surface_create((_GMUI).UIgridwidth,(_GMUI).UIgridheight);
}


// Get grid dimensions
var gridW, gridH, anc, relX, relY, pCellX, pCellY;
gridW = GMUI_GridGetWidth(_GMUI,_Layer);
gridH = GMUI_GridGetHeight(_GMUI,_Layer);
//if (_Layer == 99) show_message(string(gridW) + " , " + string(gridH));
// Move any controls that are anchored to other positions
var ctrl;
for(i=0;i<ds_list_size((_GMUI).GMUI_controlList);i+=1) {
    // Get control value
    ctrl = ds_list_find_value((_GMUI).GMUI_controlList,i);
    
    if (!instance_exists(ctrl)) {
        GMUI_ThrowError("Control no longer exists. GMUI_GridAdjustLayer()");
    }
    else if (((ctrl).Layer == _Layer) && ctrl.Group == 0) {
        // The relative values when the grid is adjusted has four relative positions: Middle X's, Middle Y's, Right X's, Bottom Y's)
    
        // Use the anchor and position relative to it 
        anc = (ctrl).Anchor;
        relX = (ctrl).RelativeCellX;
        relY = (ctrl).RelativeCellY;
        pCellX = (ctrl).CellX;
        pCellY = (ctrl).CellY;
        
        // Use grid's dimensions unless part of a group (handled by group move)
        (ctrl).CellX = GMUI_GetAnchoredCellX(gridW,relX,anc);
        (ctrl).CellY = GMUI_GetAnchoredCellY(gridH,relY,anc);
        
        // Actual position based on its grid position
        (ctrl).ActualX = GMUI_CellGetActualX((ctrl).CellX);
        (ctrl).ActualY = GMUI_CellGetActualY((ctrl).CellY);
        
        // Check boundaries
        if (!GMUI_ValidCellBounds(anc,(ctrl).CellX,(ctrl).CellY,gridW,gridH)) {
            GMUI_ThrowError("Cell values out of bounds. GMUI_GridAdjustLayer() on ('" + string((ctrl).Layer) + "'," + string(argument1) + "," + string(argument2) + "...");
        }
    }
}

// Move any groups that are anchored to other positions
var _Group, _MasterControl, _CellX, _CellY;
for(i=0;i<ds_list_size((_GMUI).GMUI_groupList[_Layer]);i+=1) {
    _Group = ds_list_find_value((_GMUI).GMUI_groupList[_Layer],i);
    _MasterControl = (_GMUI).GMUI_groupMasterControl[_Layer,_Group];
    
    _CellX = (_GMUI).GMUI_groupRelativeCellX[_Layer,_Group];
    _CellY = (_GMUI).GMUI_groupRelativeCellY[_Layer,_Group];
    
    _prevLayer = (_GMUI).UIAddToLayer;
    (_GMUI).UIAddToLayer = _Layer;
    GMUI_GroupSetPosition(_Group,_CellX,_CellY,(_GMUI).GMUI_groupRelativeX[_Layer,_Group],(_GMUI).GMUI_groupRelativeY[_Layer,_Group]);
    (_GMUI).UIAddToLayer = _prevLayer;
    
    // Reset hide position transition values
    (_MasterControl).T_px_group = GMUI_CellGetActualX((_GMUI).GMUI_groupCellX[_Layer,_Group]);
    (_MasterControl).T_py_group = GMUI_CellGetActualY((_GMUI).GMUI_groupCellY[_Layer,_Group]);
    (_MasterControl).T_hx_group = (_MasterControl).T_px_group + (_MasterControl).T_hrelx_group;
    (_MasterControl).T_hy_group = (_MasterControl).T_py_group + (_MasterControl).T_hrely_group;
    
    if ((_MasterControl).GroupHidden && (_MasterControl).T_hspeed_group > 0) {
        (_GMUI).GMUI_groupActualX[_Layer,_Group] = (_MasterControl).T_hx_group;
        (_GMUI).GMUI_groupActualY[_Layer,_Group] = (_MasterControl).T_hy_group;
        _CellX -= floor((_MasterControl).T_hrelx_group / (_GMUI).cellsize);
        _CellY -= floor((_MasterControl).T_hrely_group / (_GMUI).cellsize_h);
    }
}

// Reset the regions for the layer
GMUI_GridSetRegionsLayer(_Layer);



return true;


