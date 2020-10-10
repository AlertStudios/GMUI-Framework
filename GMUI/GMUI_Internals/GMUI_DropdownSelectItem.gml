///GMUI_DropdownSelectItem(item selected)
///Performs the selection of the dropdown when the user selects an option
function GMUI_DropdownSelectItem(argument0) {

// Adjust the parent control value

var _valType;
if (is_string(argument0))
    _valType = 0;
else if (frac(argument0) == 0)
    _valType = 1;
else
    _valType = 2;
    
GMUI_SetValue(ControlDropdownParent.valueName, argument0, _valType);
ControlDropdownParent.valueString = ItemListName[argument0];

// Hide the select list, disabling input

GMUI_ControlHide("DDSL|" + ControlDropdownParent.valueName,true);
}

