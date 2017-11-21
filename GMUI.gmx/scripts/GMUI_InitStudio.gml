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
    IntPicker,
    DoublePicker,
    TextInt,
    TextDecimal,
    TextString,
    Button,
    TextButton,
    Slider,
    Toggle,
    Checkbox,
    Sprite,
    Image,
    Dropdown,
    Label,
    Tooltip
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

enum GMUISlideShape {
    None = -1, //global.GMUISlideNone
    Line = -2, //global.GMUISlideLine
    Rectangle = -3, //global.GMUISlideRect
    RoundRectangle = -4, //global.GMUISlideRoundRect
    FullRoundRectangle = -5 //global.GMUISlideFullRoundRect
}

