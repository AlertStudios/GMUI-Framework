///GMUI_MouseInAdjustedSpecialRegion(Control Object, mouse x, mouse y)
/// Returns direction if mouse is in the adjusted region of the control

var _Control, _MX, _MY, _D, _CW, _CH, sizingW, sizingH, _xoffset, _yoffset;
_Control = argument0;
_MX = argument1;
_MY = argument2;
sizingW = 0;
sizingH = 0;

// Check region of control if valid cotrol
if (!GMUI_IsControlID(_Control) && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_MouseInSpecialRegion");
    return global.GMUIHoveringDirection_None;
}

// Get the proper width/height of the cell
if ((_Control).ActualW != 0)
    _CW = (_Control).ActualW;
else
    _CW = (_Control).CellWide * ((GMUII()).cellsize);

if ((_Control).ActualH != 0)
    _CH = (_Control).ActualH;
else
    _CH = (_Control).CellHigh * ((GMUII()).cellsize_h);
    
_D = (_Control).ControlPickerDirection;
    
// if sizing mode is half of cell, then use the direction to find midpoints, otherwise use picker size
if (_D == global.GMUIDirectionTypeSideVertical)
{
    sizingW = (_Control).ControlPickerWidth;
    sizingH = _CH / 2;
}
else if (_D == global.GMUIDirectionTypeVertical)
{
    sizingW = _CW;
    sizingH = (_Control).ControlPickerHeight + 2; // +2 borders
}
else
{
    sizingW = (_Control).ControlPickerWidth + 2; // +2 borders
}

// Adjustments if using views
_xoffset = GMUI_GridViewOffsetX((_Control).GMUIP);
_yoffset = GMUI_GridViewOffsetY((_Control).GMUIP);

// Adjustment if grid is offset
_xoffset += ((_Control).GMUIP).GMUI_grid_x[(_Control).Layer];
_yoffset += ((_Control).GMUIP).GMUI_grid_y[(_Control).Layer];
    

// Check if coordinates are inside the adjusted control based on what adjustments are set
if (_D == global.GMUIDirectionTypeHorizontal)
{
    if ((_MX >= (_Control).ActualX + (_Control).RelativeX + _xoffset) && 
        (_MX <= (_Control).ActualX + (_Control).RelativeX + sizingW + _xoffset))
        return global.GMUIHoveringDirection_Left;
    else if ((_MX >= (_Control).ActualX + (_Control).RelativeX + _CW - sizingW + _xoffset) && 
        (_MX <= (_Control).ActualX + (_Control).RelativeX + _CW + _xoffset))
        return global.GMUIHoveringDirection_Right;
}
else if (_D == global.GMUIDirectionTypeSideVertical || _D == global.GMUIDirectionTypeVertical)
{
    if ((_MY >= (_Control).ActualY + (_Control).RelativeY + _yoffset) && 
        (_MY <= (_Control).ActualY + (_Control).RelativeY + sizingH + _yoffset) &&
        (_MX >= (_Control).ActualX + (_Control).RelativeX + _CW - sizingW + _xoffset))
        return global.GMUIHoveringDirection_Up;
    else if ((_MY >= (_Control).ActualY + (_Control).RelativeY + _CH - sizingH + _yoffset) &&
        (_MY <= (_Control).ActualY + (_Control).RelativeY + _CH + _yoffset) &&
        (_MX >= (_Control).ActualX + (_Control).RelativeX + _CW - sizingW + _xoffset))
    return global.GMUIHoveringDirection_Down;
}

// No Conditions were met
return global.GMUIHoveringDirection_None;


