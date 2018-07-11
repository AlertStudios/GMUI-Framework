///GMUI_SetViewSnap(enable adjusting to view [bool], view # to bind to)

var _enable, _view, _set;
_enable = argument0;
_view = argument1;

if (is_real(_enable))
    _enable = (_enable > 0);
else
    _enable = true;
    
if (!is_real(_view))
    _view = 0;

if (global.GMUIii > 0)
    _set = id;
else
    _set = global;

(_set).UIsnaptoview = _enable;
(_set).UIgridview = _view;

