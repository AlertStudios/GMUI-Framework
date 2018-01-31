#define GMUI_PopupSetFadeOnHide
///GMUI_PopupSetFadeOnHide("Popup Name", Speed in steps, Fade Mode [0: alpha-sequential, 1: all-together])
///Set the fade in/out when the menu is hidden or not
///Fade Mode: 0 = fade dimmest last, 1 = fade all together

// Arguments
var SCRIPT,_MenuName,_MenuNumber,_Speed,_FadeMode;
SCRIPT = GMUI_PopupSetFadeOnHide;
_MenuName = argument0;
_Speed = max(0,argument1);
_FadeMode = argument2;

// Get menu number and check its valid
_MenuNumber = ds_map_find_value((GMUII()).GMUI_popup_map,_MenuName);

if (string(_MenuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Popup doesn't exist: " + _MenuName,SCRIPT);
    return false;
}

// Set style with the menu, temporary change to setting layer
_prevLayer = UIAddToLayer;
UIAddToLayer = GMUI_GetMenuLayer(GMUII(),_MenuNumber);

_result = GMUI_GroupSetFadeOnHide(_MenuNumber,_Speed,_FadeMode);

UIAddToLayer = _prevLayer;
return _result;

