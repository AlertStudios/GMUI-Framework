///GMUI_Init(Controls Object) Call this initialization script before creating any GMUI interfaces
//
// !WARNING! MODIFYING THE GMUI SCRIPTS CAN BREAK FUNCTIONALITY AND CAUSE ERRORS! TRY TO EDIT THE OBJECTS INSTEAD!
//
// Copyright 2017-2020 Alert Studios (Mark Palnau). Initially designed by Alert Studios and released as Open-Source.
//
// If you would like to help make GMUI better, please submit a ticket or pull request on the project on GitHub!
// https://github.com/AlertStudios/GMUI-Framework
//
//

// Index of global GMUI's
global.GMUIii = 0;

// CALL DEFAULT SCRIPTS:
// EACH SHOULD CHECK FOR iid > 0. If 0, set global value otherwise set local
GMUI_SetConfirmKey(vk_enter);
GMUI_SetControlObject(argument0);
GMUI_SetDepth(-9999);
GMUI_SetDoubleSelect(true);
GMUI_DisableNavigation();
GMUI_SetViewSnap(true,0);
GMUI_UseSurfaces(true);

// Optionally specified defaults script
global.GMUIDefaults = -1;

// Common GMUI values:

// AHOY MATEYS - Please note that the cell#'s for new controls are relative to their anchor position
global.GMUIAnchorRight = 1;
global.GMUIAnchorTopRight = 2;
global.GMUIAnchorTop = 3;
global.GMUIAnchorTopLeft = 4;
global.GMUIAnchorLeft = 5;
global.GMUIAnchorBottomLeft = 6;
global.GMUIAnchorBottom = 7;
global.GMUIAnchorBottomRight = 8;
global.GMUIAnchorCenter = 9;
global.GMUIAnchorDefault = global.GMUIAnchorTopLeft;

// Hovering directions for special controls
global.GMUIHoveringDirection_None = 0;
global.GMUIHoveringDirection_Right = 1;
global.GMUIHoveringDirection_Up = 2;
global.GMUIHoveringDirection_Left = 3;
global.GMUIHoveringDirection_Down = 4;

// Direction types
global.GMUIDirectionTypeHorizontal = 0;
global.GMUIDirectionTypeVertical = 1;
global.GMUIDirectionTypeSideVertical = 2;
global.GMUIDirectionTypeBoth = 3;
global.GMUIDirectionTypeNone = -1;

// Control datatypes
global.GMUIDataTypeString = 0;
global.GMUIDataTypeInteger = 1;
global.GMUIDataTypeDecimal = 2;
global.GMUIDataTypeButton = 3;
global.GMUIDataTypeInfo = 4;
global.GMUIDataTypeBoolean = 5;

// PopupTypes
global.GMUIPopupBlank = -1;
global.GMUIPopupInformation = 0;
global.GMUIPopupConfirm = 1;
global.GMUIPopupThreeOptions = 2;

// Slide shapes
global.GMUISlideNone = -1;
global.GMUISlideLine = -2;
global.GMUISlideRect = -3;
global.GMUISlideRoundRect = -4;
global.GMUISlideFullRoundRect = -5;

// Overflow types
global.GMUIOverflowNone = 0;
global.GMUIOverflowResize = 1;
global.GMUIOverflowScroll = 2;


// THIS VALUE WILL REMAIN TRUE IF RUNNING IN GAME MAKER 8.x
global.GMUIGameMaker8 = true;

// If studio, the flag will change to false and define the enums
GMUI_InitStudio();



