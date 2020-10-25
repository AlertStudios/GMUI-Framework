///GMUI_SetViewSnap(enable adjusting to view [bool], view # to bind to)
function GMUI_SetViewSnap(argument0, argument1) {

var _enable, _view;
_enable = argument0;
_view = argument1;

if (is_real(_enable))
    _enable = (_enable > 0);
else
    _enable = true;
    
if (!is_real(_view))
    _view = 0;

if (global.GMUIii > 0) {
    UIsnaptoview = _enable;
    UIgridview = _view;
}
else {
    global.UIsnaptoview = _enable;
    global.UIgridview = _view;
}

}

