#define GMUI_ShowPopupId
///GMUI_ShowPopupId(popup id, show[1] or hide[0], animate [bool])

// Arguments
var _SCRIPT, _GMUII, _animate, _show, _popupNumber, _masterControl;
_SCRIPT = GMUI_ShowPopupId;
_GMUII = GMUII();

if (!is_real(argument0)) {
    GMUI_ThrowErrorDetailed("Invalid popup id", _SCRIPT);
    return false;
}

_popupNumber = argument0;
_show = (argument1 > 0);
_animate = argument2;

if (string(_popupNumber) == "0")
    return false;



// Switch to menu layer or back
if (_show) {
    (_GMUII).GMUI_menuOpenCount += 1;
    GMUI_SwitchToMenu(_GMUII,_popupNumber);
}
else {
    _masterControl = (_GMUII).GMUI_groupMasterControl[GMUI_GetMenuLayer(_GMUII,_popupNumber),_popupNumber];
    GMUI_SwitchToLayer((_masterControl).PreviousMenuLayer);
    (_GMUII).GMUI_menuCurrent = (_masterControl).PreviousMenu;
    
    //if ((GMUII()).GMUI_menuPrevious != 0) {
    //    if (!instance_exists())
    //        GMUI_ThrowErrorDetailed("Menu master control doesn't exist for menu " + string((GMUII()).GMUI_menuPrevious),_SCRIPT);
    //    else if (GMUI_LayerExists(((GMUII()).GMUI_groupMasterControl[_Layer,_menuNumber])).PreviousMenuLayer) {
    //        
    //    }
    //}
}
    

//
if (_animate) {
// call action to show menu, 
}


GMUI_GroupHide(_popupNumber, GMUI_GetMenuLayer(_GMUII,_popupNumber), !_show);

//
return true;

