#define GMUI_MouseInSpecialRegion
/// Returns direction if mouse is in the adjusted region of the control
// GMUI_MouseInAdjustedSpecialRegion(Control Object, mouse x, mouse y)

var _Control, _MX, _MY, _D, _CW, _CH, sizingW, sizingH;
_Control = argument0;
_MX = argument1;
_MY = argument2;
sizingW = 0;
sizingH = 0;

// Check region of control if valid cotrol
if (!GMUI_IsControlID(_Control) && id != global.GMUIiid)
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
    sizingH = (_Control).ControlPickerHeight + 2; // +2 borders
}
else
{
    sizingW = (_Control).ControlPickerWidth + 2; // +2 borders
}
    
// Check if coordinates are inside the adjusted control based on what adjustments are set
if (_D == global.GMUIDirectionTypeHorizontal)
{
    if ((_MX >= (_Control).ActualX + (_Control).RelativeX) && 
        (_MX <= (_Control).ActualX + (_Control).RelativeX + sizingW))
        return global.GMUIHoveringDirection_Left;
    else if ((_MX >= (_Control).ActualX + (_Control).RelativeX + _CW - sizingW) && 
        (_MX <= (_Control).ActualX + (_Control).RelativeX + _CW))
        return global.GMUIHoveringDirection_Right;
}
else if (_D == global.GMUIDirectionTypeSideVertical)
{
    if ((_MY >= (_Control).ActualY + (_Control).RelativeY) && 
        (_MY <= (_Control).ActualY + (_Control).RelativeY + sizingH) &&
        (_MX >= (_Control).ActualX + _CW - sizingW))
        return global.GMUIHoveringDirection_Up;
    else if ((_MY >= (_Control).ActualY + (_Control).RelativeY + _CH - sizingH) &&
        (_MY <= (_Control).ActualY + (_Control).RelativeY + _CH) &&
        (_MX >= (_Control).ActualX + _CW - sizingW))
    return global.GMUIHoveringDirection_Down;
}

// No Conditions were met
return global.GMUIHoveringDirection_None;



