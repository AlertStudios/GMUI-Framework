#define GMUI_Form
/// Playbook to create all of the UI component objects for the project
//
// PLEASE READ THE MANUAL ONLINE FOR INSTRUCTIONS ON HOW TO USE GMUI!
//
// Called by GMUI_Create. Argument can be used optionally to have different
// forms for different GMUI instances to use:
var OptionalInterfaceName; OptionalInterfaceName = argument0;

//
//
// Syntax: GMUI_Add("Name", "Type String", 
//                  cell# x, cell# y, cells wide (min 1), cells high (min 1), 
//                  Layer**, Anchor***)


// Cell#'s start at 0 and increment by 1 for each size of cell over the x & y axis
// ** Layer can be used to show pop-up or slide windows and disable lower layers temporarily (0 is default)
// *** See GMUI_Init for Anchor codes. E.g.: AnchorBottomRight will be determined by cells away from room width/height (0=default)

// Types: textint, textdecimal, textstring, button , slider , dropdown , custom*
// * To use custom, type the object name you would like to use as a reference to the GMUI cell
// Note: MUST BE VALID TYPE NAME. If not, it will default to an 'X'

// Assign names to the controls to reference in your code
// e.g. SizeSlider = GMUI_Add("SizeSlider",...), then use: GMUI_GetValue("SizeSlider");

// Custom controls should call Create: GMUI_ControlInit, Draw: GMUI_ControlDraw

//GMUI_Add("New1" , GMUI_custom , 0 , 0 , 1 , 1 , 0 , 0 , 1 , 0 , AnchorTopLeft );
// gmuiaddlabel ()

//Group can be used move, disable, or hide a set of controls from within the same layer
//...



// If using multiple grids, you can switch between interfaces (optional):
switch (OptionalInterfaceName) {
    case "MyGrid":
    default: // < Remove default, & match name to GMUI_Create(name,,)

    
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
            GMUI_ControlAddToGroup(2);
        }
        
        with (GMUI_Add("TestButton", "textbutton",      3,9,   5,3,    layer, global.GMUIAnchorTopLeft)) {
            GMUI_ControlSetButton("Test!", -1, -1, -1, -1);
            GMUI_ControlSetStyle(-1, -1, c_red, 1, 0.85, -1, -1, -1, -1, -1);
            GMUI_ControlAddToGroup(2);
        }
        
        with (GMUI_Add("DebugButton", "textbutton",     1,3,    5,3,    layer, global.GMUIAnchorBottomLeft)) {
            GMUI_ControlSetButton("Debug", -1, -1, -1, -1);
            GMUI_ControlSetStyle(-1, -1, c_gray, 1, 0.85, -1, -1, -1, -1, -1);
        }
        
        with (GMUI_Add("DisableButton", "textbutton",      8,3,    5,3,    layer, global.GMUIAnchorBottomLeft)) {
            GMUI_ControlSetButton("Disable"+chr(13)+"Test",-1,-1,-1,-1);
        }
        
        with (GMUI_Add("HideButton", "textbutton",      15,3,    5,3,    layer, global.GMUIAnchorBottomLeft)) {
            GMUI_ControlSetButton("Hide"+chr(13)+"Group",-1,-1,-1,-1);
        }
        
        with (GMUI_Add("MoveButton", "textbutton",      22,3,    6,3,    layer, global.GMUIAnchorBottomLeft)) {
            GMUI_ControlSetButton("Bump"+chr(13)+"Group",-1,-1,-1,-1);
        }
        
        with (GMUI_Add("ExitButton", "textbutton",      0,0,    1,1,     layer, global.GMUIAnchorTopRight)) {
            GMUI_ControlSetButton("x", -1, -1, -1, -1);
            // (Example:) Minor adjustment so that the control isnt cut off
            GMUI_ControlSetPositioning(-1,0,0,0);
        }
        
    break;
}