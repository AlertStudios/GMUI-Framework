#define _Move_Button
var MyButton,MyButtonText;

MyButton = GMUI_GetControl("MoveButton");

if (MyButton >= 0)
    MyButtonText = MyButton.ControlButtonText;
    
if (MyButtonText == "Move"+chr(13)+"Group") {
    with (MyButton) GMUI_ControlSetButton("Return"+chr(13)+"Group",-1,-1,-1,-1);
    // Object is handling the group position here
    testmoving.moving = 1;
}
else {
    with (MyButton) GMUI_ControlSetButton("Move"+chr(13)+"Group",-1,-1,-1,-1);
    testmoving.moving = 0;
    // Return the group to where it was
    GMUI_GroupSetPosition(0,1,20,3,0,0);
}

