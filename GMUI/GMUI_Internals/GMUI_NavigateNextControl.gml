///GMUI_NavigateNextControl(check for next control [true] or previous [false])
///Check for the keys to change control selection

if (keyboard_check_pressed(vk_anykey)) {
    // Next control
    if (argument0 >= 1) {
        if (GMUI_enableTab) {
            if (keyboard_check_pressed(vk_tab))
                return true;
        }
        
        if (GMUI_forwardKey != -1) {
            if (keyboard_check_pressed(GMUI_forwardKey))
                return true;
            if (GMUI_forwardAltKey != -1) {
                if (keyboard_check_pressed(GMUI_forwardAltKey))
                    return true;
            }
        }
    }
    else {
    // Previous control
        if (GMUI_backKey != -1) {
            if (keyboard_check_pressed(GMUI_backKey))
                return true;
            if (GMUI_backAltKey != -1) {
                if (keyboard_check_pressed(GMUI_backAltKey))
                    return true;
            }
        }
    }
}

return false;

