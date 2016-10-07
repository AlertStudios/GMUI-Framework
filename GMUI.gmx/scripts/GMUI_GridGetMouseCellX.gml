///GMUI_GridGetMouseCellX(mouse_x)
///Returns the horizontal cell block that the mouse is on
// argument0 is usually mouse_x

return ceil((argument0-(GMUII()).GMUI_grid_x[(GMUII()).UILayer])/(GMUII()).cellsize)-1;


