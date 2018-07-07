
var MyButton;
MyButton = GMUI_GetControl("SwipeButton");

if (!global.Swiped) {
    GMUI_LayerTransitionToXY(0, 320, 20, .1, easeExpOut, room_speed);
    global.Swiped = true;
    with (MyButton) GMUI_ControlSetButton("Swipe"+chr(13)+"Back",-1,-1,-1);
}
else {
    GMUI_LayerTransitionToXY(0, 0, 0, 1, easeExpOut, room_speed);
    global.Swiped = false;
    with (MyButton) GMUI_ControlSetButton("Swipe"+chr(13)+"Out",-1,-1,-1);
}

