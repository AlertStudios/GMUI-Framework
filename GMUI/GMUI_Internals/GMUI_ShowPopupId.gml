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


// Call the show menu to handle the layer switch
GMUI_ShowMenuId(_popupNumber, _show, _animate);


