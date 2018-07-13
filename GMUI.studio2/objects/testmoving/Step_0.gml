/// @description Insert description here
// You can write your code in this editor
// Test: Move the view
if (keyboard_check(vk_left)) {
    if (view_xview[0] > 0)
        view_xview[0] -= 2;
    else
        view_xview[0] = 0;
}
else if (keyboard_check(vk_right)) {
    if (view_xview[0] + view_wview[0] < room_width)
        view_xview[0] += 2;
    else
        view_xview[0] = room_width - view_wview[0];
}

if (keyboard_check(vk_up)) {
    if (view_yview[0] > 0)
        view_yview[0] -= 2;
    else
        view_yview[0] = 0;
}
else if (keyboard_check(vk_down)) {
    if (view_yview[0] + view_hview[0] < room_height)
        view_yview[0] += 2;
    else
        view_yview[0] = room_height - view_hview[0];
}


// Test: Move the group

if (moving) {
    with (GMUIid(1)) {
        GMUI_GroupSetPositionActual(0,1,mouse_x,mouse_y);
    }
}

// Test: Transition the group

if (mouse_check_button_pressed(mb_right)) {
    if (GMUIid(1)) {
        //GMUI_ControlTransitionToCell("MoveButton2", GMUI_GridGetMouseCellX(GMUII(),mouse_x), GMUI_GridGetMouseCellY(GMUII(),mouse_y), easeElasticOut, 30);
        GMUI_GroupTransitionToCell(0, 1, GMUI_GridGetMouseCellX(GMUII()), GMUI_GridGetMouseCellY(GMUII()), easeElasticOut , 30);
        //GMUI_GroupTransitionToActual(0, 1, mouse_x, mouse_y, easeElasticOut, 30);
    }
}