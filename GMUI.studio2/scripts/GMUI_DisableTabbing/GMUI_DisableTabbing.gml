///GMUI_DisableTabbing()
///Disable the ability to tab to the next control
function GMUI_DisableTabbing() {
var _set;

if (global.GMUIii > 0)
    GMUIEnableTabbing = false;
else
    global.GMUIEnableTabbing = false;
}

