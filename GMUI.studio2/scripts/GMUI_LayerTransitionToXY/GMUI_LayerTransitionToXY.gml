///GMUI_LayerTransitionToXY(Layer number, Room X, Room Y, Alpha [or -1], Transition Script, Time)
function GMUI_LayerTransitionToXY(argument0,argument1,argument2,argument3,argument4,argument5) {

var _Layer; _Layer = argument0;

if (!GMUI_LayerExists(_Layer)) {
    GMUI_ThrowErrorDetailed("Layer doesn't exist!", GMUI_LayerTransitionToXY);
    return false;
}

if (!GMUI_IsScript(argument4)) {
    GMUI_ThrowErrorDetailed("Script not found", GMUI_LayerTransitionToXY);
    return false;
}

with (GMUII()) {
    GMUI_grid_Transitioning[_Layer] = true;
    GMUI_grid_T_script[_Layer] = argument4;
    
    GMUI_grid_T_t[_Layer] = 0;
    
    if (argument5 > 0)
        GMUI_grid_T_d[_Layer] = argument5;
    else
        GMUI_grid_T_d[_Layer] = room_speed;
        
    GMUI_grid_T_ba[_Layer] = GMUI_grid_alpha[_Layer];
    if (argument3 >= 0)
        GMUI_grid_T_ca[_Layer] = argument3 - GMUI_grid_T_ba[_Layer];
    else
        GMUI_grid_T_ca[_Layer] = 0;
    
    GMUI_grid_T_bx[_Layer] = GMUI_grid_x[_Layer];
    GMUI_grid_T_by[_Layer] = GMUI_grid_y[_Layer];
    GMUI_grid_T_cx[_Layer] = argument1 - GMUI_grid_x[_Layer];
    GMUI_grid_T_cy[_Layer] = argument2 - GMUI_grid_y[_Layer];
    
    // Signal to instance that a layer is transitioning...
    GMUI_grid_Transition = true;
}

return true;
}

