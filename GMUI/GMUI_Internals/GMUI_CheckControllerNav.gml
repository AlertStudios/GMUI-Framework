///GMUI_CheckControllerNav

function GMUI_CheckControllerNav() {

if (!GMUIEnableControllerNav)
    return -1;
else {

    // Check for any input, using the controller mappings
    var _i, _pov;
    
    for (_i = 1; _i <= GMUIGamepads; _i+=1) {
        
        if (!joystick_exists(_i))
            break;

        if (joystick_check_button(_i,GMUIGamepadButtons[_i,gmuigp_accept]))
            return gmuigp_accept;
        else if (joystick_check_button(_i,GMUIGamepadButtons[_i,gmuigp_cancel]))
            return gmuigp_cancel;
        else {
        
            _pov = joystick_pov(_i);
            
            if (_pov == 0)
                return gmuigp_up;
            else if (_pov == 90)
                return gmuigp_right;
            else if (_pov == 180)
                return gmuigp_down;
            else if (_pov == 270)
                return gmuigp_left;
        }
            
    }
    
    return -1;

}


}

