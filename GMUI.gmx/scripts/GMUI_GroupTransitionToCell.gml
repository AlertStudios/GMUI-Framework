///GMUI_GroupTransitionToCell(Layer Number, Group Id, Cell X, Cell Y, Transition Script, Time)
///

// Get coordinates of CellX and CellY and pass to actual position
var _ActualX, _ActualY;

_ActualX = GMUI_CellGetActualX(argument2);
_ActualY = GMUI_CellGetActualY(argument3);

GMUI_GroupTransitionToActual(argument0, argument1,_ActualX,_ActualY,argument4,argument5);
