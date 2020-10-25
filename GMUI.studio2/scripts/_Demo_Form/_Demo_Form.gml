function _Demo_Form() {
///_Demo_Form() This interface is for the demo form

// DEMO INTERFACE:

// Set optional grid settings
GMUI_SetKeyNavigation(global.GMUIDirectionTypeVertical,vk_up,vk_down,vk_left,vk_right,true);

// Set the layer to change settings on [This one is optional: Already defaults to layer 0]
GMUI_SetOnLayer(0);

//
// Setting the left choices
//

// Left side option buttons group
GMUI_CreateGroup(1,      2,2,   global.GMUIAnchorTopLeft);
GMUI_GroupSetSize(1,     8,20);
GMUI_GroupSetStyle(1, c_black, .2, c_black, .3, 0);
GMUI_GroupSetFadeOnHide(1, room_speed/2, 0);
GMUI_GroupSetMarginY(1, 1);

var _bW; _bW = 6;

with (GMUI_Add("BtnSliders", "button",         1,1,   _bW,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(1);
    GMUI_ControlSetButtonAction1(_Show_Group, 2);
    GMUI_ControlSetButton("Sliders",-1,-1,-1);
}

with (GMUI_Add("BtnInputs", "button",         1,4,   _bW,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(1);
    GMUI_ControlSetButtonAction1(_Show_Group, 3);
    GMUI_ControlSetButton("Inputs",-1,-1,-1);
}

with (GMUI_Add("BtnToggles", "button",         1,7,   _bW,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(1);
    GMUI_ControlSetButtonAction1(_Show_Group, 4);
    GMUI_ControlSetButton("Toggles",-1,-1,-1);
}

with (GMUI_Add("BtnMenus", "button",         1,10,   _bW,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(1);
    GMUI_ControlSetButtonAction(_PopupMenu_Button);
    GMUI_ControlSetButton("Menus",-1,-1,-1);
}

with (GMUI_Add("BtnSelection", "button",         1,13,   _bW,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(1);
    GMUI_ControlSetButtonAction1(_Show_Group, 5);
    GMUI_ControlSetButton("Selection",-1,-1,-1);
}

with (GMUI_Add("BtnDisabling", "button",         1,16,   _bW,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(1);
    GMUI_ControlSetButtonAction1(_Show_Group, 6);
    GMUI_ControlSetButton("Disabling",-1,-1,-1);
}

with (GMUI_Add("BtnLayering", "button",         1,19,   _bW,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(1);
    GMUI_ControlSetButtonAction1(_Show_Group, 7);
    GMUI_ControlSetButton("Layering",-1,-1,-1);
}

with (GMUI_Add("BtnMovement", "button",         1,22,   _bW,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(1);
    GMUI_ControlSetButtonAction1(_Show_Group, 8);
    GMUI_ControlSetButton("Movement",-1,-1,-1);
}

with (GMUI_Add("BtnAnchoring", "button",         1,25,   _bW,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(1);
    GMUI_ControlSetButtonAction1(_Show_Group, 9);
    GMUI_ControlSetButton("Anchoring",-1,-1,-1);
}

with (GMUI_Add("BtnExpand", "button",         1,28,   _bW,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(1);
    //GMUI_ControlSetButtonAction1(_Show_Group, 8);
    GMUI_ControlSetButton("Expand",-1,-1,-1);
}

with (GMUI_Add("BtnDebug", "button",         1,31,   _bW,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(1);
    GMUI_ControlSetButtonAction(_Debug_Button);
    GMUI_ControlSetButton("Debug",-1,-1,-1);
}


//
// RIGHT GROUP SECTION
//

// group border
GMUI_CreateGroup(99, 20, 2, global.GMUIAnchorTopRight);
GMUI_GroupSetStyle(99, c_black, .2, c_black, .3, 0);
GMUI_GroupSetSize(99,20,34);

with (GMUI_Add("Right","label",0,0,1,1,global.GMUIAnchorTopRight)) {
    GMUI_ControlAddToGroup(99);
}


var _fadespeed; _fadespeed = room_speed/2;

// Right Group 2: Sliders (Default)
GMUI_CreateGroup(2,      20,2,    global.GMUIAnchorTopRight);
GMUI_GroupSetFadeOnHide(2, _fadespeed, 0);
GMUI_GroupSetMarginX(2, 1);

with (GMUI_Add("Slider", "slider",              5,6,  10,2,   global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(2);
    GMUI_ControlSetSliderSettings(13,10,34,true,true,true,global.GMUIDirectionTypeHorizontal);
    GMUI_ControlSetSliderStyle(2,2,c_dkgray,0.6,c_teal,0.9,c_dkgray,0.4,c_aqua,1,c_gray,0.8);
    GMUI_ControlSetSliderSize(16, 20, 1, 12, 10, 8, 6, 8);
    GMUI_ControlSetInitValue(20);
    
    GMUI_ControlSetValueChangedAction(_SliderValue_Changed);
}

// Button to set slider to mid point
with (GMUI_Add("MidSlider", "button",           1,4,  2,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(2);
    GMUI_ControlSetButtonAction(_SliderMid_Button);
    GMUI_ControlSetButton("Mid",-1,-1,-1);
    GMUI_ControlSetPositioning(0,6,0,20);
}
// Button to set slider to snap or not
with (GMUI_Add("SnapSlider", "button",          1,6,  3,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(2);
    GMUI_ControlSetButtonAction(_SliderSnap_Button);
    GMUI_ControlSetButton("Snap",-1,-1,-1);
    GMUI_ControlSetPositioning(0,6,0,20);
}

// Display of slider value to the side
with (GMUI_Add("SliderVal", "label",            16,6,   2,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(2);
    GMUI_ControlSetText(string(round(GMUI_GetValue("Slider"))));
    GMUI_ControlSetStyle($606060,c_gray,-1,-1,-1,-1,-1,-1,-1,-1);
    GMUI_ControlSetFontStyle(fontNumericBold,$D9D9D9,fa_middle);
}

with (GMUI_Add("SliderV", "slider",              6,9,  4,8,   global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(2);
    GMUI_ControlSetSliderSettings(13,10,34,true,true,true,global.GMUIDirectionTypeVertical);
    GMUI_ControlSetSliderStyle(2,2,c_dkgray,0.6,c_teal,0.9,c_dkgray,0.4,c_aqua,1,c_gray,0.8);
    GMUI_ControlSetSliderSize(16, 20, 1, 12, 10, 8, 6, 8);
    GMUI_ControlSetInitValue(20);
}

with (GMUI_Add("BtnDisableSlider", "button",         12,16,   6,3,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(2);
    GMUI_ControlSetButtonAction(_Disable_Slider_Button);
    GMUI_ControlSetButton("Disable It",-1,-1,-1);
}

//TESTESTESTESTESTEST
/*
with (GMUI_Add("Slider2", "slider",              10,6,  6,2,   global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetSliderSettings(13,10,34,true,true,true,global.GMUIDirectionTypeHorizontal);
    GMUI_ControlSetSliderStyle(2,2,c_dkgray,0.6,c_teal,0.9,c_dkgray,0.4,c_aqua,1,c_gray,0.8);
    GMUI_ControlSetSliderSize(16, 20, 1, 12, 10, 8, 6, 8);
    GMUI_ControlSetInitValue(20);
    
    GMUI_ControlSetValueChangedAction(_SliderValue_Changed);
}
with (GMUI_Add("SliderV2", "slider",              13,9,  4,8,   global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetSliderSettings(13,10,34,true,true,true,global.GMUIDirectionTypeVertical);
    GMUI_ControlSetSliderStyle(2,2,c_dkgray,0.6,c_teal,0.9,c_dkgray,0.4,c_aqua,1,c_gray,0.8);
    GMUI_ControlSetSliderSize(16, 20, 1, 12, 10, 8, 6, 8);
    GMUI_ControlSetInitValue(20);
    
    GMUI_ControlSetValueChangedAction(_SliderValue_Changed);
}
*/

// Right Group 3: Inputs
GMUI_CreateGroup(3,      20,2,    global.GMUIAnchorTopRight);
GMUI_GroupHide(3,GMUI_GetCurrentLayer(),true);
GMUI_GroupSetFadeOnHide(3, _fadespeed, 0);
GMUI_GroupSetMarginX(3, 1);
GMUI_GroupSetMarginY(3, 1);
//GMUI_GroupHideOverflow(3); // Prevents group resizing to fit all controls
GMUI_GroupSetOverflow(3, global.GMUIOverflowScroll, -1);
with (GMUI_Add("LowLabel","label", 1,38,16,2,global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(3);
    GMUI_ControlSetText("This label is too low");
}

with (GMUI_Add("SpriteText","textstring",            1,1,    16,2,   global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(3);
    GMUI_ControlSetAttributes(20,0,0,0);
    GMUI_ControlSetInitValue("Select");
    GMUI_ControlSetSprite(sprite24,0,1,0);//GMUIspr_input
}

with (GMUI_Add("IntegerText", "textint",              1,4,    10,2,   global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetAttributes(5,0,-1000,1000);
    GMUI_ControlSetStyle(GMUIhsv(85,55,255),GMUIrgb(20,20,20),-1,-1,-1,-1,-1,-1,-1,-1);
    GMUI_ControlAddToGroup(3);
}

with (GMUI_Add("DecimalText", "textdecimal",          1,7,    10,2,   global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetAttributes(10,10,-999,999);
    GMUI_ControlAddToGroup(3);
    //GMUI_ControlSetSpriteMap(s2,s3,s4,s5,s6,s7,s8,s1,s9,false);
}

with (GMUI_Add("Test4", "intpicker",            1,10,    10,2,   global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetAttributes(0,0,-20,20);
    GMUI_ControlSetInitValue(-1);
    GMUI_ControlAddToGroup(3);
    GMUI_ControlSetHoverAction(_Hover_Int);
    GMUI_ControlSetHoverOffAction(_HoverOff_Int);
    //sprite_set_offset(GMUIspr_arrow,10,12);sprite_set_offset(GMUIspr_arrowup,10,0); // If vertical, offset should be centered
    //GMUI_ControlSetPicker(sprite_get_width(GMUIspr_arrowup) + 4,sprite_get_height(GMUIspr_arrowup) + 4,
    //    global.GMUIDirectionTypeVertical, GMUIspr_arrowup, GMUIspr_arrow);
        
    with (GMUI_ControlAddTooltip("-20 to 20.",global.GMUIAnchorLeft,6,2,12,4,-1,-1)) {
        GMUI_ControlSetFadeOnHide(id, room_speed/4);
    }
}

with (GMUI_Add("LabelDesc", "label",  1, 14, 19, 4, global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(3);
    GMUI_ControlSetInitValue("This group has its overflow set to hide.");
}

with (GMUI_Add("LabelLong", "label",  1, 18, 36, 2, global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(3);
    GMUI_ControlSetInitValue("The width for this label is waaaaaaaay too long for this group's width!");
}

with (GMUI_Add("LabelWrap", "label",  1, 22, 19, 4, global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(3);
    GMUI_ControlSetInitValue("This label text will wrap to the width of the control.");
}


// Right Group 4: Toggles
GMUI_CreateGroup(4,      20,2,    global.GMUIAnchorTopRight);
GMUI_GroupHide(4,GMUI_GetCurrentLayer(),true);
GMUI_GroupSetFadeOnHide(4, _fadespeed, 0);
GMUI_GroupSetMarginX(4, 1);

with (GMUI_Add("Toggle1", "toggle",              3,6,   3,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetToggleSettings(1, c_lime, c_gray, global.GMUISlideFullRoundRect, $808080, $505050, room_speed/4, global.GMUIDirectionTypeHorizontal, 0);
    GMUI_ControlAddToGroup(4);
}

with (GMUI_Add("Toggle2", "toggle",              3,9,   3,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetToggleSettings(1, c_lime, c_gray, global.GMUISlideRoundRect, $808080, $505050, room_speed/4, global.GMUIDirectionTypeHorizontal, 0);
    GMUI_ControlAddToGroup(4);
}

with (GMUI_Add("Toggle3", "toggle",              3,12,   3,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetToggleSettings(1, c_lime, c_gray, global.GMUISlideRect, $808080, $505050, room_speed/4, global.GMUIDirectionTypeHorizontal, 0);
    GMUI_ControlAddToGroup(4);
    GMUI_ControlSetInitValue(true);
}

with (GMUI_Add("Toggle4", "toggle",              3,15,   3,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetToggleSettings(1, c_lime, c_gray, global.GMUISlideLine, $808080, $505050, room_speed/4, global.GMUIDirectionTypeHorizontal, 0);
    GMUI_ControlAddToGroup(4);
}

// Test checkbox and toggle
with (GMUI_Add("CheckBox", "checkbox",          3,20,   1,1,    global.GMUIAnchorTopLeft)) {
    
    GMUI_ControlSetCheckboxSettings(1, c_lime, c_gray, global.GMUISlideRoundRect, $808080, $505050, room_speed/6);
    GMUI_ControlSetHoverAction(_Hover_Checkbox);
    GMUI_ControlSetHoverOffAction(_HoverOff_Checkbox);
    GMUI_ControlSetSprite(s10, 0, 0, 0);
    GMUI_ControlAddToGroup(4);
    // Add a space at the end of the string to make sure it wraps. I know... but its Game Maker ;)
    with (GMUI_ControlAddTooltip("Checkbox!",global.GMUIAnchorBottom,6,2,12,4,-1,-1)) {
        GMUI_ControlSetFadeOnHide(id, room_speed/6);
    }
}


// Open menu button (group 4/5)

// Right Group 5: Selection
GMUI_CreateGroup(5,      20,2,    global.GMUIAnchorTopRight);
GMUI_GroupHide(5,GMUI_GetCurrentLayer(),true);
GMUI_GroupSetFadeOnHide(5, _fadespeed, 0);
GMUI_GroupSetMarginX(5, 1);


with (GMUI_Add("TestSelectList", "selectlist",            2,2,    10,5,   global.GMUIAnchorTopLeft)) {
    GMUI_ItemListSettings(26, $E3E3E3, -1, -1);
    GMUI_ItemListBackground($DEDEDE, $EAEAEA, 0.8, 1);
    GMUI_ItemListSelectAction(_ListAction);
    GMUI_AddItem(2,10,"2-Two","",-1);
    GMUI_AddItem(4,20,"4-Four","",-1);
    GMUI_AddItem(6,30,"6-Six","",-1);
    GMUI_AddItem(8,40,"8-Eight","",-1);
    GMUI_AddItem(10,50,"10-Ten","",-1);
    GMUI_AddItem(12,60,"12-Twelve","",-1);
    GMUI_AddItem(14,70,"14-Fourteen","",-1);
    GMUI_AddItem(16,70,"16-Sixteen","",-1);
    GMUI_AddItem(18,70,"18-Eighteen","",-1);
    GMUI_AddItem(20,70,"20-Twenty","",-1);
    GMUI_AddItem(22,70,"22-Twentytwo","",-1);
    GMUI_AddItem(24,70,"24-Twentyfour","",-1);
    GMUI_AddItem(26,80,"26-Twentysix","",-1);
    
    GMUI_ControlAddToGroup(5);
}

with (GMUI_Add("TestDropDown", "dropdown",               2,10,    10,2,   global.GMUIAnchorTopLeft)) {
    //GMUI_ControlSetScrollbarStyle(Background Color, Alpha, Hover Color, Hover Alpha, Scrollbar Color, Alpha, Hover Color, Hover Alpha);
    //GMUI_ControlSetFontStyle(font, font color, font align);
    //GMUI_ControlSetStyle(Background Color, Border color, Hover color, hover border/rect, border alpha, Select color, Select alpha, show cursor);

    GMUI_ItemListSettings(32, $E3E3E3, -1, -1); // set default list height??
    GMUI_ItemListBackground($DEDEDE, $EAEAEA, 0.8, 1);
    GMUI_AddItem(1,10,"1-One","",-1);
    GMUI_AddItem(2,20,"2-Two","",-1);
    GMUI_AddItem(3,30,"3-Three","",-1);
    GMUI_AddItem(4,40,"4-Four","",-1);
    GMUI_AddItem(5,50,"5-Five","",-1);
    //GMUI_ItemListFont(Font, Font Color, Font Color Hover, Font Alpha, Font Alpha Hover)   

    GMUI_ControlAddToGroup(5);
}

with (GMUI_Add("TestDropdown2", "dropdown",             2,20,   10,2,   global.GMUIAnchorTopLeft)) {
    GMUI_AddItem(2,10,"2-One","",-1);
    GMUI_ControlSetInitValue(2);
    
    GMUI_ControlAddToGroup(5);
}

//with (GMUI_Add("BtnTestDropdownMove", "button",             2,28,   10,2,   global.GMUIAnchorTopLeft)) {
    //GMUI_ControlSetButtonAction1(_Disable_Button,1);
    //GMUI_ControlSetButton("Delay Move 5s",-1,-1,-1);
    //GMUI_ControlAddToGroup(5);
//}



// Right Group 6: Disabling
GMUI_CreateGroup(6,      20,2,    global.GMUIAnchorTopRight);
GMUI_GroupSetFadeOnHide(6, _fadespeed, 0);
GMUI_GroupSetMarginX(6, 1);
GMUI_GroupHide(6,GMUI_GetCurrentLayer(),true);

with (GMUI_Add("BtnDisable1", "button",         3,6,   6,3,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(6);
    GMUI_ControlSetButtonAction1(_Disable_Button,1);
    GMUI_ControlSetButton("Disable 1",-1,-1,-1);
}

with (GMUI_Add("BtnDisable2", "button",         11,6,   6,3,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(6);
    GMUI_ControlSetButtonAction1(_Disable_Button,2);
    GMUI_ControlSetButton("Disable 2",-1,-1,-1);
}


// Right Group 7: Layering
GMUI_CreateGroup(7,      20,2,    global.GMUIAnchorTopRight);
GMUI_GroupSetFadeOnHide(7, _fadespeed, 0);
GMUI_GroupSetMarginX(7, 1);
GMUI_GroupHide(7,GMUI_GetCurrentLayer(),true);


// Right Group 8: Movement
GMUI_CreateGroup(8,      20,2,    global.GMUIAnchorTopRight);
GMUI_GroupSetFadeOnHide(8, _fadespeed, 0);
GMUI_GroupSetMarginX(8, 4);
GMUI_GroupHide(8,GMUI_GetCurrentLayer(),true);

with (GMUI_Add("MovementBox", "label", 2,2 , 2,2, global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetStyle(c_lime, c_gray, c_green, -1, -1, -1, -1, -1, -1, -1);
    GMUI_ControlAddToGroup(8);
}
with (GMUI_Add("MovementBox2", "label", 1,1 , 2,2, global.GMUIAnchorTopLeft)) {//testing | something is wrong with the view...
    GMUI_ControlSetStyle(c_maroon, c_gray, c_red, -1, .5, -1, -1, -1, -1, -1);// fine for groups, but not for controls!
}

with (GMUI_Add("BtnMovement1", "button",         2,6,   6,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(8);
    GMUI_ControlSetButtonAction1(_Movement_Button,1);
    GMUI_ControlSetButton("Slide",-1,-1,-1);
}

with (GMUI_Add("BtnMovement2", "button",         2,9,   6,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(8);
    GMUI_ControlSetButtonAction1(_Movement_Button,2);
    GMUI_ControlSetButton("Gradual",-1,-1,-1);
}

with (GMUI_Add("BtnMovement3", "button",         2,12,   6,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(8);
    GMUI_ControlSetButtonAction1(_Movement_Button,3);
    GMUI_ControlSetButton("Ease Back",-1,-1,-1);
}

with (GMUI_Add("BtnMovement4", "button",         2,15,   6,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(8);
    GMUI_ControlSetButtonAction1(_Movement_Button,4);
    GMUI_ControlSetButton("Elastic",-1,-1,-1);
}

with (GMUI_Add("BtnMovement5", "button",         2,18,   6,2,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlAddToGroup(8);
    GMUI_ControlSetButtonAction1(_Movement_Button,5);
    GMUI_ControlSetButton("Bounce",-1,-1,-1);
}


// Right Group 9: Anchoring
GMUI_CreateGroup(9,      20,2,    global.GMUIAnchorTopRight);
GMUI_GroupSetFadeOnHide(9, _fadespeed, 0);
//SET SIZE TO GRID - X
GMUI_GroupHide(9,GMUI_GetCurrentLayer(),true);


// Right Group 10: Expand (may also be button action?)
GMUI_CreateGroup(10,      20,2,    global.GMUIAnchorTopRight);
GMUI_GroupSetFadeOnHide(10, _fadespeed, 0);
//SET SIZE TO GRID - X
GMUI_GroupHide(10,GMUI_GetCurrentLayer(),true);


// Debug button (group 11)


//GMUI_AddLayer(10,0,0);
with (GMUI_Add("ExitButton", "textbutton",      0,0,    1,1,     global.GMUIAnchorTopRight)) {
    GMUI_ControlSetButtonAction(_Exit_Button);
    GMUI_ControlSetButton("x", -1, -1, -1);
    GMUI_ControlSetPositioning(-1,0,0,0); // Minor adjustment so that the control isnt cut off by the room
    
    //GMUI_ControlPersistentToLayer(0);
}

/*
with (GMUI_Add("test14","textstring",20,1,12,2,global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetAttributes(14,0,0,0);
}
*/



/*
with (GMUI_Add("TestButton", "textbutton",      3,9,    5,3,    global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetButtonAction(_Test_Button);
    GMUI_ControlSetButton("Test!", -1, -1, -1);
    GMUI_ControlSetStyle(-1, -1, c_red, 1, 0.85, -1, -1, -1, -1, -1);
    GMUI_ControlAddToGroup(2);
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



with (GMUI_Add("SwitchButton", "button",        -2,16,  4,2,    global.GMUIAnchorTop)) {
    GMUI_ControlSetButtonAction(_Switch_Button);
    GMUI_ControlSetSprite(GMUIspr_switch,0,1,0);
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
*/
// Example: overrides initial value:
//GMUI_ControlSelectOption("SpritePicker",2);

//with (GMUI_Add("Graphic", "image",          -12,10, 2,2,    layer, global.GMUIAnchorBottom)) {
//    GMUI_ControlSetSpriteExt(s10, 0, 0, 0, 2, 2, c_white, 0.2);
//}


// Object click group test
/*

    NEW LAYER: 1 (Automatically switches setting layer to new layer

*/

//GMUI_AddLayer(1,0,0);

//GMUI_CreateGroup(3,          0,0,    global.GMUIAnchorTopLeft);
//GMUI_GroupSetFadeOnHide(3,room_speed/8,1)

/*
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

*/
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
GMUI_MenuSetOverflow("Test Menu", global.GMUIOverflowScroll);

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

with (GMUI_Add("Toggle5", "toggle",              2,4,   3,2,    global.GMUIAnchorBottomLeft)) {
    GMUI_ControlSetToggleSettings(1, c_lime, c_gray, global.GMUISlideFullRoundRect, $808080, $505050, room_speed/4, global.GMUIDirectionTypeHorizontal, 0);
    GMUI_ControlAddToMenu("Test Menu");
}

with (GMUI_Add("LabelDown", "label", 2, 28, 10,3, global.GMUIAnchorTopRight)) {
    GMUI_ControlAddToMenu("Test Menu");
    GMUI_ControlSetText("This label is too low and needs to be scrolled down to");
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


}
