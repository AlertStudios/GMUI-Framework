var MyButton,MyButtonText;

MyButton = GMUI_GetControl("MoveButton");

if (MyButton >= 0)
    MyButtonText = MyButton.ControlButtonText;
    
if (MyButtonText == "Bump"+chr(13)+"Group") {
    with (MyButton) GMUI_ControlSetButton("Return"+chr(13)+"Group",-1,-1,-1,-1);
    GMUI_GroupSetPosition(0,1,20,8,0,0);
}
else {
    with (MyButton) GMUI_ControlSetButton("Bump"+chr(13)+"Group",-1,-1,-1,-1);
    GMUI_GroupSetPosition(0,1,20,3,0,0);
}
