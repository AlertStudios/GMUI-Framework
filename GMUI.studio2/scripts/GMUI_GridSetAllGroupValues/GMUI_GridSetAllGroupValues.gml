///GMUI_GridSetAllGroupValues(GMUI instance);
///Set all mapped values to groups, called after the UI is set
function GMUI_GridSetAllGroupValues(argument0) {

with (argument0) {

    // Cycle through each grid layer
    var i,l,j,g,k;
    for(i=0;i<ds_list_size(GMUI_gridlist);i+=1) {
        l = ds_list_find_value(GMUI_gridlist,i);
        for(j=0;j<ds_list_size(GMUI_groupList[l]);j+=1) {
            g = ds_list_find_value(GMUI_groupList[l],j);
            if (GMUI_groupSettingsMap[l,g] != -1) {
                // Set group mapped values
                GMUI_GridSetMappedValues(id,l,g);
                // Reset map
                ds_map_destroy(GMUI_groupSettingsMap[l,g]);
                GMUI_groupSettingsMap[l,g] = -1;
            }
            // Set scrollbar option if necessary
            if (UIEnableSurfaces) {
                if (GMUI_groupDrawingControl[l,g] > -1) {
                    with (GMUI_groupDrawingControl[l,g]) {
                        if (GMUIP.GMUI_groupOverflow[l,g] == global.GMUIOverflowScroll) {
                            GMUI_GroupSetScrollbar(argument0,l,g,-1);
                        }
                    }
                }
            }
        }
    }

}
}

