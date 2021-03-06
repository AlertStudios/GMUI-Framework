///GMUI_ControlHide("ControlName", Hide?)
///Hide or show a control
// argument1 is to hide (1) or show (0)
function GMUI_ControlHide(argument0,argument1) {

with (GMUII()) {
    // Retrieve control from the reference map
    var _ctrl;
    if (is_string(argument0))
        _ctrl = ds_map_find_value(GMUI_map,argument0);
    else
        _ctrl = argument0;
    if (string(_ctrl) == "0")
        return false;
    else {
        _ctrl.Hidden = argument1;
        
        if (argument1 == false)
            if (_ctrl.ControlType == "selectlist")
                if (_ctrl.ControlDropdownParent != -1)  
                    if (_ctrl.ControlDropdownParent.Selected == false)
                        _ctrl.Hidden = true;
        
        if (_ctrl.FadeOnHide) {
            if (argument1 > 0)
                GMUI_ControlFadeOut(argument0,_ctrl.FadeTime);
            else
                GMUI_ControlFadeIn(argument0,_ctrl.FadeTime);
        }
        else {
            GMUI_GridUpdateLayer(_ctrl.GMUIP,_ctrl.Layer);
            _ctrl.NeedsDrawUpdate = 1;
        }
        
        // Re-set the control region on the map
        GMUI_GridSetControlRegion(GMUI_grid[_ctrl.Layer],_ctrl,!_ctrl.Hidden);
        
        return true;
    }
}
}

