///GMUI_ControlTransitionToCell("ControlName",Cell X, Cell Y, Transition Script, Time)
///

// Get coordinates of CellX and CellY and pass to actual position
var _ActualX, _ActualY;

_ActualX = GMUI_CellGetActualX(argument1);
_ActualY = GMUI_CellGetActualY(argument2);

GMUI_ControlTransitionToActual(argument0,_ActualX,_ActualY,argument3,argument4);
