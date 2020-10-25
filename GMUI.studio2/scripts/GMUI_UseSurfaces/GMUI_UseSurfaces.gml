///GMUI_UseSurfaces(boolean)
///Enable the use of surfaces for controls and drawing
function GMUI_UseSurfaces(argument0) {

var _opt;
_opt = argument0;

if (!is_real(_opt))
    _opt = true;

if (global.GMUIii > 0)
    UIEnableSurfaces = _opt;
else
    global.UIEnableSurfaces = _opt;
    
}

