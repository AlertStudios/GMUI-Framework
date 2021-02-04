///GMUI_ControlTransitionToActual("ControlName",Grid X, Grid Y, Transition Script, Time)
function GMUI_ControlTransitionToActual(argument0,argument1,argument2,argument3,argument4) {

var _ctrl, _GridX, _GridY, _Transition;
_GridX = argument1;
_GridY = argument2;
_Transition = argument3;

// Retrieve _ctrl from the reference map
_ctrl = ds_map_find_value((GMUII()).GMUI_map,string(argument0));
if (string(_ctrl) == "0")
    return false;
    
// Check that the transition script is valid
if (!GMUI_IsScript(argument3))
    _Transition = easeLinear;

// Calculate coordinates and set the room positions and start transition
(_ctrl).T_t = 0;
(_ctrl).T_d = argument4;

(_ctrl).T_bx = (_ctrl).ActualX;
(_ctrl).T_by = (_ctrl).ActualY;

(_ctrl).T_cx = _GridX - (_ctrl).ActualX;
(_ctrl).T_cy = _GridY - (_ctrl).ActualY;

(_ctrl).TransitionScript = _Transition;
(_ctrl).Transitioning = true;
}


