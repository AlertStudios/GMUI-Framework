///GMUI_ShowMenuId(menu id, show[1] or hide[0], animate [bool])

// Arguments
var _SCRIPT, _GMUII, _animate, _show, _menuNumber, _layerNumber, _masterControl;
_SCRIPT = GMUI_ShowMenu;
_GMUII = GMUII();

if (!is_real(argument0)) {
    GMUI_ThrowErrorDetailed("Invalid menu id", _SCRIPT);
    return false;
}

_menuNumber = argument0;
_show = (argument1 > 0);
_animate = argument2;

if (string(_menuNumber) == "0")
    return false;

_layerNumber = GMUI_GetMenuLayer(_GMUII,_menuNumber);

_masterControl = (_GMUII).GMUI_groupMasterControl[_layerNumber,_menuNumber];

// Switch to menu layer or back, calling animate script if set
if (_show) {
    (_GMUII).GMUI_menuOpenCount += 1;
    GMUI_SwitchToMenu(_GMUII,_menuNumber);
    
    if (_animate && (_masterControl).T_hspeed_group > 0) {
        GMUI_GroupTransitionToActual(_layerNumber, _menuNumber, 
            (_masterControl).T_px_group, (_masterControl).T_py_group, 
            (_masterControl).T_hscript_group, (_masterControl).T_hspeed_group);
    }
    (_masterControl).GroupHidden = false;
}
else {
    GMUI_SwitchToLayer((_masterControl).PreviousMenuLayer);
    (_GMUII).GMUI_menuCurrent = (_masterControl).PreviousMenu;
    
    // Save location before hidden
    //(_masterControl).T_px_group = round(GMUI_groupActualX[_layerNumber,_menuNumber]);
    //(_masterControl).T_py_group = round(GMUI_groupActualY[_layerNumber,_menuNumber]);
    
    // Move to hidden position if set
    if ((_masterControl).T_hspeed_group > 0) {
        if (_animate) {
            GMUI_GroupTransitionToActual(_layerNumber, _menuNumber, 
                (_masterControl).T_hx_group, (_masterControl).T_hy_group, 
                (_masterControl).T_hscript_group, (_masterControl).T_hspeed_group);
        }
        else
            GMUI_GroupSetPositionActual(_layerNumber, _menuNumber, (_masterControl).T_px_group, (_masterControl).T_py_group);
    }
    
    // If there is an post-action, execute it
    if (script_exists((_GMUII).GMUI_groupAction[_layerNumber,_menuNumber])) {
        script_execute((_GMUII).GMUI_groupAction[_layerNumber,_menuNumber]);
    }
    
    (_masterControl).GroupHidden = true;
    
    //if ((GMUII()).GMUI_menuPrevious != 0) {
    //    if (!instance_exists())
    //        GMUI_ThrowErrorDetailed("Menu master control doesn't exist for menu " + string((GMUII()).GMUI_menuPrevious),_SCRIPT);
    //    else if (GMUI_layerNumberExists(((GMUII()).GMUI_groupMasterControl[_layerNumber,_menuNumber])).PreviousMenuLayer) {
    //        
    //    }
    //}
}


GMUI_GroupHide(_menuNumber, _layerNumber, !_show);


//
return true;

