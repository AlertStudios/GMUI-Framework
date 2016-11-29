///_Test_Form() This interface is for the demo

// DEMO INTERFACE:
var layer;
    // Create a control group if you would like: (layer number, group number (> 0), CellX, CellY, CellWide, CellHigh, anchor)
    
    layer = 0;
    // Right side group
    GMUI_CreateGroup(1,     20,3,   layer, global.GMUIAnchorTopRight);
    GMUI_GroupSetSize(1,    18,4,   layer);
    // Left side group
    GMUI_CreateGroup(2,     2,3,    layer, global.GMUIAnchorTopLeft);
    
    with (GMUI_Add("Test1","textstring",            1,0,    16,2,   layer, global.GMUIAnchorTopLeft)) {
        GMUI_ControlSetAttributes(20,0,0,0);
        GMUI_ControlSetInitValue("Select");
        GMUI_ControlAddToGroup(1);
    }
    
    with (GMUI_Add("Test2", "textint",              0,0,    10,2,   layer, global.GMUIAnchorTopLeft)) {
        GMUI_ControlSetAttributes(5,0,-1000,1000);
        GMUI_ControlSetStyle(hsv(120,120,120),rgb(20,20,20),-1,-1,-1,-1,-1,-1,-1,-1);
        GMUI_ControlAddToGroup(2);
    }
    
    with (GMUI_Add("Test3", "textdecimal",          0,3,    10,2,   layer, global.GMUIAnchorTopLeft)) {
        GMUI_ControlSetAttributes(10,10,-999,999);
        GMUI_ControlAddToGroup(2);
    }
    
    with (GMUI_Add("Test4", "intpicker",            0,6,   10,2,   layer, global.GMUIAnchorTopLeft)) {
        GMUI_ControlSetAttributes(0,0,-20,20);
        GMUI_ControlSetInitValue(-1);
        GMUI_ControlAddToGroup(2);
    }
    
    with (GMUI_Add("TestButton", "textbutton",      3,9,   5,3,    layer, global.GMUIAnchorTopLeft)) {
        GMUI_ControlSetButtonAction(_Test_Button);
        GMUI_ControlSetButton("Test!", -1, -1, -1, -1);
        GMUI_ControlSetStyle(-1, -1, c_red, 1, 0.85, -1, -1, -1, -1, -1);
        GMUI_ControlAddToGroup(2);
    }
    
    with (GMUI_Add("DebugButton", "textbutton",     1,3,    5,3,    layer, global.GMUIAnchorBottomLeft)) {
        GMUI_ControlSetButtonAction(_Debug_Button);
        GMUI_ControlSetButton("Debug", -1, -1, -1, -1);
        GMUI_ControlSetStyle(-1, -1, c_gray, 1, 0.85, -1, -1, -1, -1, -1);
    }
    
    with (GMUI_Add("DisableButton", "textbutton",      8,3,    5,3,    layer, global.GMUIAnchorBottomLeft)) {
        GMUI_ControlSetButtonAction(_Disable_Button);
        GMUI_ControlSetButton("Disable"+chr(13)+"Test",-1,-1,-1,-1);
    }
    
    with (GMUI_Add("HideButton", "textbutton",      15,3,    5,3,    layer, global.GMUIAnchorBottomLeft)) {
        GMUI_ControlSetButtonAction(_Hide_Button);
        GMUI_ControlSetButton("Hide"+chr(13)+"Group",-1,-1,-1,-1);
    }
    
    with (GMUI_Add("MoveButton", "textbutton",      22,3,    6,3,    layer, global.GMUIAnchorBottomLeft)) {
        GMUI_ControlSetButtonAction(_Move_Button);
        GMUI_ControlSetButton("Bump"+chr(13)+"Group",-1,-1,-1,-1);
    }
    
    with (GMUI_Add("ExitButton", "textbutton",      0,0,    1,1,     layer, global.GMUIAnchorTopRight)) {
        GMUI_ControlSetButtonAction(_Exit_Button);
        GMUI_ControlSetButton("x", -1, -1, -1, -1);
        // (Example:) Minor adjustment so that the control isnt cut off by the room
        GMUI_ControlSetPositioning(-1,0,0,0);
    }
