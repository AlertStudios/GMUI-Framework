///GMUI_DisableNavigation()
///Disable the ability to tab or navigate controls
function GMUI_DisableNavigation() {

if (global.GMUIii > 0) {

    GMUIEnableMouseNav = false;
    GMUIEnableControllerNav = false;
}
else {

    global.GMUIEnableMouseNav = false;
    global.GMUIEnableControllerNav = false;
}
    
}

