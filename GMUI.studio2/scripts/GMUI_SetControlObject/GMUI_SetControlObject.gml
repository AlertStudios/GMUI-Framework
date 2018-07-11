///GMUI_SetControlObject(object of which controls are created with)

var _ctrl;
_ctrl = argument0;

// Set controlobject if it exists
if (!object_exists(_ctrl)) {
    GMUI_ThrowErrorDetailed("Control object provided does not exist", GMUI_SetControlObject);
    if (global.GMUIii > 0)
        GMUI_controlobject = -1;
    else
        global.GMUI_controlobject = -1;
}
else if (global.GMUIii > 0)
    GMUI_controlobject = _ctrl;
else
    global.GMUI_controlobject = _ctrl;

