///GMUI_InitStudio() This internal script is called by GMUI_Init, if running GM:Studio 1.x,2.x
//
// !WARNING! MODIFYING THE GMUI SCRIPTS CAN BREAK FUNCTIONALITY AND CAUSE ERRORS! EDIT THE OBJECTS INSTEAD!
//
// Copyright 2017 Alert Studios (Mark Palnau). Initially designed by Alert Studios and released as Open-Source.
//
// If you would like to help make GMUI better, please submit a ticket or pull request on the project on GitHub!
// https://github.com/AlertStudios/GMUI-Framework
//
//

if (global.GMUIGameMaker8)
    return false;

    
    
// THE REST OF THIS SCRIPT ONLY EXISTS IN GM:STUDIO:

// Index of global GMUI's
global.GMUIii = 0;


// Common GMUI values:
enum GMUIControl {
    IntPicker = "intpicker",
    DoublePicker = "doublepicker",
    TextInt = "textint",
    TextDecimal = "textdecimal",
    TextString = "textstring",
    Button = "button",
    TextButton = "textbutton",
    Slider = "slider",
    Toggle = "toggle",
    Checkbox = "checkbox",
    Sprite = "sprite",
    Image = "image",
    Dropdown = "dropdown",
    Label = "label",
    Tooltip = "tooltip"
}


// AHOY MATEYS - Please note that the cell#'s for new controls are relative to their anchor position
enum GMUIAnchor {
    Right = global.GMUIAnchorRight, //1
    TopRight = global.GMUIAnchorTopRight, //2
    Top = global.GMUIAnchorTop, //3
    TopLeft = global.GMUIAnchorTopLeft, //4
    Left = global.GMUIAnchorLeft, //5
    BottomLeft = global.GMUIAnchorBottomLeft, //6
    Bottom = global.GMUIAnchorBottom, //7
    BottomRight = global.GMUIAnchorBottomRight, //8
    Center = global.GMUIAnchorCenter, //9
    Default = global.GMUIAnchorDefault //10
}

enum GMUIDirection {
    Horizontal = global.GMUIDirectionTypeHorizontal, //0
    Vertical = global.GMUIDirectionTypeVertical, //1
    SideVertical = global.GMUIDirectionTypeSideVertical, //2
    Both = global.GMUIDirectionTypeBoth //3
}

enum GMUIPopup {
    Blank = global.GMUIPopupBlank, //-1
    Information = global.GMUIPopupInformation ,//0
    Confirm = global.GMUIPopupConfirm ,//1
    ThreeOptions = global.GMUIPopupThreeOptions //2
}

enum GMUISlideShape {
    None = global.GMUISlideNone, //-1
    Line = global.GMUISlideLine, //-2
    Rectangle = global.GMUISlideRect, //-3
    RoundRectangle = global.GMUISlideRoundRect, //-4
    FullRoundRectangle = global.GMUISlideFullRoundRect //-5
}

