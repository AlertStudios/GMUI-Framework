///GMUI_ControlToggleUpdate(Control ID)
///Resets toggle timing for the animation
function GMUI_ControlToggleUpdate(argument0) {

with (argument0) {
    if (Toggle_t == Toggle_d)
        Toggle_t = 0;
    else
        Toggle_t = Toggle_d - Toggle_t;
}
}

