///GMUI_InitStudio() This internal script is called by GMUI_Init, if running GM:Studio 1.x,2.x
//
// !WARNING! MODIFYING THE GMUI SCRIPTS CAN BREAK FUNCTIONALITY AND CAUSE ERRORS! EDIT THE OBJECTS INSTEAD!
//
// Copyright 2016-2018 Alert Studios (Mark Palnau). Initially designed by Alert Studios and released as Open-Source.
//
// If you would like to help make GMUI better, please submit a ticket or pull request on the project on GitHub!
// https://github.com/AlertStudios/GMUI-Framework
//
//

if (global.GMUIGameMaker8)
    return false;

    
    
// THE REST OF THIS SCRIPT ONLY EXISTS IN GM:STUDIO:


// Common GMUI values:
enum GMUIControl {
    IntPicker = -1,
    DoublePicker = -2,
    SpritePicker = -3,
    TextInt = -4,
    TextDecimal = -5,
    TextString = -6,
    Button= -7,
    TextButton = -8,
    Slider = -9,
    Toggle = -10,
    Checkbox = -11,
    Sprite = -12,
    Image = -13,
    Dropdown = -14,
    SelectList = -15,
    Label = -16,
    Tooltip = -17
}

// AHOY MATEYS - Please note that the cell#'s for new controls are relative to their anchor position
enum GMUIAnchor {
    Right = 1, //global.GMUIAnchorRight
    TopRight = 2, //global.GMUIAnchorTopRight
    Top = 3, //global.GMUIAnchorTop
    TopLeft = 4, //global.GMUIAnchorTopLeft
    Left = 5, //global.GMUIAnchorLeft
    BottomLeft = 6, //global.GMUIAnchorBottomLeft
    Bottom = 7, //global.GMUIAnchorBottom
    BottomRight = 8, //global.GMUIAnchorBottomRight
    Center = 9, //global.GMUIAnchorCenter
    Default = 10 //global.GMUIAnchorDefault
}

enum GMUIDirection {
    Horizontal = 0, //global.GMUIDirectionTypeHorizontal
    Vertical = 1, //global.GMUIDirectionTypeVertical
    SideVertical = 2, //global.GMUIDirectionTypeSideVertical
    Both = 3 //global.GMUIDirectionTypeBoth
}

enum GMUIPopup {
    Blank = -1, //global.GMUIPopupBlank
    Information = 0, //global.GMUIPopupInformation
    Confirm = 1, //global.GMUIPopupConfirm
    ThreeOptions = 2 //global.GMUIPopupThreeOptions
}

enum GMUIData {
    String = 0,//global.GMUIDataTypeString
    Integer = 1,//global.GMUIDataTypeInteger
    Decimal = 2,//global.GMUIDataTypeDecimal
    Button = 3,//global.GMUIDataTypeButton
    Info = 4,//global.GMUIDataTypeInfo
    Boolean = 5//global.GMUIDataTypeBoolean
}

enum GMUISlideShape {
    None = -1, //global.GMUISlideNone
    Line = -2, //global.GMUISlideLine
    Rectangle = -3, //global.GMUISlideRect
    RoundRectangle = -4, //global.GMUISlideRoundRect
    FullRoundRectangle = -5 //global.GMUISlideFullRoundRect
}

enum GMUIOverflow {
    None = 0, //global.GMUIOverflowNone
    Resize = 1, //global.GMUIOverflowResize
    Scroll = 2 //global.GMUIOverflowScroll
}



