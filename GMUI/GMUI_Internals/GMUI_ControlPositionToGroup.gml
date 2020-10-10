///GMUI_ControlPositionToGroup(Control id)
function GMUI_ControlPositionToGroup(argument0) {

with (argument0) {
    // Reset positioning to base on group's position
    CellX = GMUI_GetAnchoredCellX(GMUIP.GMUI_groupCellsW[Layer,Group],RelativeCellX,Anchor) + GMUIP.GMUI_groupCellX[Layer,Group];
    CellY = GMUI_GetAnchoredCellY(GMUIP.GMUI_groupCellsH[Layer,Group],RelativeCellY,Anchor) + GMUIP.GMUI_groupCellY[Layer,Group];
    
    ActualX = GMUI_CellGetActualX(CellX);
    ActualY = GMUI_CellGetActualY(CellY);
    
    var expand; expand = true;
    if (GMUIP.UIEnableSurfaces) {
        if (GMUIP.GMUI_groupOverflow[Layer,Group] != global.GMUIOverflowResize) {
            expand = false;
        }
    }
    
    // If control is outside of the group boundaries, expand the group to fit it
    if (expand) {
        if (CellX + CellWide > GMUIP.GMUI_groupCellX[Layer,Group] + GMUIP.GMUI_groupCellsW[Layer,Group]) {
        
            GMUIP.GMUI_groupCellsW[Layer,Group] = CellX + CellWide - GMUIP.GMUI_groupCellX[Layer,Group];
            
            if (GMUIP.UIEnableSurfaces)
                GMUI_SurfaceResize(GMUIP,
                    GMUIP.GMUI_groupSurface[Layer,Group],
                    GMUIP.GMUI_groupCellsW[Layer,Group]*GMUIP.cellsize+1,
                    GMUIP.GMUI_groupCellsH[Layer,Group]*GMUIP.cellsize_h+1);
        }
        
        if (CellY + CellHigh > GMUIP.GMUI_groupCellY[Layer,Group] + GMUIP.GMUI_groupCellsH[Layer,Group]) {
        
            GMUIP.GMUI_groupCellsH[Layer,Group] = CellY + CellHigh - GMUIP.GMUI_groupCellY[Layer,Group];
            
            if (GMUIP.UIEnableSurfaces)
                GMUI_SurfaceResize(GMUIP,
                    GMUIP.GMUI_groupSurface[Layer,Group],
                    GMUIP.GMUI_groupCellsW[Layer,Group]*GMUIP.cellsize+1,
                    GMUIP.GMUI_groupCellsH[Layer,Group]*GMUIP.cellsize_h+1);
        }
    }
    else if (CellY + CellHigh > GMUIP.GMUI_groupCellY[Layer,Group] + GMUIP.GMUI_groupCellsH[Layer,Group]) {
        GMUIP.GMUI_groupOverflowCellsH[Layer,Group] = CellY + CellHigh - GMUIP.GMUI_groupCellY[Layer,Group];
    }
    
    
    // Update control draw location in the room
    GMUI_ControlUpdateXY(id);
}
}

