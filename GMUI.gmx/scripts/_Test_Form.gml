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
    //sprite_set_offset(GMUIspr_arrow,10,12);sprite_set_offset(GMUIspr_arrowup,10,0); // If vertical, offset should be centered
    //GMUI_ControlSetPicker(sprite_get_width(GMUIspr_arrowup) + 4,sprite_get_height(GMUIspr_arrowup) + 4,
    //    global.GMUIDirectionTypeVertical, GMUIspr_arrowup, GMUIspr_arrow);
        
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
var menuID; //-9,2 
menuID = GMUI_CreateMenu("Test Menu",   GMUI_CenterX(layer, 18, global.GMUIAnchorTop) ,2,   18,24,   global.GMUIAnchorTop);
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
//global.GMUIPopupBlank = -1;global.GMUIPopupInformation = 0;global.GMUIPopupConfirm = 1;global.GMUIPopupThreeOptions = 2;
menuID = GMUI_CreatePopup("Test Popup",  -14,2,   28,12,   global.GMUIAnchorTop, global.GMUIPopupThreeOptions);
GMUI_PopupSetMessage("Test Popup", "Click an option to return to the previous screen!", 2, -1, -1);
GMUI_PopupSetAction("Test Popup", _PopupReturnAction);

// Options to change default controls and actions:
// GMUI_PopupSetButton("Test Popup", which button, Text or "", graphic or -1, text align, text color on hover)

// Additional Options:
//with (GMUI_Add("Button", "textbutton", 20,3, 4,2, 0, global.GMUIAnchorBottomRight)) {
//GMUI_ControlAddToPopup("Test Popup");}
//GMUI_PopupSetClickOff("Test Popup", false); // False is default



// Test slider
with (GMUI_Add("Slider", "slider",              16,12,  10,2,   layer, global.GMUIAnchorBottomRight)) {
    GMUI_ControlSetSliderSettings(13,10,34,true,true,true,global.GMUIDirectionTypeHorizontal);
    GMUI_ControlSetSliderStyle(2,2,c_dkgray,0.6,c_teal,0.9,c_dkgray,0.4,c_aqua,1,c_gray,0.8);
    GMUI_ControlSetSliderSize(16, 20, 1, 12, 10, 8, 6, 8);
    
    GMUI_ControlSetValueChangedAction(_SliderValue_Changed);
}
// Button to set slider to mid point
with (GMUI_Add("MidSlider", "button",           19,12,  2,2,    layer, global.GMUIAnchorBottomRight)) {
    GMUI_ControlSetButtonAction(_SliderMid_Button);
    GMUI_ControlSetButton("Mid",-1,-1,-1);
    GMUI_ControlSetPositioning(0,6,0,20);
}
// Button to set slider to snap or not
with (GMUI_Add("SnapSlider", "button",           23,12,  3,2,    layer, global.GMUIAnchorBottomRight)) {
    GMUI_ControlSetButtonAction(_SliderSnap_Button);
    GMUI_ControlSetButton("Snap",-1,-1,-1);
    GMUI_ControlSetPositioning(0,6,0,20);
}

// Display of slider value
with (GMUI_Add("SliderVal", "label",            5,12,   2,2,    layer, global.GMUIAnchorBottomRight)) {
    GMUI_ControlSetText(string(round(GMUI_GetValue("MidSlider"))));
}


// Test checkbox and toggle
with (GMUI_Add("CheckBox", "checkbox",          4,12,   1,1,    layer, global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetCheckboxSettings(1, c_lime, c_gray, global.GMUISlideRoundRect, $808080, $505050, room_speed/4);
    GMUI_ControlSetHoverAction(_Hover_Checkbox);
    GMUI_ControlSetHoverOffAction(_HoverOff_Checkbox);
    
    // Add a space at the end of the string to make sure it wraps. I know... but its Game Maker ;)
    with (GMUI_ControlAddTooltip("Checkbox!",global.GMUIAnchorBottom,6,2,12,4,-1,-1)) {
        GMUI_ControlSetFadeOnHide(id, room_speed/6);
    }
}

with (GMUI_Add("Toggle", "toggle",          3,10,   3,2,    layer, global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetToggleSettings(1, c_lime, c_gray, global.GMUISlideFullRoundRect, $808080, $505050, room_speed/4, global.GMUIDirectionTypeHorizontal, 0);
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
GMUI_MenuSetHidePosition("Test Menu", -9, 6, easeExpOut, room_speed/2);
//GMUI_MenuSetActionIn("Test Menu",...)
GMUI_MenuSetStyle("Test Menu 2", c_black, 0.25, c_white, 0.75, true);
GMUI_MenuSetFadeOnHide("Test Menu 2", room_speed/4, 0);

// POPUP STYLES
GMUI_PopupSetStyle("Test Popup", c_white, 0.99, c_white, 0.75, true);// needs popup version
GMUI_PopupSetFadeOnHide("Test Popup", room_speed/8, 0);// needs popup version
GMUI_PopupSetHidePosition("Test Popup", -14, 0, easeExpOut, room_speed/4);
//todo: change the popup style


