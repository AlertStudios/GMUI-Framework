
var MyButton;
MyButton = GMUI_GetControl("SwipeButton");

if (!global.Swiped) {
    GMUI_LayerTransitionToXY(0, 420, 0, easeExpOut, room_speed);
    global.Swiped = true;
    with (MyButton) GMUI_ControlSetButton("Swipe"+chr(13)+"Back",-1,-1,-1);
}
else {
    GMUI_LayerTransitionToXY(0, 0, 0, easeExpOut, room_speed);
    global.Swiped = false;
    with (MyButton) GMUI_ControlSetButton("Swipe"+chr(13)+"Out",-1,-1,-1);
}
