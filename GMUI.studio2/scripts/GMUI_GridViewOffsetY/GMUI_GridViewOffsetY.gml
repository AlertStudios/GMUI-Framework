///GMUI_GridViewOffsetY(GMUI instance)
///Returns the offset value of the grid, based on UIsnaptoview and UIEnableSurfaces settings
function GMUI_GridViewOffsetY(argument0) {

with (argument0) {
    if (UIsnaptoview)
        return view_yview[UIgridview];
    else
        return 0;
} 
}

