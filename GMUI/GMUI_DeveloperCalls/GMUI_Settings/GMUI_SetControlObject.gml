///GMUI_SetControlObject(object of which controls are created with)

var _ctrl, _set;
_ctrl = argument0;



if (global.GMUIii > 0)
    _set = id;
else
    _set = global;

// Set controlobject if it exists
if (!object_exists(_ctrl)) {
    GMUI_ThrowErrorDetailed("Control object provided does not exist", GMUI_SetControlObject);
    (_set).GMUI_controlobject = -1;
}
else
    (_set).GMUI_controlobject = _ctrl;

