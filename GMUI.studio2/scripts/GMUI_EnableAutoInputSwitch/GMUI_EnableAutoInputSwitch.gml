///GMUI_EnableAutoInputSwitch()
///Disable the ability to tab or navigate controls
function GMUI_EnableAutoInputSwitch() {

if (global.GMUIii > 0) {

    GMUIEnableAutoControllerSwitch = true;
}
else {

    global.GMUIEnableAutoControllerSwitch = true;
}

}

