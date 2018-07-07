///GMUI_PopupSetMessage("popup name", "Message", # of Padding Cells, font [or -1], color [or -1])
///Creates a message label inside of the popup

var _G, _SCRIPT, _menuNumber, _Layer, _menuName, _message, _pad, _wcells, _hcells;
_G = GMUII();
_SCRIPT = GMUI_PopupSetMessage;
_menuName = string(argument0);
_message = string(argument1);
_pad = max(0,argument2);

// Get menu number and check its valid
_menuNumber = ds_map_find_value((_G).GMUI_popup_map,_menuName);

if (string(_menuNumber) == "0") {
    GMUI_ThrowErrorDetailed("Popup doesn't exist: " + _menuName,_SCRIPT);
    return false;
}

_Layer = GMUI_GetMenuLayer(_G,_menuNumber);

// Calculate location for label
_wcells = (_G).GMUI_groupCellsW[_Layer,_menuNumber] - _pad * 2;
_hcells = 2;

// Create label
with (GMUI_Add("GMUIPopupMessage" + string(_menuNumber), "label", _pad, _pad, _wcells, _hcells, global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetText(_message);
    GMUI_ControlSetFontStyle(argument3,argument4,fa_left);
    GMUI_ControlAddToPopup(_menuName);
}

return true;

