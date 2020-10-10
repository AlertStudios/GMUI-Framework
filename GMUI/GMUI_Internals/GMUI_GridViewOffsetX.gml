///GMUI_GridViewOffsetX(GMUI instance)
///Returns the offset value of the grid, based on UIsnaptoview and UIEnableSurfaces settings
function GMUI_GridViewOffsetX(argument0) {

with (argument0) {
    if (UIsnaptoview)
        return view_xview[UIgridview];
    else
        return 0;
} 
}

