///GMUI_NavigateNextControl(check for next control [true] or previous [false])
///Check for the keys or controller to change control selection
function GMUI_NavigateNextControl(argument0) {

if (GMUIGamepadMode) {
    
    var _button;
    
    _button = GMUI_CheckControllerNav();
    
    if (_button > -1 && GMUI_navigateDirection > global.GMUIDirectionTypeNone) {
    
        if (GMUI_navigateDirection > global.GMUIDirectionTypeHorizontal) {
        
            if (argument0 && _button == gmuigp_down)
                return true;
            else if (!argument0 && _button == gmuigp_up)
                return true;
        }
        else {
            
            if (argument0 && _button == gmuigp_right)
                return true;
            else if (!argument0 && _button == gmuigp_left)
                return true;
        }
    }

}
else if (keyboard_check_pressed(vk_anykey)) {
    
    if (argument0) {
        // Next control
        if (GMUIEnableTabbing) {
            if (keyboard_check_pressed(GMUI_tabbingKey))
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
}

