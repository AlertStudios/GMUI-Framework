///GMUI_MouseInAdjustedRegion(Control Object, mouse x, mouse y)
/// Checks to see if the mouse is in the adjusted region of the control (true/false)

var _Control, _MX, _MY, _CW, _CH;
_Control = argument0;
_MX = argument1;
_MY = argument2;

// Check region of control if valid cotrol
if (!GMUI_IsControlID(_Control) && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_MouseInAdjustedRegion");
    return false;
}

// Get the proper width/height of the cell (using cellsize functions)
if ((_Control).ActualW != 0)
    _CW = (_Control).ActualW;
else
    _CW = GMUI_CellGetActualX((_Control).CellWide);

if ((_Control).ActualH != 0)
    _CH = (_Control).ActualH;
else
    _CH = GMUI_CellGetActualY((_Control).CellHigh);
    
// Check if coordinates are inside the adjusted control based on what adjustments are set
if ((_MX >= (_Control).ActualX + (_Control).RelativeX && _MX <= (_Control).ActualX + (_Control).RelativeX + _CW) &&
    (_MY >= (_Control).ActualY + (_Control).RelativeY && _MY <= (_Control).ActualY + (_Control).RelativeY + _CH)
    )
    return true;
else
    return false;
