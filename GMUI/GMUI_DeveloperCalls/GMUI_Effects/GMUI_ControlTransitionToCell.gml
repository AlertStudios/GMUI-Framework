///GMUI_ControlTransitionToCell("ControlName",Cell X, Cell Y, Transition Script, Time)
function GMUI_ControlTransitionToCell(argument0,argument1,argument2,argument3,argument4) {

// Get coordinates of CellX and CellY and pass to actual position
var _ActualX, _ActualY, _Ctrl;
_Ctrl = GMUI_GetControl(argument0);

_ActualX = GMUI_CellGetActualX(argument1);
_ActualY = GMUI_CellGetActualY(argument2);

if (_Ctrl.Group > 0) {
    _ActualX += _Ctrl.GMUIP.GMUI_groupActualX[_Ctrl.Layer,_Ctrl.Group];
    _ActualY += _Ctrl.GMUIP.GMUI_groupActualY[_Ctrl.Layer,_Ctrl.Group];
}

GMUI_ControlTransitionToActual(argument0,_ActualX,_ActualY,argument3,argument4);
}

