///GMUI_Destroy(GMUI number)
///Only call this when you want to remove all traces of the GMUI instance provided, including the object itself


with (argument0) {

    // Needs to destroy all controls
    var c, ctrl;
    for(c=0;c<ds_list_size(GMUI_controlList);c+=1) {
        // Get the control id
        ctrl = ds_list_find_value(GMUI_controlList,c);
        
        if (instance_exists(ctrl)) {
            with (ctrl) {
                if (optionsInitialized) {
                    ds_map_destroy(OptionsMap);
                }
                instance_destroy();
            }
        }
    }
    
    ds_list_destroy(GMUI_controlList);
    
    
    // For each layer, clear its group lists, control lists, and surfaces
    var i,l,j,g;
    for(i=0;i<ds_list_size(GMUI_gridlist);i+=1) {
        l = ds_list_find_value(GMUI_gridlist,i);
        if (GMUI_StudioCheckDefined(l)) {
            // Remove the groups
            for (j=0;j<ds_list_size(GMUI_groupList[l]);j+=1) {
                g = ds_list_find_value(GMUI_groupList[l],j);
                ds_list_destroy(GMUI_groupControlList[l,g]);
            }
            
            if (surface_exists(GMUI_gridSurface[l])) {
                surface_free(GMUI_gridSurface[l]);
            }
            
            ds_grid_destroy(GMUI_grid[l]);
        }
    }
    
    ds_list_destroy(GMUI_gridlist);
    
    
    
    ds_map_destroy(GMUI_menu_map);
    
    ds_map_destroy(GMUI_popup_map);
    
    ds_map_destroy(GMUI_warnings_map);
    
    ds_map_destroy(GMUI_groupScrollbars);
    
    ds_map_destroy(GMUI_map);
    
    
    // will need to destroy surfaces if used
    
    
    
    // Destroy the object when done
    RemovingGMUI = true;
    instance_destroy();
}

