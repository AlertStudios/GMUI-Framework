#define GMUI_DrawDebug
// DEBUGGING SCRIPT! Call this in the draw event of the GMUI main object 
// Run only if DebugData is on
if (DebugData) {

    var gridW,gridH,w,h;
    gridW = ds_grid_width((GMUII()).GMUI_grid[0]);
    gridH = ds_grid_height((GMUII()).GMUI_grid[0]);
    
    // draw the grid lines 
    color_alpha(c_black,0.1);
    for (w=0;w<gridW;w+=1) {
        draw_line(w*cellsize,0,w*cellsize,room_height);
    }
    for (h=0;h<gridH;h+=1) {
        draw_line(0,h*cellsize_h,room_width,h*cellsize_h);
    }
    
    // draw the errors
    if (GMUI_ErrorNumber > 0) {
        color_alpha(c_red,0.5);
        align(fa_center,fa_bottom);
        draw_text(room_width/2,room_height-64,string(GMUI_ErrorNumber) + ".) " + GMUI_LastError());
    }
    
    
    // draw the group boundaries
    color_alpha(c_green,0.5);
    var groupId, layer;
    for(i=0;i<ds_list_size((GMUII()).GMUI_gridlist);i+=1) {
        layer = ds_list_find_value((GMUII()).GMUI_gridlist,i);
        
        for(j=0;j<ds_list_size((GMUII()).GMUI_groupList[layer]);j+=1) {
            groupId = ds_list_find_value((GMUII()).GMUI_groupList[layer],j);
            
            draw_rectangle(GMUI_groupActualX[layer,groupId],GMUI_groupActualY[layer,groupId],
                GMUI_groupActualX[layer,groupId] + GMUI_groupCellsW[layer,groupId]*cellsize,
                GMUI_groupActualY[layer,groupId] + GMUI_groupCellsH[layer,groupId]*cellsize_h,
                true);
        }
    }


}

