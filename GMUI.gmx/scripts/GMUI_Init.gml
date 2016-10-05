/// Call this initialization script before creating any GMUI interfaces
//
// !WARNING! MODIFYING THE GMUI SCRIPTS CAN BREAK FUNCTIONALITY AND CAUSE ERRORS! TRY TO EDIT THE OBJECTS INSTEAD!
//
// Copyright 2016 Alert Studios (Mark Palnau). Initially designed by Alert Studios and released as Open-Source.
//
// If you would like to help make GMUI better, please submit a ticket or pull request on the project on GitHub!
//
//
//

// SET THIS VALUE TO TRUE IF RUNNING IN GAME MAKER 8.x
global.GMUIGameMaker8 = false;


// Index of global GMUI's
global.GMUIii = 0;


// Common GMUI values:

// AHOY MATEYS - Please note that the cell#'s for new controls are relative to their anchor position (0 is default: TopLeft)
global.GMUIAnchorRight = 1;
global.GMUIAnchorTopRight = 2;
global.GMUIAnchorTop = 3;
global.GMUIAnchorTopLeft = 4;
global.GMUIAnchorLeft = 5;
global.GMUIAnchorBottomLeft = 6;
global.GMUIAnchorBottom = 7;
global.GMUIAnchorBottomRight = 8;

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
