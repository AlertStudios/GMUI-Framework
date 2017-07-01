///_Test_Form() This interface is for the demo

// DEMO INTERFACE:

var layer;
// Set optional grid settings
GMUI_GridSetNavigation(global.GMUIDirectionTypeVertical,vk_up,vk_down,vk_left,vk_right,true);

// Create a control group if you would like: (layer number, group number (> 0), CellX, CellY, CellWide, CellHigh, anchor)
/*

    1. Create your layers and groups for the controls
    
*/

layer = 0;
// Right side group
GMUI_CreateGroup(layer, 1,      20,3,   global.GMUIAnchorTopRight);
GMUI_GroupSetSize(layer, 1,     18,4);
//GMUI_GroupSetSpriteMap(layer, 1, s2,s3,s4,s5,s6,s7,s8,s1,s9,false);
// Left side group
GMUI_CreateGroup(layer, 2,      2,3,    global.GMUIAnchorTopLeft);
//This must be called after the controls are made: GMUI_GroupSetFadeOnHide(layer, 2, room_speed/4);
// Object click group test
GMUI_AddLayer(1,0,0);
GMUI_CreateGroup(1, 3,          0,0,    global.GMUIAnchorTopLeft);

/*

    2. Create the controls 

*/

with (GMUI_Add("Test1","textstring",            1,0,    16,2,   layer, global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetAttributes(20,0,0,0);
    GMUI_ControlSetInitValue("Select");
    GMUI_ControlAddToGroup(1);
    GMUI_ControlSetSprite(GMUIspr_input,0,1,0);
}

with (GMUI_Add("Test2", "textint",              0,0,    10,2,   layer, global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetAttributes(5,0,-1000,1000);
    GMUI_ControlSetStyle(hsv(120,120,120),rgb(20,20,20),-1,-1,-1,-1,-1,-1,-1,-1);
    GMUI_ControlAddToGroup(2);
}

with (GMUI_Add("Test3", "textdecimal",          0,3,    10,2,   layer, global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetAttributes(10,10,-999,999);
    GMUI_ControlAddToGroup(2);
    //GMUI_ControlSetSpriteMap(s2,s3,s4,s5,s6,s7,s8,s1,s9,false);
}

with (GMUI_Add("Test4", "intpicker",            0,6,    10,2,   layer, global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetAttributes(0,0,-20,20);
    GMUI_ControlSetInitValue(-1);
    GMUI_ControlAddToGroup(2);
    GMUI_ControlSetHoverAction(_Hover_Int);
    GMUI_ControlSetHoverOffAction(_HoverOff_Int);
    
    with (GMUI_ControlAddTooltip("-20 to 20.",global.GMUIAnchorLeft,6,2,12,4,-1,-1)) {
        GMUI_ControlSetFadeOnHide(id, room_speed/4);
    }
}

with (GMUI_Add("TestButton", "textbutton",      3,9,    5,3,    layer, global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetButtonAction(_Test_Button);
    GMUI_ControlSetButton("Test!", -1, -1, -1);
    GMUI_ControlSetStyle(-1, -1, c_red, 1, 0.85, -1, -1, -1, -1, -1);
    GMUI_ControlAddToGroup(2);
}

with (GMUI_Add("PopupMenuButton", "textbutton",     1,7,    5,3,    layer, global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetButtonAction(_PopupMenu_Button);
    GMUI_ControlSetButton("Show"+chr(13)+"Menu", -1, -1, -1);
    GMUI_ControlSetStyle(-1, -1, c_purple, 1, 0.85, -1, -1, -1, -1, -1);
}

with (GMUI_Add("DebugButton", "textbutton",     1,3,    5,3,    layer, global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetButtonAction(_Debug_Button);
    GMUI_ControlSetButton("Debug", -1, -1, -1);
    GMUI_ControlSetStyle(-1, -1, c_gray, 1, 0.85, -1, -1, -1, -1, -1);
}

with (GMUI_Add("DisableButton", "textbutton",   8,3,    5,3,    layer, global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetButtonAction(_Disable_Button);
    GMUI_ControlSetButton("Disable"+chr(13)+"Test",-1,-1,-1);
}

with (GMUI_Add("HideButton", "textbutton",      15,3,   5,3,    layer, global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetButtonAction(_Hide_Button);
    GMUI_ControlSetButton("Hide"+chr(13)+"Group",-1,-1,-1);
}

with (GMUI_Add("MoveButton", "textbutton",      22,3,   6,3,    layer, global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetButtonAction(_Move_Button);
    GMUI_ControlSetButton("Move"+chr(13)+"Group",-1,-1,-1);
}

with (GMUI_Add("EnlargeButton", "textbutton",   30,3,   6,3,    layer, global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetButtonAction(_Enlarge_Button);
    GMUI_ControlSetButton("Enlarge"+chr(13)+"Window",-1,-1,-1);
}

with (GMUI_Add("MoveButton2", "button",         18,0,   2,2,    layer, global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetButtonAction(_Move_Button);
    GMUI_ControlSetButton("", GMUIspr_move, -1, -1);
    GMUI_ControlAddToGroup(1);
}

with (GMUI_Add("SwitchButton", "button",        -2,16,  4,2,    layer, global.GMUIAnchorTop)) {
    GMUI_ControlSetButtonAction(_Switch_Button);
    GMUI_ControlSetSprite(GMUIspr_switch,0,1,0);
}

with (GMUI_Add("ExitButton", "textbutton",      0,0,    1,1,     layer, global.GMUIAnchorTopRight)) {
    GMUI_ControlSetButtonAction(_Exit_Button);
    GMUI_ControlSetButton("x", -1, -1, -1);
    // (Example:) Minor adjustment so that the control isnt cut off by the room
    GMUI_ControlSetPositioning(-1,0,0,0);
}

with (GMUI_Add("MenuInt", "intpicker",          0,0,    3,2,    1, global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetAttributes(0,0,0,9);
    GMUI_ControlSetInitValue(0);
    GMUI_ControlAddToGroup(3);
    GMUI_GroupHide(3,1,true);
}
with (GMUI_Add("MenuIntInstructions", "label",  20,21,  12,2,   layer, global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetInitValue("Click square to open sub menu");
}

// Test Menu (Menu ID variable isn't used here... but could be if you want to)
var menuID;
menuID = GMUI_CreateMenu("Test Menu",   -9,2,   18,24,   global.GMUIAnchorTop);
GMUI_MenuSetClickOff("Test Menu", true);

with (GMUI_Add("CloseButton", "textbutton",   4,1,   4,1,    layer, global.GMUIAnchorTopRight)) {
    GMUI_ControlSetButtonAction(_PopupClose_Button);
    GMUI_ControlSetButton("Close",-1,-1,-1);
    GMUI_ControlAddToMenu("Test Menu");
}

with (GMUI_Add("OpenButton", "textbutton",   -3,8,   8,1,    layer, global.GMUIAnchorTop)) {
    GMUI_ControlSetButtonAction(_PopupMenu2_Button);
    GMUI_ControlSetButton("Open Another",-1,-1,-1);
    GMUI_ControlAddToMenu("Test Menu");
}

// Test Menu 2
menuID = GMUI_CreateMenu("Test Menu 2",   -6,8,   18,24,   global.GMUIAnchorTop);
GMUI_MenuSetClickOff("Test Menu 2", true);

with (GMUI_Add("CloseButton2", "textbutton",   4,1,   4,1,    layer, global.GMUIAnchorTopRight)) {
    GMUI_ControlSetButtonAction(_PopupClose_Button);
    GMUI_ControlSetButton("Close",-1,-1,-1);
    GMUI_ControlAddToMenu("Test Menu 2");
}

with (GMUI_Add("PopupTestButton","textbutton",  -3,8,   8,1,    layer, global.GMUIAnchorTop)) {
    GMUI_ControlSetButtonAction(_Popup_Button);
    GMUI_ControlSetButton("Try Popup",-1,-1,-1);
    GMUI_ControlAddToMenu("Test Menu 2");
}

// Test Popup
menuID = GMUI_CreatePopup("Test Popup",  -10,2,   20,8,   global.GMUIAnchorTop);
//GMUI_PopupSetClickOff("Test Popup", false);

//todo: change this to be done with popup scripts instead
with (GMUI_Add("CloseButton3", "textbutton",   4,1,   4,1,    layer, global.GMUIAnchorTopRight)) {
    GMUI_ControlSetButtonAction(_PopupClose_Button);
    GMUI_ControlSetButton("Close",-1,-1,-1);
    GMUI_ControlAddToPopup("Test Popup");
}

/*

    3. Set group and menu settings after controls are set

*/

// Call actions dependent on existing controls:
// GROUP STYLES
GMUI_GroupSetFadeOnHide(layer, 2, room_speed/4, 0);

// MENU STYLES
GMUI_MenuSetStyle("Test Menu", c_black, 0.25, c_white, 0.75, true);
GMUI_MenuSetFadeOnHide("Test Menu", room_speed/4, 0);
//GMUI_MenuSetActionIn("Test Menu",...)
GMUI_MenuSetStyle("Test Menu 2", c_black, 0.25, c_white, 0.75, true);
GMUI_MenuSetFadeOnHide("Test Menu 2", room_speed/4, 0);

// POPUP STYLES
GMUI_PopupSetStyle("Test Popup", c_white, 0.99, c_white, 0.75, true);// needs popup version
GMUI_PopupSetFadeOnHide("Test Popup", room_speed/8, 0);// needs popup version
//todo: change the popup style


