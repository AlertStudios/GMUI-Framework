///GMUI_ShowPopup("popup name", show[1] or hide[0], animate [bool])

// Arguments
var _SCRIPT,_popupName, _animate, _show, _popupNumber;
_SCRIPT = GMUI_ShowPopup;
_popupName = string(argument0);
_show = (argument1 > 0);
_animate = argument2;

// Get menu number
_popupNumber = ds_map_find_value((GMUII()).GMUI_popup_map,_popupName);

if (string(_popupNumber) == "0")
    return false;


return GMUI_ShowPopupId(_popupNumber,_show,_animate);

