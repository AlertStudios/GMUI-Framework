/// Specify the actions performed when a control is clicked, if it has an action ability
// GMUI_Actions("control name")
// Controls with actions: button, textbutton, 

switch (argument0)
{
    case "ControlName1":
        // Put actions here
    
    break;
    
    case "DebugButton":
        // Show/hide debug for the first interface
        if ((GMUIid(1)).DebugData)
            (GMUIid(1)).DebugData = false;
        else
            (GMUIid(1)).DebugData = true;
    
    break;
    
    case "TestButton":
        // Get all the values and display them:
        var t1,t2,t3,t4;
        t1 = GMUI_GetValueString("Test1");
        t2 = GMUI_GetValueString("Test2");
        t3 = GMUI_GetValueString("Test3");
        t4 = GMUI_GetValueString("Test4");
        show_message("Result:
        " + t1 + "
        " + t2 + "
        " + t3 + "
        " + t4);
    break;
    
    case "DisableButton":
        GMUI_ControlDisable("TestButton",1-GMUI_ControlIsDisabled("TestButton"));
    break;
    
    case "HideButton":
        GMUI_GroupHide(2, 0, 1-GMUI_ControlIsHidden("TestButton"));
    break;
    
    case "MoveButton":
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
    break;
    
    
    case "ExitButton":
        game_end();
    break;
}
