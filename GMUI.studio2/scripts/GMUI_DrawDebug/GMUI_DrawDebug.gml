// DEBUGGING SCRIPT! Call this in the draw event of the GMUI main object 
// Run only if DebugData is on
function GMUI_DrawDebug() {
if (DebugData && !RemovingGMUI) {

    var gridW,gridH,w,h,xoffset,yoffset;
    gridW = GMUI_GridGetWidth(GMUII(),0);
    gridH = GMUI_GridGetHeight(GMUII(),0);
    
    xoffset = GMUI_GridViewOffsetX(GMUII());
    yoffset = GMUI_GridViewOffsetY(GMUII());
    
    // draw the grid lines 
    GMUIcolor_alpha(c_black,0.1);
    for (w=0;w<gridW;w+=1) {
        draw_line(w*cellsize+(GMUII()).GMUI_grid_x[0]+xoffset,yoffset,w*cellsize+(GMUII()).GMUI_grid_x[0]+xoffset,(GMUII()).UIgridheight+yoffset);
    }
    for (h=0;h<gridH;h+=1) {
        draw_line(xoffset,h*cellsize_h+(GMUII()).GMUI_grid_y[0]+yoffset,(GMUII()).UIgridwidth+xoffset,h*cellsize_h+(GMUII()).GMUI_grid_y[0]+yoffset);
    }
    
    // draw the errors
    if (GMUI_ErrorNumber > 0) {
        GMUIcolor_alpha(c_red,0.5);
        GMUIalign(fa_center,fa_bottom);
        draw_text_ext(view_wview[0]/2+xoffset,view_hview[0]-64+yoffset,
            string(GMUI_ErrorNumber) + ".) " + GMUI_LastError(), -1, view_wview[0]-32);
    }
    
    var groupId, _layer, i, m, ff, ffo;
    
    // draw the group boundaries
    GMUIcolor_alpha(c_green,0.5);
    for(i=0;i<ds_list_size((GMUII()).GMUI_gridlist);i+=1) {
        _layer = ds_list_find_value((GMUII()).GMUI_gridlist,i);
        if (_layer >= (GMUII()).GMUI_menu_layer)
            GMUIcolor_alpha(c_lime,0.25);
        
        for(j=0;j<ds_list_size((GMUII()).GMUI_groupList[_layer]);j+=1) {
            groupId = ds_list_find_value((GMUII()).GMUI_groupList[_layer],j);
            
            draw_rectangle(
                (GMUII()).GMUI_groupActualX[_layer,groupId] + (GMUII()).GMUI_grid_x[_layer] + xoffset,
                (GMUII()).GMUI_groupActualY[_layer,groupId] + (GMUII()).GMUI_grid_y[_layer] + yoffset,
                (GMUII()).GMUI_groupActualX[_layer,groupId] + 
                    (GMUII()).GMUI_groupCellsW[_layer,groupId]*(GMUII()).cellsize + (GMUII()).GMUI_grid_x[_layer] + xoffset,
                (GMUII()).GMUI_groupActualY[_layer,groupId] + 
                    (GMUII()).GMUI_groupCellsH[_layer,groupId]*(GMUII()).cellsize_h + (GMUII()).GMUI_grid_y[_layer] + yoffset,
                true);
        }
    }
    
    // draw control lines
    GMUIcolor_alpha(c_red,0.8);
    with (GMUI_controlobject) {
        if (ControlType == "label" && GMUIP == GMUII()) {
            draw_rectangle(RoomX, RoomY, RoomW, RoomH, 1);
        }
    }
    
}
}

