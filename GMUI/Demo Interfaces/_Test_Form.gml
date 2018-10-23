///_Test_Form() This interface is for the testing form

// TESTING

// Set optional grid settings
GMUI_SetKeyNavigation(global.GMUIDirectionTypeVertical,vk_up,vk_down,vk_left,vk_right,true);

/*

    1. Create any groups and objects you like for each layer, defaulting to layer 0
    Note:   Controls have unique names across layers, 
            whereas group numbers are specific to the layer.
    
*/

// Set the layer to change settings on [This one is optional: Already defaults to layer 0]
GMUI_SetOnLayer(0);

// Right side group
GMUI_CreateGroup(1,      20,3,   global.GMUIAnchorTopRight);
GMUI_GroupSetSize(1,     20,4);
GMUI_GroupSetStyle(1, c_black, .2, c_black, .3, 0);
GMUI_GroupSetFadeOnHide(1, room_speed, 0);
//GMUI_GroupSetOverflow(1, global.GMUIOverflowScroll, -1);
//GMUI_GroupHideOverflow(global.GMUIOverflowScroll);
//GMUI_GroupStretchToGrid(1,true);

//GMUI_GroupSetSpriteMap(1, s2,s3,s4,s5,s6,s7,s8,s1,s9,false);

// Left side group
GMUI_CreateGroup(2,      2,3,    global.GMUIAnchorTopLeft);
GMUI_GroupSetFadeOnHide(2, room_speed, 0);

/*

    2. Create the controls, defaulting to layer 0 or the last layer created
    NOTE:   To switch layers, use GMUI_SwitchToLayer(#);

*/

/*with (GMUI_Add("test15","textstring",2,1,6,6,global.GMUIAnchorTop)) {
    GMUI_ControlSetAttributes(14,0,0,0);
    GMUI_ControlStretchToGrid(true);
}*/

with (GMUI_Add("Test1","textstring",            1,0,    16,2,   global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetAttributes(20,0,0,0);
    GMUI_ControlSetInitValue("Select");
    GMUI_ControlAddToGroup(1);
    GMUI_ControlSetSprite(sprite24,0,1,0);//GMUIspr_input
}
with (GMUI_Add("Toggle3", "toggle",              3,3,   3,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetToggleSettings(1, c_lime, c_gray, global.GMUISlideFullRoundRect, $808080, $505050, room_speed/4, global.GMUIDirectionTypeHorizontal, 0);
    GMUI_ControlAddToGroup(1);
}
/*
with (GMUI_Add("Test12","textstring", 1,4, 12,2, global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetAttributes(14,0,0,0);
    GMUI_ControlSetInitValue("test");
    GMUI_ControlAddToGroup(1);
}*/

/*
with (GMUI_Add("test13","textstring",10,1,12,2,global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetAttributes(14,0,0,0);
}
*/

with (GMUI_Add("Test2", "textint",              0,0,    10,2,   global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetAttributes(5,0,-1000,1000);
    GMUI_ControlSetStyle(hsv(85,55,255),rgb(20,20,20),-1,-1,-1,-1,-1,-1,-1,-1);
    GMUI_ControlAddToGroup(2);
}
/*
with (GMUI_Add("test14","textstring",20,1,12,2,global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetAttributes(14,0,0,0);
}
*/
with (GMUI_Add("Test3", "textdecimal",          0,3,    10,2,   global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetAttributes(10,10,-999,999);
    GMUI_ControlAddToGroup(2);
    //GMUI_ControlSetSpriteMap(s2,s3,s4,s5,s6,s7,s8,s1,s9,false);
}

with (GMUI_Add("Test4", "intpicker",            0,6,    10,2,   global.GMUIAnchorTopLeft)) {
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

with (GMUI_Add("TestButton", "textbutton",      3,9,    5,3,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetButtonAction(_Test_Button);
    GMUI_ControlSetButton("Test!", -1, -1, -1);
    GMUI_ControlSetStyle(-1, -1, c_red, 1, 0.85, -1, -1, -1, -1, -1);
    GMUI_ControlAddToGroup(2);
}

// SELECT LIST TEST
with (GMUI_Add("TestSelectList", "selectlist",            8,16,    10,5,   global.GMUIAnchorTopLeft)) {
    GMUI_ItemListSettings(26, $E3E3E3, -1, -1);
    GMUI_ItemListBackground($DEDEDE, $EAEAEA, 0.8, 1);
    GMUI_ItemListSelectAction(_ListAction);
    GMUI_AddItem(2,10,"2-One","",-1);
    GMUI_AddItem(4,20,"4-Two","",-1);
    GMUI_AddItem(6,30,"6-Three","",-1);
    GMUI_AddItem(8,40,"8-Four","",-1);
    GMUI_AddItem(10,50,"10-Five","",-1);
    GMUI_AddItem(12,60,"12-Six","",-1);
    GMUI_AddItem(14,70,"14-Seven","",-1);
    GMUI_AddItem(16,70,"16-Eight","",-1);
    GMUI_AddItem(18,70,"18-Nine","",-1);
    GMUI_AddItem(20,70,"20-Ten","",-1);
    GMUI_AddItem(22,70,"22-Eleven","",-1);
    GMUI_AddItem(24,70,"24-Twelve","",-1);
    GMUI_AddItem(26,80,"26-Thirteen","",-1);
}


with (GMUI_Add("PopupMenuButton", "textbutton",     1,7,    5,3,    global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetButtonAction(_PopupMenu_Button);
    GMUI_ControlSetButton("Show"+chr(13)+"Menu", -1, -1, -1);
    GMUI_ControlSetStyle(-1, -1, c_purple, 1, 0.85, -1, -1, -1, -1, -1);
}

with (GMUI_Add("DebugButton", "textbutton",     1,3,    5,3,    global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetButtonAction(_Debug_Button);
    GMUI_ControlSetButton("Debug", -1, -1, -1);
    GMUI_ControlSetStyle(-1, -1, c_gray, 1, 0.85, -1, -1, -1, -1, -1);
}

with (GMUI_Add("SwipeButton", "textbutton",      8,7,   5,3,    global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetButtonAction(_Swipe_Button);
    GMUI_ControlSetButton("Swipe"+chr(13)+"Out",-1,-1,-1);
}

with (GMUI_Add("DisableButton", "textbutton",   8,3,    5,3,    global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetButtonAction(_Disable_Button);
    GMUI_ControlSetButton("Disable"+chr(13)+"Test",-1,-1,-1);
}

with (GMUI_Add("HideButton2", "textbutton",      15,7,   5,3,    global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetButtonAction(_Hide_Button2);
    GMUI_ControlSetButton("Hide"+chr(13)+"Group 2",-1,-1,-1);
}

with (GMUI_Add("HideButton", "textbutton",      15,3,   5,3,    global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetButtonAction(_Hide_Button);
    GMUI_ControlSetButton("Hide"+chr(13)+"Group 1",-1,-1,-1);
}

with (GMUI_Add("MoveButton", "textbutton",      22,3,   6,3,    global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetButtonAction(_Move_Button);
    GMUI_ControlSetButton("Move"+chr(13)+"Group",-1,-1,-1);
}

with (GMUI_Add("EnlargeButton", "textbutton",   30,3,   6,3,    global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetButtonAction(_Enlarge_Button);
    GMUI_ControlSetButton("Enlarge"+chr(13)+"Window",-1,-1,-1);
}

with (GMUI_Add("MoveButton2", "button",         18,0,   2,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetButtonAction(_Move_Button);
    GMUI_ControlSetButton("", GMUIspr_move, -1, -1);
    GMUI_ControlAddToGroup(1);
}

with (GMUI_Add("SwitchButton", "button",        -2,16,  4,2,    global.GMUIAnchorTop)) {
    GMUI_ControlSetButtonAction(_Switch_Button);
    GMUI_ControlSetSprite(GMUIspr_switch,0,1,0);
}

with (GMUI_Add("ExitButton", "textbutton",      0,0,    1,1,     global.GMUIAnchorTopRight)) {
    GMUI_ControlSetButtonAction(_Exit_Button);
    GMUI_ControlSetButton("x", -1, -1, -1);
    // (Example:) Minor adjustment so that the control isnt cut off by the room
    GMUI_ControlSetPositioning(-1,0,0,0);
    GMUI_ControlPersistentToLayer(1); // Test multi-layer
}



// Test slider
with (GMUI_Add("Slider", "slider",              16,12,  10,2,   global.GMUIAnchorBottomRight)) {
    GMUI_ControlSetSliderSettings(13,10,34,true,true,true,global.GMUIDirectionTypeHorizontal);
    GMUI_ControlSetSliderStyle(2,2,c_dkgray,0.6,c_teal,0.9,c_dkgray,0.4,c_aqua,1,c_gray,0.8);
    GMUI_ControlSetSliderSize(16, 20, 1, 12, 10, 8, 6, 8);
    GMUI_ControlSetInitValue(20);
    
    GMUI_ControlSetValueChangedAction(_SliderValue_Changed);
    
}

// Button to set slider to mid point
with (GMUI_Add("MidSlider", "button",           19,12,  2,2,    global.GMUIAnchorBottomRight)) {
    GMUI_ControlSetButtonAction(_SliderMid_Button);
    GMUI_ControlSetButton("Mid",-1,-1,-1);
    GMUI_ControlSetPositioning(0,6,0,20);
}
// Button to set slider to snap or not
with (GMUI_Add("SnapSlider", "button",          23,12,  3,2,    global.GMUIAnchorBottomRight)) {
    GMUI_ControlSetButtonAction(_SliderSnap_Button);
    GMUI_ControlSetButton("Snap",-1,-1,-1);
    GMUI_ControlSetPositioning(0,6,0,20);
}

// Display of slider value to the side
with (GMUI_Add("SliderVal", "label",            5,12,   2,2,    global.GMUIAnchorBottomRight)) {
    GMUI_ControlSetText(string(round(GMUI_GetValue("Slider"))));
    GMUI_ControlSetStyle($606060,c_gray,-1,-1,-1,-1,-1,-1,-1,-1);
    GMUI_ControlSetFontStyle(fontNumericBold,$D9D9D9,fa_middle);
}

// Test checkbox and toggle
with (GMUI_Add("CheckBox", "checkbox",          4,12,   1,1,    global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetCheckboxSettings(1, c_lime, c_gray, global.GMUISlideRoundRect, $808080, $505050, room_speed/6);
    GMUI_ControlSetHoverAction(_Hover_Checkbox);
    GMUI_ControlSetHoverOffAction(_HoverOff_Checkbox);
    GMUI_ControlSetSprite(s10, 0, 0, 0);
    
    // Add a space at the end of the string to make sure it wraps. I know... but its Game Maker ;)
    with (GMUI_ControlAddTooltip("Checkbox!",global.GMUIAnchorBottom,6,2,12,4,-1,-1)) {
        GMUI_ControlSetFadeOnHide(id, room_speed/6);
    }
}

with (GMUI_Add("Toggle", "toggle",              3,10,   3,2,    global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetToggleSettings(1, c_lime, c_gray, global.GMUISlideFullRoundRect, $808080, $505050, room_speed/4, global.GMUIDirectionTypeHorizontal, 0);
}

with (GMUI_Add("SpritePicker", "spritepicker",  -10,10, 5,2,    global.GMUIAnchorBottom)) {
    GMUI_ControlAddOption(0, GMUIspr_arrowright);
    GMUI_ControlAddOption(2, GMUIspr_arrowup);
    GMUI_ControlAddOption(4, GMUIspr_arrowleft);
    GMUI_ControlAddOption(6, GMUIspr_arrow);
    GMUI_ControlSetPicker(sprite_get_width(GMUIspr_arrowleft) + 4,sprite_get_height(GMUIspr_arrowleft) + 4,
        global.GMUIDirectionTypeHorizontal, GMUIspr_arrowright,GMUIspr_arrowleft);
    GMUI_ControlSetInitValue(6);
}
// Example: overrides initial value:
GMUI_ControlSelectOption("SpritePicker",2);

//with (GMUI_Add("Graphic", "image",          -12,10, 2,2,    layer, global.GMUIAnchorBottom)) {
//    GMUI_ControlSetSpriteExt(s10, 0, 0, 0, 2, 2, c_white, 0.2);
//}


// Object click group test
/*

    NEW LAYER: 1 (Automatically switches setting layer to new layer

*/

GMUI_AddLayer(1,0,0);

GMUI_CreateGroup(3,          0,0,    global.GMUIAnchorTopLeft);
//GMUI_GroupSetFadeOnHide(3,room_speed/8,1)


with (GMUI_Add("MenuInt", "intpicker",          0,0,    3,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetAttributes(0,0,0,9);
    GMUI_ControlSetInitValue(0);
    GMUI_ControlAddToGroup(3);
    GMUI_GroupHide(3,1,true);
}

// Switch back to make instructions on layer 0
GMUI_SetOnLayer(0);

with (GMUI_Add("MenuIntInstructions", "label",  20,23,  12,2,   global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetInitValue("Click square to open sub menu");
}


/*

    MENU EXAMPLES

*/


// Test Menu (Menu ID variable isn't used here... but could be if you want to)
var menuID; //-9,2 
menuID = GMUI_CreateMenu("Test Menu",   GMUI_CenterX(0, 18, global.GMUIAnchorTop) ,2,   18,24,   global.GMUIAnchorTop);
GMUI_MenuSetClickOff("Test Menu", true);
GMUI_MenuSetStyle("Test Menu", c_black, .3, c_white, 0.75, true);
GMUI_MenuSetFadeOnHide("Test Menu", room_speed/4, 0);
GMUI_MenuSetHidePosition("Test Menu", -9, 6, easeExpOut, room_speed/2);
//GMUI_MenuSetActionIn("Test Menu",...)

with (GMUI_Add("CloseButton", "textbutton",   4,1,   4,1,    global.GMUIAnchorTopRight)) {
    GMUI_ControlSetButtonAction(_PopupClose_Button);
    GMUI_ControlSetButton("Close",-1,-1,-1);
    GMUI_ControlAddToMenu("Test Menu");
}

with (GMUI_Add("OpenButton", "textbutton",   -3,8,   8,1,    global.GMUIAnchorTop)) {
    GMUI_ControlSetButtonAction(_PopupMenu2_Button);
    GMUI_ControlSetButton("Open Another",-1,-1,-1);
    GMUI_ControlAddToMenu("Test Menu");
}

with (GMUI_Add("Toggle2", "toggle",              2,4,   3,2,    global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetToggleSettings(1, c_lime, c_gray, global.GMUISlideFullRoundRect, $808080, $505050, room_speed/4, global.GMUIDirectionTypeHorizontal, 0);
    GMUI_ControlAddToMenu("Test Menu");
}


// Test Menu 2
menuID = GMUI_CreateMenu("Test Menu 2",   -6,8,   18,24,   global.GMUIAnchorTop);
GMUI_MenuSetClickOff("Test Menu 2", true);
GMUI_MenuSetStyle("Test Menu 2", c_black, 0.3, c_white, 0.75, true);
GMUI_MenuSetFadeOnHide("Test Menu 2", room_speed/4, 0);

with (GMUI_Add("CloseButton2", "textbutton",   4,1,   4,1,    global.GMUIAnchorTopRight)) {
    GMUI_ControlSetButtonAction(_PopupClose_Button);
    GMUI_ControlSetButton("Close",-1,-1,-1);
    GMUI_ControlAddToMenu("Test Menu 2");
}

with (GMUI_Add("PopupTestButton","textbutton",  -3,8,   8,1,    global.GMUIAnchorTop)) {
    GMUI_ControlSetButtonAction(_Popup_Button);
    GMUI_ControlSetButton("Try Popup",-1,-1,-1);
    GMUI_ControlAddToMenu("Test Menu 2");
}

with (GMUI_Add("ResponseLabel", "label", -8, 10, 16, 2, global.GMUIAnchorTop)) {
    // This value will be set by the popup
    //ControlBackgroundColor = c_black;
    GMUI_ControlSetFontStyle(fontNumericBold,c_white,fa_center);
    GMUI_ControlAddToMenu("Test Menu 2");
}

// Test Popup
//global.GMUIPopupBlank = -1;global.GMUIPopupInformation = 0;global.GMUIPopupConfirm = 1;global.GMUIPopupThreeOptions = 2;
menuID = GMUI_CreatePopup("Test Popup",  -14,2,   28,12,   global.GMUIAnchorTop, global.GMUIPopupThreeOptions);
GMUI_PopupSetMessage("Test Popup", "Click an option to return to the previous screen!", 2, -1, -1);
GMUI_PopupSetAction("Test Popup", _PopupReturnAction);
GMUI_PopupSetStyle("Test Popup", c_white, 0.99, c_white, 0.75, true);
GMUI_PopupSetFadeOnHide("Test Popup", room_speed/8, 0);
GMUI_PopupSetHidePosition("Test Popup", -14, 0, easeExpOut, room_speed/4);
//todo: change the popup style

// Options to change default controls and actions:
// GMUI_PopupSetButton("Test Popup", which button, Text or "", graphic or -1, text align, text color on hover)

// Additional Options:
//with (GMUI_Add("Button", "textbutton", 20,3, 4,2, 0, global.GMUIAnchorBottomRight)) {
//GMUI_ControlAddToPopup("Test Popup");}
//GMUI_PopupSetClickOff("Test Popup", false); // False is default



