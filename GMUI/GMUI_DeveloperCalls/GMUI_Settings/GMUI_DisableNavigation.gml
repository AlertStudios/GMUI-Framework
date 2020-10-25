///GMUI_DisableNavigation()
///Disable the ability to tab or navigate controls
function GMUI_DisableNavigation() {
var _set;

if (global.GMUIii > 0)
    GMUIEnableTabbing = false;
else
    global.GMUIEnableTabbing = false;
}

