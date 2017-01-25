///GMUI_GridAdjustLayer(Layer Number, cells wide, cells high)
/// Adjusts the layer's grid based on new dimensions and moves the controls according to their anchors

// Layer needs to exist
if (!GMUI_LayerExists(argument0))
    return false;


var _Layer, CW, CH;
_Layer = floor(argument0);

// If cells wide/high are 0, then it is assumed to be adjusted to the room or view dimensions
if (argument1 == 0)
    CW = ceil((GMUII()).UIgridwidth/(GMUII()).cellsize);
else
    CW = argument1;

if (argument2 == 0)
    CH = ceil((GMUII()).UIgridheight/(GMUII()).cellsize_h);
else
    CH = argument2;

ds_grid_resize((GMUII()).GMUI_grid[_Layer],CW,CH);

// Get grid dimensions
var gridW, gridH, anc, relX, relY, pCellX, pCellY;
gridW = GMUI_GridGetWidth(GMUII(),_Layer);
gridH = GMUI_GridGetHeight(GMUII(),_Layer);

// Move any controls that are anchored to other positions
var ctrl;
for(i=0;i<ds_list_size((GMUII()).GMUI_controlList);i+=1) {
    // Get control value
    ctrl = ds_list_find_value((GMUII()).GMUI_controlList,i);
    
    if (!instance_exists(ctrl)) {
        GMUI_ThrowError("Control no longer exists. GMUI_GridAdjustLayer()");
    }
    else if ((ctrl).Layer == _Layer && ctrl.Group == 0) {
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
var groupId;
for(i=0;i<ds_list_size((GMUII()).GMUI_groupList[_Layer]);i+=1) {
    groupId = ds_list_find_value((GMUII()).GMUI_groupList[_Layer],i);
    
    GMUI_GroupSetPosition(_Layer,groupId,GMUI_groupCellX[_Layer,groupId],GMUI_groupCellY[_Layer,groupId],GMUI_groupRelativeX[_Layer,groupId],GMUI_groupRelativeY[_Layer,groupId]);
}

// Reset the regions for the layer
GMUI_GridSetRegionsLayer(_Layer);



return true;

