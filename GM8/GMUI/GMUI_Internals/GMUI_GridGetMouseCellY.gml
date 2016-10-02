#define GMUI_GridGetMouseCellY
/// Returns the vertical cell block that the mouse is on
// argument0 is usually mouse_y

return ceil((argument0-(GMUII()).GMUI_grid_y[(GMUII()).UILayer])/(GMUII()).cellsize_h)-1;



