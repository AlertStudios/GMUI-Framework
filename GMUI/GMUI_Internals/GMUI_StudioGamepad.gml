///GMUI_StudioGamepad()
///Set the default variables for gamepad inputs, overriding with studio constants if using studio
function GMUI_StudioGamepad() {

gmuigp_up_pressed = false;
gmuigp_up = 0;
gmuigp_down_pressed = false;
gmuigp_down = 180;
gmuigp_right_pressed = false;
gmuigp_right = 90;
gmuigp_left_pressed = false;
gmuigp_left = 270;
gmuigp_nodirection = -1;

gmuigp_accept_pressed = false;
gmuigp_accept = 4; // A
gmuigp_cancel_pressed = false;
gmuigp_cancel = 2; // B





gmuigp_up = gp_padu;
gmuigp_down = gp_padd;
gmuigp_right = gp_padr;
gmuigp_left = gp_padl;

gmuigp_accept = gp_face4;
gmuigp_cancel = gp_face2;




}


/// Compatibility functions

function joystick_check_button(controller, button) {

    return gamepad_button_check(controller, button);
    
}

function joystick_pov(controller) {

    if (gamepad_button_check(controller, gmuigp_up))
        return 0;
    else if (gamepad_button_check(controller, gmuigp_right))
        return 90;
    else if (gamepad_button_check(controller, gmuigp_down))
        return 180;
    else if (gamepad_button_check(controller, gmuigp_left))
        return 270;
    else
        	return -1;

}



