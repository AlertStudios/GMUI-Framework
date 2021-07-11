///GMUI_DropdownSelectItem(item selected)
///Performs the selection of the dropdown when the user selects an option
function GMUI_DropdownSelectItem(argument0) {

// Adjust the parent control value

var _valType,_ctrl;
if (is_string(argument0))
    _valType = 0;
else if (frac(argument0) == 0)
    _valType = 1;
else
    _valType = 2;
    
GMUI_SetValue(ControlDropdownParent.valueName, argument0, _valType);
ControlDropdownParent.valueString = ItemListName[argument0];

// Reset scrollbar

_ctrl = ds_map_find_value(GMUIP.GMUI_map,"DDSL|" + ControlDropdownParent.valueName);

if (string(_ctrl) == "0")
    return false;

_ctrl.Scrollbar_pos_y = _ctrl.Scrollbar_y + _ctrl.Scrollbar_padding;

// Hide the select list, disabling input

GMUI_ControlHide(_ctrl,true);
}

