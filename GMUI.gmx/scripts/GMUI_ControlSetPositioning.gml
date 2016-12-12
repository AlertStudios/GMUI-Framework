///GMUI_ControlSetPositioning( relative x, relative y, actual width, actual height )
///Set the relative positioning and sizing of the control within its cell

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetPositioning");
    return false;
}

// Actual width and height has more exact mouse boundaries (0 for full), BUT only 1 control can be in the same cell block
ActualW = argument2;
ActualH = argument3;

// Relative position is used if the boundary box should be adjusted, must be < cell size
RelativeX = min(argument0,(GMUII()).cellsize - 1);
RelativeY = min(argument1,(GMUII()).cellsize_h - 1);

// Store that this object has an adjusted position
if (ActualW != 0 || ActualH != 0 || RelativeX != 0 || RelativeY != 0)
    IsAdjusted = true;
else
    IsAdjusted = false;

return true;


