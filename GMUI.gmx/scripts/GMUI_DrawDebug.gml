// DEBUGGING SCRIPT! Call this in the draw event of the GMUI main object 
// Run only if DebugData is on
if (DebugData && !RemovingGMUI) {

    var gridW,gridH,w,h,xoffset,yoffset;
    gridW = GMUI_GridGetWidth(GMUII(),0);
    gridH = GMUI_GridGetHeight(GMUII(),0);
    
    xoffset = GMUI_GridViewOffsetX(GMUII());
    yoffset = GMUI_GridViewOffsetY(GMUII());
    
    // draw the grid lines 
    color_alpha(c_black,0.1);
    for (w=0;w<gridW;w+=1) {
        draw_line(w*cellsize+(GMUII()).GMUI_grid_x[0]+xoffset,yoffset,w*cellsize+(GMUII()).GMUI_grid_x[0]+xoffset,(GMUII()).UIgridheight+yoffset);
    }
    for (h=0;h<gridH;h+=1) {
        draw_line(xoffset,h*cellsize_h+(GMUII()).GMUI_grid_y[0]+yoffset,(GMUII()).UIgridwidth+xoffset,h*cellsize_h+(GMUII()).GMUI_grid_y[0]+yoffset);
    }
    
    // draw the errors
    if (GMUI_ErrorNumber > 0) {
        color_alpha(c_red,0.5);
        align(fa_center,fa_bottom);
        draw_text(view_wview[0]/2+xoffset,view_hview[0]-64+yoffset,string(GMUI_ErrorNumber) + ".) " + GMUI_LastError());
    }
    
    var groupId, layer, i, m, ff, ffo;
    
    // draw the group boundaries
    color_alpha(c_green,0.5);
    for(i=0;i<ds_list_size((GMUII()).GMUI_gridlist);i+=1) {
        layer = ds_list_find_value((GMUII()).GMUI_gridlist,i);
        if (layer >= (GMUII()).GMUI_menu_layer)
            color_alpha(c_lime,0.25);
        
        for(j=0;j<ds_list_size((GMUII()).GMUI_groupList[layer]);j+=1) {
            groupId = ds_list_find_value((GMUII()).GMUI_groupList[layer],j);
            
            draw_rectangle(
                (GMUII()).GMUI_groupActualX[layer,groupId] + (GMUII()).GMUI_grid_x[layer] + xoffset,
                (GMUII()).GMUI_groupActualY[layer,groupId] + (GMUII()).GMUI_grid_y[layer] + yoffset,
                (GMUII()).GMUI_groupActualX[layer,groupId] + 
                    (GMUII()).GMUI_groupCellsW[layer,groupId]*(GMUII()).cellsize + (GMUII()).GMUI_grid_x[layer] + xoffset,
                (GMUII()).GMUI_groupActualY[layer,groupId] + 
                    (GMUII()).GMUI_groupCellsH[layer,groupId]*(GMUII()).cellsize_h + (GMUII()).GMUI_grid_y[layer] + yoffset,
                true);
        }
    }
    
    // draw control lines
    color_alpha(c_red,0.8);
    with (GMUI_controlobject) {
        if (ControlType == "label" && GMUIP == GMUII()) {
            draw_rectangle(RoomX, RoomY, RoomW, RoomH, 1);
        }
    }
    /*ff = ds_map_find_first((_GID).GMUI_map);
    if (string(ff) != "0") {
        // Set all controls' hover variable to false
        ms = ds_map_size((_GID).GMUI_map);
        for (m=0; m < ms; m+=1) {
            if (string(ff) != "0" && GMUI_StudioCheckDefined(ff)) {
                ffo = ds_map_find_value((_GID).GMUI_map,ff);
                if (GMUI_StudioCheckDefined(ffo)) {
                    draw_
                }
            }
            
            ff = ds_map_find_next((_GID).GMUI_map,ff);
        }
    }*/
    

}
