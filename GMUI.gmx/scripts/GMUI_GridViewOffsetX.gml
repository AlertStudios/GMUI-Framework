///GMUI_GridViewOffsetX(GMUI instance)
///Returns the offset value of the grid, based on UIsnaptoview and UIEnableSurfaces settings

with (argument0) {
    if (UIsnaptoview && !UIEnableSurfaces)
        return view_xview[UIgridview];
    else
        return 0;
} 
