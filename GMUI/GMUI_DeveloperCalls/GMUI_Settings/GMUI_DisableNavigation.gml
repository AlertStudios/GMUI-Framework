///GMUI_DisableNavigation()
///Disable the ability to tab or navigate controls

var _set;

if (global.GMUIii > 0)
    _set = id;
else
    _set = global;

(_set).GMUIEnableTabbing = false;

