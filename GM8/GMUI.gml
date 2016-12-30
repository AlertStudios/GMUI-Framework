#define _Test_Form
///_Test_Form() This interface is for the demo

// DEMO INTERFACE:
var layer;
    // Create a control group if you would like: (layer number, group number (> 0), CellX, CellY, CellWide, CellHigh, anchor)
    
    layer = 0;
    // Right side group
    GMUI_CreateGroup(1,     20,3,   layer, global.GMUIAnchorTopRight);
    GMUI_GroupSetSize(1,    18,4,   layer);
    // Left side group
    GMUI_CreateGroup(2,     2,3,    layer, global.GMUIAnchorTopLeft);
    // Object click group test
    GMUI_AddLayer(1,0,0);
    GMUI_CreateGroup(3,     0,0,    1, global.GMUIAnchorTopLeft);
    
    //GMUI_CreateGroup(1, 20,3, layer, global.GMUIAnchorTopRight);
    
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
    }
    
    with (GMUI_Add("Test4", "intpicker",            0,6,    10,2,   layer, global.GMUIAnchorTopLeft)) {
        GMUI_ControlSetAttributes(0,0,-20,20);
        GMUI_ControlSetInitValue(-1);
        GMUI_ControlAddToGroup(2);
    }
    
    with (GMUI_Add("TestButton", "textbutton",      3,9,    5,3,    layer, global.GMUIAnchorTopLeft)) {
        GMUI_ControlSetButtonAction(_Test_Button);
        GMUI_ControlSetButton("Test!", -1, -1, -1);
        GMUI_ControlSetStyle(-1, -1, c_red, 1, 0.85, -1, -1, -1, -1, -1);
        GMUI_ControlAddToGroup(2);
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
    

#define _Test_Button
// Demo Test Button action

// Get all the values and display them:
var t1,t2,t3,t4;
t1 = GMUI_GetValueString("Test1");
t2 = GMUI_GetValueString("Test2");
t3 = GMUI_GetValueString("Test3");
t4 = GMUI_GetValueString("Test4");
show_message("Result:
" + t1 + "
" + t2 + "
" + t3 + "
" + t4);

#define _Debug_Button
// Show/hide debug for the first interface
if ((GMUIid(1)).DebugData)
    (GMUIid(1)).DebugData = false;
else
    (GMUIid(1)).DebugData = true;

#define _Disable_Button
GMUI_ControlDisable("TestButton",1-GMUI_ControlIsDisabled("TestButton"));

#define _Switch_Button
//switch

show_message("Motion tweening is coming soon");

#define _Hide_Button
GMUI_GroupHide(2, 0, 1-GMUI_ControlIsHidden("TestButton"));

#define _Move_Button
var MyButton,MyButtonText;

MyButton = GMUI_GetControl("MoveButton");

if (MyButton >= 0)
    MyButtonText = MyButton.ControlButtonText;
    
if (MyButtonText == "Move"+chr(13)+"Group") {
    with (MyButton) GMUI_ControlSetButton("Return"+chr(13)+"Group",-1,-1,-1);
    // Object is handling the group position here
    testmoving.moving = 1;
}
else {
    with (MyButton) GMUI_ControlSetButton("Move"+chr(13)+"Group",-1,-1,-1);
    testmoving.moving = 0;
    // Return the group to where it was
    GMUI_GroupSetPosition(0,1,20,3,0,0);
}

#define _Exit_Button
game_end();

#define GMUI_SetControlDefaults
///GMUI_SetControlDefaults() Sets the default values for all controls if they are not specified in GMUI_Form

// ! NOTE ! These values must pass validation or else errors will occur!

// Set the default control styling (Background Color, Border color, Hover color, hover border/rect, hover alpha,
// overwrite color, overwrite alpha, select color, select alpha, 
// showcursor)
GMUI_ControlSetStyle(
    rgb(250,250,255),hsv(135,30,100),rgb(20,160,230),true,0.5,
    rgb(40,40,40),0.1,rgb(240,140,40),0.3,
    true
    );
    
// Default sprite options
GMUI_ControlSetSpriteExt(-1,0,0,0,1,1,c_white,1);

// Default font style (font, font color, font align)
GMUI_ControlSetFontStyle(fontNumeric,rgb(42,42,42), fa_left);

// Set the default control attributes(id, Max string length/Whole number padding(KEEP @ 0!), max decimal (if applicable), Min value, Max value)
GMUI_ControlSetAttributes(0,0,0,999);



// Specific control initializations //

// Picker controls ( region width, region height, 
// direction type (see below), right/up sprite, left/down sprite )
GMUI_ControlSetPicker(
    sprite_get_width(GMUIspr_arrow) + 4,sprite_get_height(GMUIspr_arrow) + 4,
    global.GMUIDirectionTypeSideVertical,GMUIspr_arrowup,GMUIspr_arrow
    );
// Direction types: global.GMUIDirectionTypeHorizontal: 0, global.GMUIDirectionTypeVertical: 1, global.GMUIDirectionTypeSideVertical: 2


// Text Button control (Text or "", graphic in button or -1, button image sprite or -1, text alignment, hover color or -1)
GMUI_ControlSetButton("", -1, -1, -1);
    

#define GMUI_SetLayerDepths
///GMUI_SetLayerDepths() Creates a set of layers with their relative depth values from the GMUI default
// This is called by the Create script

layerDepth = depth;

// Each of the control layers are relative to this value, lowest layer on the bottom:
layerDepth_layers = layerDepth-1;

// If you really need more than 100 layers, you can change this (each layer may have tooltips or other objects):
layerDepth_messages = layerDepth_layers - (100*3);

// Windows are above all layers and basic messages (MAY GET RID OF THIS ONE)
//layerDepth_windows = layerDepth_messages - 10;

// Menus show over basic messages and windows
layerDepth_menus = layerDepth_messages - 100;

// Pop-ups show over menus, windows, and messages (each menu may have tooltips or other objects)
layerDepth_popups = layerDepth_menus - (100*3) - 1;

// Warnings are for anything from menus to popups
layerDepth_warnings = layerDepth_popups - 100;


#define GMUI_Settings
///GMUI_Settings Settings for GMUI - Do not delete! Modify to fit your preferences
// Called from the initialization of each GMUI interface


// Define the controls' object!
GMUI_controlobject = GMUI_control;


// Flexibility to add graphical effects settings to the controls:
var basic, good, best; basic = 0; good = 1; best = 2;
graphicsSetting = best;

// Initial depth (z-index) value. Other objects will have depths relative to this
depth = -9999;

// Other specific functionality settings that can be turned off if unwanted
GMUIRemoveExtraDecimalZeros = true;     // Trim extra zeroes in decimal-type controls
GMUIAllowDoubleSelect = true;           // If double selected, the control will overwrite the contents
GMUIEnableTabbing = true;               // Tab key will advance to the next control
GMUIEnableEnterKey = true;              // Enter key will deselect the control

// Enable setting debug data for testing
DebugData = false;

// Show a pop-up of the GMUI error message when it happens
PopUpGMUIError = false;



// Argument can be used optionally for different GMUI instances
var OptionalInterfaceName; OptionalInterfaceName = argument0;
if (script_exists(OptionalInterfaceName)) {
    // Do Something
}




#define easeBounceOut
///easeBounceOut(t,b,c,d) where t is current time, b is start value, c is change in value, and d is duration
/// Bounce Ease for moving controls smoothly

var t,_b,_c,_d;

_t = argument0;
_b = argument1;
_c = argument2;
_d = argument3;

_t = _t/_d;
if (_t < ( 1 / 2.75 ) )
    return _c * (7.5625 *_t*_t) + _b;
else if (_t < ( 2 / 2.75 ) )
{
    _t -= (1.5/2.75);
    return _c * (7.5625 *_t*_t + .75 ) + _b;
}
else if (_t < ( 2.5 / 2.75 ) )
{
    _t -= (2.25/2.75);
    return _c * (7.5625 *_t*_t + .9375 ) + _b;
}
else
{
    _t -= (2.625/2.75);
    return _c * (7.5625 *_t*_t + .984375 ) + _b;
}

#define easeElasticOut
///easeElasticOut(t,b,c,d) where t is current time, b is start value, c is change in value, and d is duration
///Elastic Ease for moving controls smoothly

var _t,_b,_c,_d, _p,_s;
_t = argument0;
_b = argument1;
_c = argument2;
_d = argument3;

_t = _t/_d;
if (t == 1)
    return _b + _c;
    
_p = _d * .3;
_s = _p / 4;

return (_c * power( 2, -10 * _t ) * sin(((_t*_d)-_s) * (2*pi)/_p) + _c + _b );

#define easeExpOut
///easeExpOut(t,b,c,d) where t is current time, b is start value, c is change in value, and d is duration
///Exponential Ease for moving controls smoothly

var _t,_b,_c,_d;

_t = argument0;
_b = argument1;
_c = argument2;
_d = argument3;


return _c * ( -power( 2, -10 * _t/_d ) + 1 ) + _b;

#define hsv
///hsv(hue, saturation, value) Shortcut for making an hsv based color
return make_color_hsv(argument0,argument1,argument2);


#define rgb
///rgb(red, green, blue) Shortcut for making a rgb based color
return make_color_rgb(argument0,argument1,argument2);


#define color_alpha
///color_alpha(color, alpha) Shortcut to set the color and alpha in one call
draw_set_color(argument0);
draw_set_alpha(argument1);

#define align
///align(left align, right align) Shortcut to set both horizontal and vertical align in one call
draw_set_halign(argument0);
draw_set_valign(argument1);

#define minmax
///minmax(original value, minimum value, maximum value) Shortcut to keep the value within the min & max range given
if (is_real(argument0))
    return min(max(argument0,argument1),argument2);
else
    return argument1;

#define GMUI_Add
///GMUI_Add("Name", "Type String", cell# x, cell# y, cells wide (min 1), cells high (min 1), Layer**, Anchor***)
///Adds a component(instance) to the GMUI grid

var SCRIPT,_Layer,_Anchor,_CellX,_CellY;
SCRIPT = "GMUI_Add";
_Layer = argument6;
_Anchor = argument7;
_CellX = argument2;
_CellY = argument3;

// Check that the layer exists first
if (!GMUI_LayerExists(_Layer)) {
    GMUI_ThrowErrorDetailed("The layer does not exist for " + string(argument0),SCRIPT);
    return -1;
}


// Check grid positioning first and assign after created
var gridW, gridH;
// Get the dimensions and round down for grids that have even grid sizes
gridW = ds_grid_width((GMUII()).GMUI_grid[_Layer]);
gridH = ds_grid_height((GMUII()).GMUI_grid[_Layer]);

if (!GMUI_ValidCellBounds(_Anchor,_CellX,_CellY,gridW,gridH)) {
    GMUI_ThrowErrorDetailed("Cell values out of bounds for " + string(argument0) + " (" + string(argument1) + "," + string(_CellX) + ",...",SCRIPT);
    return -1;
}


// Check that it hasn't already been created
if (ds_map_exists((GMUII()).GMUI_map,argument0)) {
    GMUI_ThrowErrorDetailed("The control name has already been defined for '" + string(argument0) + "'",SCRIPT);
    return -1;
}


// Check for type and either reference provided instance or create a new one. MUST BE A VALID TYPE
var thetype,thecontrol;
if (is_string(argument1)) {  
    thecontrol = instance_create(0,0,(GMUII()).GMUI_controlobject); // Default is: GMUI_control , set in GMUI_Settings(...)
}
else {
    thecontrol = instance_create(0,0,argument1);
}

// Well... this problem should never happen.. in theory
if (!instance_exists(thecontrol))
    return -1;
else
    GMUI_ControlInit(thecontrol);

// Add control to control list for reference
ds_list_add((GMUII()).GMUI_controlList,thecontrol);

// Set up control vars
thetype = GMUI_ControlSetType(thecontrol,string(argument1));
thecontrol.valueName = argument0;
thecontrol.CellWide = argument4;
thecontrol.CellHigh = argument5;
thecontrol.Layer = _Layer;
thecontrol.Group = 0;
thecontrol.depth = (GMUII()).layerDepth_layers-(_Layer*3);
thecontrol.persistent = persistence; // This is kind of unnecessary but could be used at some point?

// Store the relative values provided that reference against the anchor position
thecontrol.Anchor = _Anchor;
thecontrol.RelativeCellX = _CellX;
thecontrol.RelativeCellY = _CellY;

// Specific setup for particular types
if (thetype == "textstring") {
    thecontrol.value = "";
    thecontrol.valueString = "";
}

// Relative is to the anchor, this position is the actual:
// The relative values when the grid is adjusted has four relative positions: Middle X's, Middle Y's, Right X's, Bottom Y's)
thecontrol.CellX = GMUI_GetAnchoredCellX(gridW,_CellX,_Anchor);
thecontrol.CellY = GMUI_GetAnchoredCellY(gridH,_CellY,_Anchor);


// Actual position based on its grid position
thecontrol.ActualX = GMUI_CellGetActualX(thecontrol.CellX);
thecontrol.ActualY = GMUI_CellGetActualY(thecontrol.CellY);

// Map the name to the instance
ds_map_add((GMUII()).GMUI_map,argument0,thecontrol);


// SET ALL DEFAULTS (set from the gmui controller):

// Set the default style properties
GMUI_ControlSetDefaultStyle(thecontrol);

// Set the default optional sprite override vars
GMUI_ControlSetDefaultSprite(thecontrol);

// Set the default font style properties
GMUI_ControlSetDefaultFontStyle(thecontrol);

// Set the default attribute properies
GMUI_ControlSetDefaultAttributes(thecontrol);

// Set the default picker properties
GMUI_ControlSetDefaultPicker(thecontrol);

// Set the default button properties
GMUI_ControlSetDefaultButton(thecontrol);

// Override defaults for specific controls (Avoid defaults conflicts):

// Button style override
if (GMUI_GetDataType(thetype) == global.GMUIDataTypeButton) {
    thecontrol.ControlFontAlign = fa_center;
    thecontrol.ControlShowCursor = false;
}


return thecontrol;




#define GMUI_AddLabel
/// Add a label fixed to a control....
// or have the label take a cell block
// a text button should be used if you want it clickable

#define GMUI_AddLayer
///GMUI_AddLayer(Layer Number,x offset, y offset)
/// Adds a new grid layer to GMUI for controls to exist on
// returns false on failure (bad params)

var _Layer;
_Layer = floor(argument0);

if (!is_real(argument1))
    return false;
if (!is_real(argument2))
    return false;
    
if (GMUI_LayerExists(_Layer))
    return false;

// If the layer doesn't exist, add it to the list and create it
ds_list_add((GMUII()).GMUI_gridlist,floor(_Layer));

// Add a group list to the layer in case its used
(GMUII()).GMUI_groupList[_Layer] = ds_list_create();
(GMUII()).GMUI_groupControlList[_Layer,0] = ds_list_create();

//Default
(GMUII()).GMUI_grid_w[_Layer] = ceil(room_width/(GMUII()).cellsize);
(GMUII()).GMUI_grid_h[_Layer] = ceil(room_height/(GMUII()).cellsize_h);

// Assign
(GMUII()).GMUI_grid[_Layer] = ds_grid_create((GMUII()).GMUI_grid_w[_Layer],(GMUII()).GMUI_grid_h[_Layer]);
(GMUII()).GMUI_grid_x[_Layer] = argument1;
(GMUII()).GMUI_grid_y[_Layer] = argument2;


if ((GMUII()).UILayerTop < _Layer)
    (GMUII()).UILayerTop = _Layer;

return true;

#define GMUI_ControlAddToGroup
///GMUI_ControlAddToGroup(group number)
///Adds control to a group if it exists in the layer

var SCRIPT,_Group, _Layer;
SCRIPT = "GMUI_ControlAddToGroup";
_Group = argument0;

// Must be control
if (!GMUI_IsControl()) {
    GMUI_ThrowErrorDetailed("Invalid control",SCRIPT);
    return false;
}

// Validate
if (!is_real(_Group)) {
    GMUI_ThrowErrorDetailed("Invalid group",SCRIPT);
    return false;
}
if (_Group <= 0) {
    GMUI_ThrowErrorDetailed("Invalid group",SCRIPT);
    return false;
}
    
// Control must have a layer that exists (should always be the case)
// Layer value exists in the control
_Layer = Layer;
if (!GMUI_LayerExists(_Layer)) {
    GMUI_ThrowErrorDetailed("Control in layer that doesn't exist: " + string(id),SCRIPT);
    return false;
}

if (!GMUI_GroupExists(_Layer,_Group)) {
    GMUI_ThrowErrorDetailed("Group "+string(_Group)+" doesn't exist for adding control: " + string(id),SCRIPT);
    return false;
}




// Add control to group's control list and assign to control
ds_list_add((GMUII()).GMUI_groupControlList[_Layer,_Group],id);
Group = _Group;


// Reset positioning to base on group's position
CellX = GMUI_GetAnchoredCellX((GMUII()).GMUI_groupCellsW[_Layer,_Group],CellX,Anchor) + (GMUII()).GMUI_groupCellX[_Layer,_Group];
CellY = GMUI_GetAnchoredCellY((GMUII()).GMUI_groupCellsH[_Layer,_Group],CellY,Anchor) + (GMUII()).GMUI_groupCellY[_Layer,_Group];

ActualX = GMUI_CellGetActualX(CellX);
ActualY = GMUI_CellGetActualY(CellY);


// If control is outside of the group boundaries, expand the group to fit it
if (CellX + CellWide > (GMUII()).GMUI_groupCellX[_Layer,_Group] + (GMUII()).GMUI_groupCellsW[_Layer,_Group]) {
    (GMUII()).GMUI_groupCellsW[_Layer,_Group] = CellX + CellWide - (GMUII()).GMUI_groupCellX[_Layer,_Group];
}
if (CellY + CellHigh > (GMUII()).GMUI_groupCellY[_Layer,_Group] + (GMUII()).GMUI_groupCellsH[_Layer,_Group]) {
    (GMUII()).GMUI_groupCellsH[_Layer,_Group] = CellY + CellHigh - (GMUII()).GMUI_groupCellY[_Layer,_Group];
}
    
    

#define GMUI_ControlDisable
///GMUI_ControlDisable("ControlName", Disable?)
///Disable or enable a control
// argument1 is to disable (1) or enable (0)

with (GMUII()) {
    // Retrieve control from the reference map
    var control;
    control = ds_map_find_value(GMUI_map,string(argument0));
    if (string(control) == "0")
        return false;
    else {
        (control).Disabled = argument1;
        return true;
    }
}

#define GMUI_ControlHide
///GMUI_ControlHide("ControlName", Hide?)
///Hide or show a control
// argument1 is to hide (1) or show (0)

with (GMUII()) {
    // Retrieve control from the reference map
    var control;
    control = ds_map_find_value(GMUI_map,string(argument0));
    if (string(control) == "0")
        return false;
    else {
        (control).Hidden = argument1;
        return true;
    }
}

#define GMUI_ControlIsDisabled
///GMUI_ControlIsDisabled("ControlName")
///Is control of name disabled

with (GMUII()) {
    // Retrieve control from the reference map
    var control;
    control = ds_map_find_value(GMUI_map,string(argument0));
    if (string(control) == "0") {
        GMUI_ThrowError("Control doesn't exist in GMUI_ControlIsDisabled()");
        return false;
    }
    else {
        return (control).Disabled;
    }
}

#define GMUI_ControlIsHidden
///GMUI_ControlIsHidden("ControlName")
///Is control of name hidden

with (GMUII()) {
    // Retrieve control from the reference map
    var control;
    control = ds_map_find_value(GMUI_map,string(argument0));
    if (string(control) == "0") {
        GMUI_ThrowError("Control doesn't exist in GMUI_ControlIsHidden()");
        return false;
    }
    else {
        return (control).Hidden;
    }
}

#define GMUI_ControlSetAttributes
///GMUI_ControlSetAttributes(max string length(or 0 for none), max decimal length (if applicable), min value, max value, )
///Set the attributes of the control for the different types (to override the defaults)
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetAttributes");
    return false;
}


    ControlMaxStringLength = argument0;
    ControlMaxDecimalLength = argument1; // If applicable
    ControlMinValue = argument2;
    ControlMaxValue = argument3;

return true;
    

#define GMUI_ControlSetButton
///GMUI_ControlSetButton(Text in button or "" , graphic inside button or -1 , font alignment or -1, text color on hover or -1)
///Set the picker values of the control (to override the defaults)

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control","GMUI_ControlSetButton");
    return false;
}

    ControlButtonText = string(argument0);
    
    if (sprite_exists(argument1))
        ControlButtonGraphic = argument1;
    else
        ControlButtonGraphic = -1;
    
    // Uses same alignment as set in font style
    if (argument2 != -1)
        ControlFontAlign = argument2;
        
    if (argument3 != -1)
    {
        ControlButtonTextHoveringOn = true;
        ControlButtonTextHoverColor = argument3;
    }
    else
    {
        ControlButtonTextHoveringOn = false;
        ControlButtonTextHoverColor = 0;
    }
    

return true;
    

#define GMUI_ControlSetButtonAction
///GMUI_ControlSetButtonAction(Action Script)
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetButtonAction");
    return false;
}

if (script_exists(argument0)) {
    ActionScript = argument0;
    return true;
}
else {
    GMUI_ThrowError("Invalid script argument for GMUI_ControlSetButtonAction");
}

return false;
    

#define GMUI_ControlSetFontStyle
///GMUI_ControlSetStyle(Background Color, Border color, Hover color, hover border/rect, border alpha, font, font color, font align)
///Set the style of the controls that will be used for new controls (to override the defaults)
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetStyle");
    return false;
}

ControlFont = argument0;
ControlFontColor = argument1;
ControlFontAlign = argument2;
    
// Defaults that can be optional in the future
ControlFontAlpha = 1;
    
return true;
    

#define GMUI_ControlSetHoverAction
///GMUI_ControlSetHoverAction(Action Script)
///When hovering, execute script (can also draw)

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetHoverAction");
    return false;
}

if (script_exists(argument0)) {
    HoverActionScript = argument0;
    return true;
}
else {
    GMUI_ThrowError("Invalid script argument for GMUI_ControlSetHoverAction");
}

return false;
    

#define GMUI_ControlSetInitValue
///GMUI_ControlSetInitValue(value)
///Set the 'default' value (value/string) for the control, but not the actual value


if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetInitValue");
    return false;
}

value = argument0;
valueString = string(argument0);
    
return true;

#define GMUI_ControlSetPicker
///GMUI_ControlSetPicker(picker width, picker height, picker direction, picker_right/up sprite, picker_left/down sprite)
///Set the picker values of the control (to override the defaults)
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetPicker");
    return false;
}


    ControlPickerWidth = argument0;
    ControlPickerHeight = argument1;
    ControlPickerDirection = argument2;
    ControlPickerSpriteRightOrUp = argument3;
    ControlPickerSpriteLeftOrDown = argument4;
    

return true;
    

#define GMUI_ControlSetPositioning
///GMUI_ControlSetPositioning( relative x, relative y, actual width, actual height )
///Set the relative positioning and sizing of the control within its cell

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetPositioning");
    return false;
}

// Actual width and height has more exact mouse boundaries (0 for full), BUT only 1 control can be in the same cell block
ActualW = argument2;
ActualH = argument3;

// Relative position is used if the boundary box should be adjusted, must be < cell size
RelativeX = min(argument0,(GMUII()).cellsize - 1);
RelativeY = min(argument1,(GMUII()).cellsize_h - 1);

// Store that this object has an adjusted position
if (ActualW != 0 || ActualH != 0 || RelativeX != 0 || RelativeY != 0)
    IsAdjusted = true;
else
    IsAdjusted = false;

return true;



#define GMUI_ControlSetSelectingAction
///GMUI_ControlSetSelectingAction(Action Script)
///On initial selection, execute script (can also draw)

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetSelectingAction");
    return false;
}

if (script_exists(argument0)) {
    SelectingActionScript = argument0;
    return true;
}
else {
    GMUI_ThrowError("Invalid script argument for GMUI_ControlSetSelectingAction");
}

return false;
    

#define GMUI_ControlSetSprite
///GMUI_ControlSetSprite(sprite, subimage, hover subimage, selected subimage)
///Replace the control drawing with a sprite instead

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control","GMUI_ControlSetSprite");
    return false;
}
    
    if (sprite_exists(argument0))
        ControlGraphic = argument0;
    else
        ControlGraphic = -1;
    
    if (is_real(argument1))
        ControlGraphicIndex = argument1;
    else
        ControlGraphicIndex = 0;
        
    if (is_real(argument2))
        ControlGraphicHoveringIndex = argument2;
    else
        ControlGraphicHoveringIndex = 0;
        
    if (is_real(argument3))
        ControlGraphicSelectedIndex = argument3;
    else
        ControlGraphicSelectedIndex = 0;

return true;


#define GMUI_ControlSetSpriteExt
///GMUI_ControlSetSpriteExt(sprite, subimage, hover subimage, selected subimage, xscale, yscale, color, alpha)
///Replace the control drawing with a sprite with extra parameters

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control","GMUI_ControlSetSpriteExt");
    return false;
}
    
    if (sprite_exists(argument0))
        ControlGraphic = argument0;
    else
        ControlGraphic = -1;
    
    if (is_real(argument1))
        ControlGraphicIndex = argument1;
    else
        ControlGraphicIndex = 0;
        
    if (is_real(argument2))
        ControlGraphicHoveringIndex = argument2;
    else
        ControlGraphicHoveringIndex = 0;
        
    if (is_real(argument3))
        ControlGraphicSelectedIndex = argument3;
    else
        ControlGraphicSelectedIndex = 0;
        
    if (is_real(argument4))
        ControlGraphicXScale = argument4;
    else
        ControlGraphicXScale = 1;
    
    if (is_real(argument5))
        ControlGraphicYScale = argument5;
    else
        ControlGraphicYScale = 1;
        
    if (is_real(argument6))
        ControlGraphicColor = argument6;
    else
        ControlGraphicColor = c_white;
    
    if (is_real(argument7))
        ControlGraphicAlpha = argument7;
    else
        ControlGraphicAlpha = 1;
        

return true;

#define GMUI_ControlSetValueChangedAction
///GMUI_ControlSetValueChangedAction(Action Script)
///On changed value, execute script (can also draw)

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetValueChangedAction");
    return false;
}

if (script_exists(argument0)) {
    ValueChangedActionScript = argument0;
    return true;
}
else {
    GMUI_ThrowError("Invalid script argument for GMUI_ControlSetValueChangedAction");
}

return false;
    

#define GMUI_ControlSetStyle
///GMUI_ControlSetStyle(Background Color, Border color, Hover color, hover border/rect, border alpha, Select color, Select alpha, show cursor)
///Set the style of the controls that will be used for new controls (to override the defaults)
if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetStyle");
    return false;
}

// If any values are given as negative numbers, those values will remain as the control default

if (argument0 >= 0)
ControlBackgroundColor = argument0;
if (argument1 >= 0)
ControlBorderColor = argument1;
if (argument2 >= 0)
ControlHoverColor = argument2;
if (argument3 >= 0)
ControlHoverBorder = argument3; // Draw a second border on hover (1), or rectangle over control (0)
if (argument4 >= 0)
ControlHoverAlpha = minmax(argument4,0,1);
if (argument5 >= 0)
ControlOverwriteColor = argument5;
if (argument6 >= 0)
ControlOverwriteAlpha = argument6;
if (argument7 >= 0)
ControlSelectColor = argument7;
if (argument8 >= 0)
ControlSelectAlpha = argument8;
if (argument9 >= 0)
ControlShowCursor = argument9;

    
// Defaults that can be optional in the future
ControlBackgroundAlpha = 1;

return true;
    

#define GMUI_Create
///GMUI_Create(
///Call creation of the grid interfaces and variables

// Create resizable method for window?


// // Create grid variables
    // Is this already using a GMUI? Assign the instance number as long as its not
    var isOk,G;
    isOk = 1;
    for (G=1;G<=global.GMUIii;G+=1) {
        if (id = global.GMUIiid[G]) {
            isOk = 0;
            break;
        }
    }
        
    if (!isOk)
        return 0;
    else {
        // New ID
        global.GMUIii += 1;
    }

    // Define the instance & number running GMUI
    global.GMUIiid[global.GMUIii] = id;
    GMUInumber = global.GMUIii;
    // Current grid is now this one. The 0 index is the currently active grid
    global.GMUIiid[0] = id;
    
    
    // Initial time to not execute any actions from the grid
    InitalDisable = floor(room_speed/20); // Default 1/20th of a second
    // Layer that is currently enabled (0 is the bottom-most)
    UILayer = 0;
    // Highest layer, for reference
    UILayerTop = 0;
    
    // Other specific functionality settings that can be turned off if unwanted
    GMUI_Settings(argument0);
    
    // Set the default layering depths
    GMUI_SetLayerDepths();
    
    // Previous values of the mouse to determine if it has moved or not
    mouse_px = 0;
    mouse_py = 0;
    previousHoveringControl = -1;
    
    // Debug information
    if (DebugData) {
        TestInRegion = -1;
        TestOnDirection = -1;
        TestHoverObject = -1;
    }

    
// Get cellsize arguments (w,h)
if (argument1 < 1)
    cellsize = 16;
else
    cellsize = argument1;
if (argument2 < 1)
    cellsize_h = cellsize;
else
    cellsize_h = argument2;
    
// Rather pointless to be redundant but it gives more flexibility if you really need it...
persistence = persistent;


// Grid setup (New layers will have their own grids)
GMUI_gridlist = ds_list_create();

GMUI_AddLayer(0,0,0);


// Error management (DEBUG)
GMUI_Error[0] = "";
GMUI_ErrorNumber = 0;

// Initial Disable steps for the Grid checks
InitialDisable = 5;


// Map setup for control name keys to instances
GMUI_map = ds_map_create();

// List of all controls
GMUI_controlList = ds_list_create();

// Create all of the default control settings
GMUI_SetControlDefaults();

// Currently hovering or selecting on control for controls to revert if not them
HoveringControl = -1;
SelectedControl = -1;
PreviousSelectedControl = -1;


// Grouping variables (handled in GMUI_AddLayer())
// List of groups per layer [layer number; default 0]
//GMUI_groupList[0] = ds_list_create();
// List of controls per group [layer number, group number]
//GMUI_groupControlList[0,0] = ds_list_create();

//Positioning
GMUI_groupCellX[0,0] = 0;
GMUI_groupCellY[0,0] = 0;
GMUI_groupActualX[0,0] = 0;
GMUI_groupActualY[0,0] = 0;
GMUI_groupRelativeX[0,0] = 0;
GMUI_groupRelativeY[0,0] = 0;
GMUI_groupCellsW[0,0] = 0;
GMUI_groupCellsH[0,0] = 0;
GMUI_groupRelativeCellX[0,0] = 0;
GMUI_groupRelativeCellY[0,0] = 0;
GMUI_groupAnchor[0,0] = global.GMUIAnchorTopLeft;

// Call the form code to create the interface
GMUI_SetForm(argument0);
GMUI_GridSetRegions();

// Upon success, give the GMUI id back
return GMUInumber;


#define GMUI_CreateGroup
///GMUI_CreateGroup (layer number, group number, cell# x, cell# y, cells wide, cells high, Anchor)
///Adds a group to a GMUI layer that controls can be put into


// Arguments
var _groupNumber,_CellX,_CellY,_layerNumber,_Anchor;
_groupNumber = argument0;
_CellX = argument1;
_CellY = argument2;
_layerNumber = argument3;
_Anchor = argument4;


// Validate
if (!is_real(_groupNumber) || !is_real(_layerNumber) || !is_real(_CellX) || !is_real(_CellY)) {
    GMUI_ThrowError("Invalid parameters for GMUI_CreateGroup");
    return false;
}

if (_groupNumber <= 0) {
    GMUI_ThrowError("Group number must be greater than 0");
    return false;
}

if (!GMUI_LayerExists(_layerNumber)) {
    GMUI_ThrowError("Layer " + string(_layerNumber) + " doesn't exist. GMUI_CreateGroup");
    return false;
}

// Create group; add to GMUI group list and create a control list
ds_list_add((GMUII()).GMUI_groupList[_layerNumber],_groupNumber);

with (GMUII()) {
    GMUI_groupControlList[_layerNumber,_groupNumber] = ds_list_create();

    // Set defaults
    GMUI_groupRelativeX[_layerNumber,_groupNumber] = 0;
    GMUI_groupRelativeY[_layerNumber,_groupNumber] = 0;
    
    // Set position
    GMUI_groupCellX[_layerNumber,_groupNumber] = GMUI_GetAnchoredCellX(ds_grid_width((GMUII()).GMUI_grid[_layerNumber]),_CellX,_Anchor);
    GMUI_groupCellY[_layerNumber,_groupNumber] = GMUI_GetAnchoredCellY(ds_grid_height((GMUII()).GMUI_grid[_layerNumber]),_CellY,_Anchor);
    GMUI_groupActualX[_layerNumber,_groupNumber] = GMUI_CellGetActualX(GMUI_groupCellX[_layerNumber,_groupNumber]);
    GMUI_groupActualY[_layerNumber,_groupNumber] = GMUI_CellGetActualY(GMUI_groupCellY[_layerNumber,_groupNumber]);
    GMUI_groupCellsW[_layerNumber,_groupNumber] = 1;
    GMUI_groupCellsH[_layerNumber,_groupNumber] = 1;
    GMUI_groupRelativeCellX[_layerNumber,_groupNumber] = _CellX;
    GMUI_groupRelativeCellY[_layerNumber,_groupNumber] = _CellY;
    GMUI_groupAnchor[_layerNumber,_groupNumber] = _Anchor;
}



return true;

#define GMUI_DrawDebug
// DEBUGGING SCRIPT! Call this in the draw event of the GMUI main object 
// Run only if DebugData is on
if (DebugData) {

    var gridW,gridH,w,h;
    gridW = ds_grid_width((GMUII()).GMUI_grid[0]);
    gridH = ds_grid_height((GMUII()).GMUI_grid[0]);
    
    // draw the grid lines 
    color_alpha(c_black,0.1);
    for (w=0;w<gridW;w+=1) {
        draw_line(w*cellsize,0,w*cellsize,room_height);
    }
    for (h=0;h<gridH;h+=1) {
        draw_line(0,h*cellsize_h,room_width,h*cellsize_h);
    }
    
    // draw the errors
    if (GMUI_ErrorNumber > 0) {
        color_alpha(c_red,0.5);
        align(fa_center,fa_bottom);
        draw_text(room_width/2,room_height-64,string(GMUI_ErrorNumber) + ".) " + GMUI_LastError());
    }
    
    
    // draw the group boundaries
    color_alpha(c_green,0.5);
    var groupId, layer;
    for(i=0;i<ds_list_size((GMUII()).GMUI_gridlist);i+=1) {
        layer = ds_list_find_value((GMUII()).GMUI_gridlist,i);
        
        for(j=0;j<ds_list_size((GMUII()).GMUI_groupList[layer]);j+=1) {
            groupId = ds_list_find_value((GMUII()).GMUI_groupList[layer],j);
            
            draw_rectangle(GMUI_groupActualX[layer,groupId],GMUI_groupActualY[layer,groupId],
                GMUI_groupActualX[layer,groupId] + GMUI_groupCellsW[layer,groupId]*cellsize,
                GMUI_groupActualY[layer,groupId] + GMUI_groupCellsH[layer,groupId]*cellsize_h,
                true);
        }
    }


}

#define GMUI_GetControl
///GMUI_GetControl("ControlName")
///Return the control id back to use in user code

with (GMUII()) {
    // Retrieve control from the reference map
    var control;
    control = ds_map_find_value(GMUI_map,string(argument0));
    if (string(control) == "0")
        return -1;
    else
        return control;
}

#define GMUI_GetValue
///GMUI_GetValue("ControlName")
///Return the value of a control back to use in user code

with (GMUII()) {
    // Retrieve control from the reference map
    var control;
    control = ds_map_find_value(GMUI_map,string(argument0));
    if (string(control) == "0")
        return 0;
    else
        return (control).value;
}

#define GMUI_GetValueString
/// Return the value string of a control back to use in user code
// argument0 is the string of the key

with (GMUII()) {
    // Retrieve control from the reference map
    var control;
    control = ds_map_find_value(GMUI_map,string(argument0));
    if (string(control) == "0")
        return 0;
    else
        return (control).valueString;
}

#define GMUI_GroupHide
///GMUI_GroupHide(group number, layer number, Hide(1) or show(0))
/// Hide all of the controls within the specified group

var _Group, _Layer, _Hide, i, ctrl;
_Group = argument0;
_Layer = argument1;
_Hide = argument2;

// Change the value for each of the controls within the group
for(i=0;i<ds_list_size((GMUII()).GMUI_groupControlList[_Layer,_Group]);i+=1) {
    // Get the control id
    ctrl = ds_list_find_value((GMUII()).GMUI_groupControlList[_Layer,_Group],i);
    
    if (!instance_exists(ctrl))
    {
        GMUI_ThrowError("Control no longer exists. GMUI_GroupHide(" + _Layer + "," + _Group + ")");
    }
    else {
        (ctrl).Hidden = _Hide;
    }
}

#define GMUI_GroupSetPosition
///GMUI_GroupSetPosition(Layer Number, Group Number, Cell X, Cell Y, X Adjustment, Y Adjustment)
///Change the position of the group (and all of the controls inside it)

// Arguments
var SCRIPT,_LayerNumber,_GroupNumber,_CellX,_CellY,_AdjustmentX,_AdjustmentY, ctrl;
SCRIPT = "GMUI_GroupSetPosition";
_LayerNumber = argument0;
_GroupNumber = argument1;
_CellX = argument2;
_CellY = argument3;
_AdjustmentX = argument4;
_AdjustmentY = argument5;

// Validate
if (!is_real(_GroupNumber) || !is_real(_LayerNumber) || !is_real(_CellX) || !is_real(_CellY)) {
    GMUI_ThrowErrorDetailed("Invalid parameters",SCRIPT);
    return false;
}

if (_GroupNumber <= 0) {
    GMUI_ThrowErrorDetailed("Group number must be greater than 0",SCRIPT);
    return false;
}

if (!GMUI_LayerExists(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Layer " + string(_LayerNumber) + " doesn't exist",SCRIPT);
    return false;
}

if (!GMUI_GroupExists(_LayerNumber,_GroupNumber)) {
    GMUI_ThrowErrorDetailed("Group " + string(_GroupNumber) + " doesn't exist on layer " + string(_LayerNumber),SCRIPT);
    return false;
}

// Set position by anchor of the group
GMUI_GroupSetPositionAnchored(_LayerNumber, _GroupNumber, _CellX, _CellY, _AdjustmentX, _AdjustmentY, (GMUII()).GMUI_groupAnchor[_LayerNumber,_GroupNumber]);

#define GMUI_GroupSetPositionActual
///GMUI_GroupSetPositionActual(Layer Number, Group Number, x, y)
///Set a group to a position in the room by x, y

var _LayerNumber, _GroupNumber, _xcord, _ycord, _adjx, _adjy;
_LayerNumber = argument0;
_GroupNumber = argument1;
_xcord = argument2;
_ycord = argument3;

// Validate
if (!is_real(_GroupNumber) || !is_real(_LayerNumber) || !is_real(_xcord) || !is_real(_ycord)) {
    GMUI_ThrowError("Invalid parameters for GMUI_GroupSetPositionActual");
    return false;
}

if (_GroupNumber <= 0) {
    GMUI_ThrowError("Group number must be greater than 0");
    return false;
}

if (!GMUI_LayerExists(_LayerNumber)) {
    GMUI_ThrowError("Layer " + string(_LayerNumber) + " doesn't exist. GMUI_GroupSetPositionActual");
    return false;
}

if (!GMUI_GroupExists(_LayerNumber,_GroupNumber)) {
    GMUI_ThrowError("Group " + string(_GroupNumber) + " doesn't exist on layer " + string(_LayerNumber) + ". GMUI_GroupSetPositionActual");
}

_adjx = _xcord - GMUI_CellGetActualX(GMUI_GridGetMouseCellX(_xcord));
_adjy = _ycord - GMUI_CellGetActualY(GMUI_GridGetMouseCellY(_ycord));

// Set position by default anchor (topleft), and adjustment to the given coordinates
GMUI_GroupSetPositionAnchored(_LayerNumber,_GroupNumber,GMUI_GridGetMouseCellX(_xcord),GMUI_GridGetMouseCellY(_ycord),_adjx,_adjy,0);

#define GMUI_GroupSetSize
///GMUI_GroupSetSize(Group, cells wide, cells high, Layer)
///Set the cell size of the group

var _groupNumber, _CellsW, _CellsH, _layerNumber;
_groupNumber = argument0;
_CellsW = argument1;
_CellsH = argument2;
_layerNumber = argument3;

GMUI_groupCellsW[_layerNumber,_groupNumber] = _CellsW;
GMUI_groupCellsH[_layerNumber,_groupNumber] = _CellsH;

#define GMUI_Init
///GMUI_Init() Call this initialization script before creating any GMUI interfaces
//
// !WARNING! MODIFYING THE GMUI SCRIPTS CAN BREAK FUNCTIONALITY AND CAUSE ERRORS! TRY TO EDIT THE OBJECTS INSTEAD!
//
// Copyright 2016 Alert Studios (Mark Palnau). Initially designed by Alert Studios and released as Open-Source.
//
// If you would like to help make GMUI better, please submit a ticket or pull request on the project on GitHub!
// https://github.com/AlertStudios/GMUI-Framework
//
//

// SET THIS VALUE TO TRUE IF RUNNING IN GAME MAKER 8.x
global.GMUIGameMaker8 = true;


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

// Control datatypes
global.GMUIDataTypeString = 0;
global.GMUIDataTypeInteger = 1;
global.GMUIDataTypeDecimal = 2;
global.GMUIDataTypeButton = 3;


#define GMUI_MouseInGroupRegion
///GMUI_MouseInGroupRegion(group number, layer number)
///Returns if the mouse is in the bounds of the group

var SCRIPT,_Group, _Layer, _mouseCellX, _mouseCellY;
SCRIPT = "GMUI_MouseInGroupRegion";
_Group = argument0;
_Layer = argument1;

// Check the parameters
if (!GMUI_LayerExists(_Layer)) {
    GMUI_ThrowErrorDetailed("Layer " + string(_Layer) + " doesn't exist",SCRIPT);
    return false;
}

if (!GMUI_GroupExists(_Layer,_Group)) {
    GMUI_ThrowErrorDetailed("Group " + string(_Group) + " doesn't exist on layer " + string(_Layer),SCRIPT);
    return false;
}

_mouseCellX = GMUI_GridGetMouseCellX(mouse_x);
_mouseCellY = GMUI_GridGetMouseCellY(mouse_y);

if (_mouseCellX < (GMUII()).GMUI_groupCellX[_Layer,_Group] || _mouseCellY < (GMUII()).GMUI_groupCellY[_Layer,_Group] || 
    _mouseCellX > (GMUII()).GMUI_groupCellX[_Layer,_Group] + (GMUII()).GMUI_groupCellsW[_Layer,_Group] ||
    _mouseCellY > (GMUII()).GMUI_groupCellY[_Layer,_Group] + (GMUII()).GMUI_groupCellsH[_Layer,_Group]) {
    return false;
}

return true;

#define GMUI_SetValue
///GMUI_SetValue("ControlName", value, value type - string:0, integer:1, decimal:2)
///Set the value of a control to GMUI to reference in user code (GMUI_GetValue)

with (GMUII())
{
    // Retrieve control from the reference map
    var control,a2,c,_invalid;
    control = ds_map_find_value(GMUI_map,argument0);
    _invalid = false;
    
    a2 = string(argument2);
    // If integer or decimal, we will need to do some work to convert the string to an acceptable format
    if (a2 == "0" || string_lower(a2) == "string")
    {
        (control).value = string_copy(string(argument1),0,(control).ControlMaxStringLength);
        (control).valueString = (control).value;
    }
    else if (a2 == "1" || string_lower(a2) == "integer" || string_lower(a2) == "int")
    {
        (control).value = minmax(round(real(argument1)),(control).ControlMinValue,(control).ControlMaxValue);
        (control).valueString = string((control).value);
    }
    else if (a2 == "2" || string_lower(a2) == "double")
    {
        (control).value = minmax(real(argument1),(control).ControlMinValue,(control).ControlMaxValue);
        // Remove any trailing zeros if option is turned on, otherwise use simple format
        var formatValue,c,z,strLenFmtVal;
        formatValue = string_format((control).value,(control).ControlMaxStringLength,(control).ControlMaxDecimalLength);
        
        if (GMUIRemoveExtraDecimalZeros && formatValue != "0")
        {
            z = 0;
            strLenFmtVal = string_length(formatValue);
            for (c=0;c<=strLenFmtVal;c+=1) {
                if (string_char_at(formatValue,strLenFmtVal-c) == '0')
                    z += 1;
                else
                    break;
            }
            formatValue = string_copy(formatValue,0,strLenFmtVal-z);
            if (string_char_at(formatValue,string_length(formatValue)) == '.')
            formatValue = string_copy(formatValue,0,string_length(formatValue)-1);
        }
        (control).valueString = formatValue;
    }
    else
    {
        GMUI_ThrowError("Unknown value type for GMUI_SetValue()");
        _invalid = true;
    }
    
    // If a value was set and a script is assigned to value change, execute it
    if (!_invalid && GMUI_IsScript((control).ValueChangedActionScript)) {
        script_execute((control).ValueChangedActionScript);
    }
}

#define GMUI_SetForm
/// GMUI_SetForm(name of form script)
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

if (is_real(OptionalInterfaceName)) {
    if (OptionalInterfaceName > -1) {
        if (script_exists(OptionalInterfaceName)) {
            script_execute(OptionalInterfaceName);
        }
        else {
            GMUI_ThrowError("Form doesn't exist");
        }
    }
}

#define GMUI_SwitchToLayer
///GMUI_SwitchToLayer(Layer number)
///Switches the active layer

// Arguments
var SCRIPT,_LayerNumber;
SCRIPT = "GMUI_SwitchToLayer";
_LayerNumber = argument0;

// Validate
if (!is_real(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Invalid parameter",SCRIPT);
    return false;
}

if (!GMUI_LayerExists(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Layer " + string(_LayerNumber) + " doesn't exist",SCRIPT);
    return false;
}

(GMUII()).UILayer = _LayerNumber;


// .... Disable hovering and selection on all controls

#define GMUI_TypeDecimal
///GMUI_TypeDecimal()
///Returns the decimal data type

return global.GMUIDataTypeDecimal;

#define GMUI_TypeInt
///GMUI_TypeInt()
///Returns the integer data type

return global.GMUIDataTypeInteger;

#define GMUI_TypeString
///GMUI_TypeString()
///Returns the string data type

return global.GMUIDataTypeString;

#define GMUIid
///GMUIid(number)
///Returns the GMUI object instance with the given GMUI number and sets current grid ref to it
// Usage: with (GMUIid(1)) { do something; }
// Alternate Usage: if (GMUIid(1)) { call GMUI commands; }

if (!is_real(argument0))
    return -1;

if (argument0 > 0 && argument0 <= global.GMUIii) {
    if (instance_exists(global.GMUIiid[argument0])) {
        // Change current GMUI to this one:
        global.GMUIiid[0] = global.GMUIiid[argument0];
        return global.GMUIiid[argument0];
    }
}

return -1;

#define GMUIself
///GMUIself()
///Returns id of the GMUI object instance or -1 if not
// Usage: with (GMUIself()) { do something; }
// Alternate Usage: if (GMUIself()) { call GMUI commands; }

var _gmuii,_G;
_gmuii = -1;

for (_G=1;_G<=global.GMUIii;_G+=1) {
    if (id = global.GMUIiid[_G]) {
        _gmuii = _G;
        break;
    }
}

if (_gmuii > -1) {
    // Change current GMUI to this one:
    global.GMUIiid[0] = id;
    return global.GMUIiid[0];
}

return -1;

#define GMUI_CellGetActualX
///GMUI_CellGetActualX(X Cell #);
/// Internal: Return the actual X of the cell number

return argument0 * ((GMUII()).cellsize);

#define GMUI_CellGetActualY
///GMUI_CellGetActualY(Y Cell #);
/// Internal: Return the actual Y of the cell number

return argument0 * ((GMUII()).cellsize_h);

#define GMUI_ControlActionScript
///GMUI_ControlActionScript(control object) Runs the script assigned to the control, if there is one

if (!GMUI_IsControlID(argument0))
{
    GMUI_ThrowError("Invalid control for GMUI_ActionScript");
    return false;
}

if ((argument0).ActionScript == -1) {
    GMUI_ThrowError("Action for " + (argument0).valueName +" not implemented");
}
else if (!script_exists((argument0).ActionScript)) {
    GMUI_ThrowError("Invalid script assigned to " + (argument0).valueName + " : " + string((argument0).ActionScript));
}
else {
    script_execute((argument0).ActionScript);
    return true;
}

return false;

#define GMUI_ControlDraw
///GMUI_ControlDraw(Draw the control [bool])
/// The actions done per step for a control added to the grid, along with drawing things


// TEMPORARY SOLUTION??:
if (Hidden) return false;

// STEP actions:
if (Selected) {
    // Filter keyboard string to type of input allowed
    if (ControlInput && (keyboard_lastkey > 20 || keyboard_lastkey == vk_backspace)) {
        if (keyboard_check(vk_anykey)) {
            //If 'Overwriting', then reset back to just selected
            if (DoubleSelected) {
                if (string_length(keyboard_string) > 0 && string_length(GMUI_ControlFilterInput(ControlType,keyboard_lastchar)) > 0)
                    keyboard_string = string_copy(keyboard_string,string_length(keyboard_string),1);
                else
                    keyboard_string = "";
                    
                DoubleSelected = false;
            }
            else {
                // On keypress, sanitize input per the type
                keyboard_string = GMUI_ControlFilterInput(ControlType,keyboard_string);
                
                // Max characters allowed for the control's string
                if (ControlMaxStringLength > 0)
                    keyboard_string = string_copy(keyboard_string,1,ControlMaxStringLength);
            }
        }
        
        // Only does assignment of the value once the key is released
        if (keyboard_check_released(vk_anykey)) {
            // On release, we need to filter again incase somebody "fat-fingers" multiple keys fast enough to miss the first filter.. interesting.
            keyboard_string = GMUI_ControlFilterInput(ControlType,keyboard_string);
            
            // Assign keyboard string as the value string
            valueString = keyboard_string;
            
            if (ControlIsNumeric) {
                // As long as the string is valid, assign stripped zeros to value string, and then assign value
                if (valueString != "." && valueString != "-") {
                    valueString = keyboard_string;
                    value = real(valueString);
                    if (ControlDataType == global.GMUIDataTypeInteger) {
                        value = round(value);
                    }
                    
                    // Found the change!
                    valueChangeDetected = 1;
                }
            }
            else if (ControlIsString) {
                value = valueString;
            }
        }
    }
}

if (valueChangeDetected) {
    // This may need some checks on if it should be allowed to set value... we'll see
                
    // String form of the data type
    //var DataType;
    //if (ControlDataType == global.GMUIDataTypeInteger) {
    //    DataType = "integer";
    //}
    //else if (ControlDataType == global.GMUIDataTypeDecimal) {
    //    DataType = "double";
    //}
    //else {
    //    DataType = "string";
    //}
    GMUI_SetValue(valueName,value,ControlDataType);
    
    //Reset
    valueChangeDetected = 0;
}



// DRAW //

if (argument0 == true) {
    // Cell x,y and Cell width/height x,y
    var cx, cy, cwx, chy, padx;
    //cx = (GMUII()).cellsize * CellX + RelativeX;
    //cy = (GMUII()).cellsize_h * CellY + RelativeY;
    cx = ActualX + RelativeX;
    cy = ActualY + RelativeY;
    
    if (ActualW > 0)
        cwx = cx + ActualW;
    else
        cwx = cx + GMUI_CellGetActualX(CellWide);
    if (ActualH > 0)
        chy = cy + ActualH;
    else
        chy = cy + GMUI_CellGetActualY(CellHigh);
        
    padx = 4;
    
        
    // Start drawing the control
    if (ControlInput || ControlDataType == global.GMUIDataTypeButton) {
        if (sprite_exists(ControlGraphic)) {
            // Sprite has been substituted for the default drawing
            var subi; subi = ControlGraphicIndex;
            if (Hovering) subi = ControlGraphicHoveringIndex;
            if (Selected) subi = ControlGraphicSelectedIndex;
            
            draw_sprite_ext(ControlGraphic,subi,cx,cy,ControlGraphicXScale,ControlGraphicYScale,ControlGraphicRotation,ControlGraphicColor,ControlGraphicAlpha);
        }
        else {
            // Background
            color_alpha(ControlBackgroundColor,ControlBackgroundAlpha);
            draw_rectangle(cx, cy, cwx, chy, 0);
            
            // Border
            color_alpha(ControlBorderColor,ControlBackgroundAlpha);
            draw_rectangle(cx, cy, cwx, chy, 1);
        
    
            if (Hovering || Selected) {
                // Draw the hovering effect
                if (!Selected)
                    color_alpha(ControlHoverColor,ControlHoverAlpha);
                else
                    color_alpha(ControlSelectColor,ControlSelectAlpha);
                draw_rectangle(cx+1,cy+1,cwx-1,chy-1, ControlHoverBorder);
            }
        }
    }
    
    if (DoubleSelected && ControlInput) {
        // Draw 'Overwrite' affect
        color_alpha(ControlOverwriteColor,ControlOverwriteAlpha);
        draw_rectangle(cx+2,cy+2,cwx-2,chy-2,0);
    }
    
    // Draw special features for the other types
    // Picker types (integer, double, etc)
    if (ControlPicker) {
        // draw arrows (origin should be on the right and to the corner it is placed at)
        // Top arrow and bottom arrow
        draw_sprite(ControlPickerSpriteRightOrUp,0,cwx-2,cy+2);
        draw_sprite(ControlPickerSpriteLeftOrDown,0,cwx-2,chy-2);
        
        if (ControlPickerDirection == global.GMUIDirectionTypeSideVertical) {
            color_alpha(ControlHoverColor,ControlHoverAlpha);
            switch (HoveringDirection) {
                case global.GMUIHoveringDirection_Up:
                    draw_rectangle(cwx-2-ControlPickerWidth,cy,cwx-1,cy+(chy-cy)/2,0);
                    break;
                case global.GMUIHoveringDirection_Down:
                    draw_rectangle(cwx-2-ControlPickerWidth,chy-(chy-cy)/2,cwx-1,chy,0);
                    break;
            }
        }
        
    }
    
    
    // Draw the text inside of the keyboard string or value
    var Text, dtx, midHeight;
    if (ControlInput) {
        if (Selected)
            Text = keyboard_string;
        else
            Text = valueString;
    }
    else if (ControlDataType == global.GMUIDataTypeButton) {
        Text = ControlButtonText;
    }
    else if (ControlDataType == global.GMUIDataTypeString) {
        Text = valueString;
    }
    else
        Text = "";
    
    // Default is for fa_left:
    dtx = cx + padx;    
    if (ControlFontAlign == fa_center)
        dtx = cx+(cwx-cx)/2;
    else if (ControlFontAlign == fa_right)
        dtx = cwx - padx;
    else if (ControlFontAlign != fa_left) {
        ControlFontAlign = (GMUII()).ControlFontAlign;
        GMUI_ThrowErrorDetailed("Invalid font align","GMUI_ControlDraw");
    }
    
    if (ActualH > 0)
        midHeight = ActualH / 2;
    else
        midHeight = CellHigh * (GMUII()).cellsize_h / 2;
        
    // Set control font and alignment
    draw_set_font(ControlFont);
    align(ControlFontAlign,ControlFontAlignV);
    
    // Specific controls may override display
    if (ControlDataType == global.GMUIDataTypeButton && ControlButtonTextHoveringOn && Hovering)
        color_alpha(ControlButtonTextHoverColor,ControlFontAlpha);
    else
        color_alpha(ControlFontColor,ControlFontAlpha);
        
    // TEMPORARY SOLUTION! :
    if (Disabled)
        draw_set_alpha(ControlFontAlpha / 2);
        
    // Button with graphic inside
    if (ControlDataType == global.GMUIDataTypeButton) {
        if (sprite_exists(ControlButtonGraphic)) {
            draw_sprite(ControlButtonGraphic,0,dtx, cy + midHeight);
            dtx += sprite_get_width(ControlButtonGraphic) + padx;
        }
    }
    
    // Draw value string or button text
    if (ControlShowCursor && Selected && !DoubleSelected)
        Text = Text + "|";
    draw_text(dtx, cy + midHeight,Text);
    
}
//

#define GMUI_ControlInit
///GMUI_ControlInit(control object to instantiate)
/// Initialize the values to use with a GMUI control
// These values are controlled by the GMUI controller, and if commented, they are actually intialized by the Add script.

var i; i = argument0;

if (!instance_exists(i))
    return false;

i.Hovering = 0;
i.Selected = 0;
i.DoubleSelected = 0;

i.ControlType = "";
i.ControlDataType = global.GMUIDataTypeString; // Default (0)

// Redundant based on the datatype
i.ControlIsNumeric = false;
i.ControlIsString = true;
i.ControlInput = true;
i.ControlPicker = false;

// For specific controls
i.checkMouseX = 0;
i.checkMouseY = 0;
i.HoveringDirection = 0; // 0 = middle/none (HoveringDirection_None), HoveringDirection_Right=1;HoveringDirection_Up=2;HoveringDirection_Left=3;HoveringDirection_Down=4;

// Custom disable
i.Disabled = 0;

// Custom hidden
i.Hidden = 0;

// NonClickable may be used when a control is moving, for instance. It does not show disabled, but will not register a click
i.NonClickable = 0;

// Custom Actions
i.ActionScript = -1;
i.HoverActionScript = -1;
i.SelectingActionScript = -1;
i.ValueChangedActionScript = -1;

// All of these values are set when added ::

// Layer can disable the control if a higher layer is opened (0 is default)
//Layer = 0;

// Group allows actions for a group of controls, such as disabling, moving, and hiding (0 is no-group)
//Group = 0;

// Cells work like the room grid and are assigned numbers baised on the cell dimensions given
//CellWide = 1;
//CellHigh = 1;
//CellX = 0;
//CellY = 0;

//
//ControlFontAlign = fa_left;
i.ControlFontAlignV = fa_middle;

// ::


// Positioning variables
i.IsAdjusted = false;
// Actual size may be used to use pixel-baised boundary box for the control; still must be within cell block (0 is full cell)
i.ActualW = 0;
i.ActualH = 0;

// Relative position is used if the boundary box should be adjusted
i.RelativeX = 0;
i.RelativeY = 0;

// Actual location may be used when moving controls, however the selection will need to change the grid cell it is in
i.ActualX = x;
i.ActualY = y;

// Graphical variables
i.outboundMax = ceil(room_speed/3);
i.outbound = 0;
i.inboundMax = ceil(room_speed/3);
i.inbound = 0;

// Value variables
i.value = 0;
i.valueString = "0";
i.valuePrevious = i.value;
i.valueStringPrevious = i.valueString;
i.valueChangeDetected = 0;




/// ???:
// The control will be disabled for this many steps before allowing action
//i.Disable = floor(room_speed/20);

#define GMUI_ControlFilterInput
///GMUI_ControlFilterInput(Control Type, Input String - keyboard_string)
///Modifies keyboard string to be acceptable for the control. Typcially called on a keypress.
// Returns: new input string

var filter, CT, ks, _getDataType, isNumeric;
CT = string_lower(string_replace(string(argument0)," ",""));
ks = argument1;

_getDataType = GMUI_GetDataType(CT);

if (_getDataType == global.GMUIDataTypeInteger || _getDataType == global.GMUIDataTypeDecimal)
    isNumeric = true;
else
    isNumeric = false;

    
// Numerics
if (isNumeric) { 
    // Check that the last character entered is valid
    filter = string_copy(ks,string_length(ks),1);
    if (string_digits(filter) == "" && filter != ".") {
        if (!(string_length(ks) == 1 && string_copy(ks,1,1) == "-"))
            ks = string_copy(ks,1,string_length(ks)-1);
    }
    
    // Limitation of a numeric in GM
    if (string_length(string_digits(ks)) > 17)
        ks = string_copy(ks,1,18-(18 - string_length(string_digits(ks))));
    
    // Only one minus sign and decimal point allowed
    filter = string_copy(ks,string_length(ks),1);
    if (filter == "-" || filter == ".")
    {
        if (string_count("-",ks) > 1 || string_count(".",ks) > 1)
            ks = string_copy(ks,1,string_length(ks)-1);
    }
    else
    {
        // Apply zero's rule
        if (string_copy(ks,1,2) == "00")
            ks = string_copy(ks,2,string_length(ks)-1);
        else if (string_copy(ks,1,1) == "0" && string_length(ks) > 1 && string_copy(ks,2,1) != ".")
            ks = string_copy(ks,2,string_length(ks)-1);
    }
}
else if (_getDataType == global.GMUIDataTypeString) {
    // Any string limitations can go here.
    // (They will probably be optional, like only allow alphabet or alphanumeric or custom or something...
}

return ks;


#define GMUI_ControlSetDefaultAttributes
///GMUI_ControlSetDefaultAttributes(id)
/// Set the default attributes of the control from the controller

if (!instance_exists(argument0))
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetDefaultAttributes");
    return false;
}

with (argument0)
{
    GMUI_ControlSetAttributes(
    (GMUII()).ControlMaxStringLength,
    (GMUII()).ControlMaxDecimalLength,
    (GMUII()).ControlMinValue,
    (GMUII()).ControlMaxValue
    );
}


return true;

#define GMUI_ControlSetDefaultButton
///GMUI_ControlSetDefaultButton(id)
/// Set the default attributes of the control from the controller

if (!instance_exists(argument0))
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetDefaultButton");
    return false;
}

with (argument0)
{
    GMUI_ControlSetButton(
    (GMUII()).ControlButtonText,
    (GMUII()).ControlButtonGraphic,
    (GMUII()).ControlFontAlign,
    (GMUII()).ControlButtonTextHoverColor
    );
}


return true;

#define GMUI_ControlSetDefaultFontStyle
///GMUI_ControlSetDefaultStyle(id)
/// Get the default style values from the grid controller

if (!instance_exists(argument0))
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetDefaultFontStyle");
    return false;
}

with (argument0)
{
    GMUI_ControlSetFontStyle(
    (GMUII()).ControlFont,
    (GMUII()).ControlFontColor,
    (GMUII()).ControlFontAlign
    );
}

return true;

#define GMUI_ControlSetDefaultPicker
///GMUI_ControlSetDefaultPicker(id)
/// Set the default attributes of the control from the controller

if (!instance_exists(argument0))
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetDefaultPicker");
    return false;
}

with (argument0)
{
    GMUI_ControlSetPicker(
    (GMUII()).ControlPickerWidth,
    (GMUII()).ControlPickerHeight,
    (GMUII()).ControlPickerDirection,
    (GMUII()).ControlPickerSpriteRightOrUp,
    (GMUII()).ControlPickerSpriteLeftOrDown
    );
}


return true;

#define GMUI_ControlSetDefaultSprite
///GMUI_ControlSetDefaultSprite(id)
///Set the default attributes of the control from the controller

if (!instance_exists(argument0)) {
    GMUI_ThrowErrorDetailed("Invalid control","GMUI_ControlSetDefaultSprite");
    return false;
}

with (argument0) {
    GMUI_ControlSetSpriteExt(
        (GMUII()).ControlGraphic,
        (GMUII()).ControlGraphicIndex,
        (GMUII()).ControlGraphicHoveringIndex,
        (GMUII()).ControlGraphicSelectedIndex,
        (GMUII()).ControlGraphicXScale,
        (GMUII()).ControlGraphicYScale,
        (GMUII()).ControlGraphicColor,
        (GMUII()).ControlGraphicAlpha
    );
    
    ControlGraphicRotation = 0;
}


return true;

#define GMUI_ControlSetDefaultStyle
///GMUI_ControlSetDefaultStyle(id)
/// Get the default style values from the grid controller

if (!instance_exists(argument0))
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetDefaultStyle");
    return false;
}

with (argument0)
{
    GMUI_ControlSetStyle(
    (GMUII()).ControlBackgroundColor,
    (GMUII()).ControlBorderColor,
    (GMUII()).ControlHoverColor,
    (GMUII()).ControlHoverBorder,
    (GMUII()).ControlHoverAlpha,
    (GMUII()).ControlOverwriteColor,
    (GMUII()).ControlOverwriteAlpha,
    (GMUII()).ControlSelectColor,
    (GMUII()).ControlSelectAlpha,
    (GMUII()).ControlShowCursor
    );
}

return true;

#define GMUI_ControlSetType
///GMUI_ControlSetType("Control Type")
///Set the type variables based on the control the developer wants to make

var IID,            _type,              isinput,    ispicker,   _getType;
    IID=argument0;  _type=argument1;    isinput=0;  ispicker=0; _getType=0;

if (!GMUI_IsControlID(IID) && IID != GMUII()) {
    GMUI_ThrowError("Invalid control for GMUI_ControlSetType");
    return "";
}

// Sanitation of type input from developer
_type = string_lower(string_replace(_type," ",""));


// Set if input, or button, or etc 
switch (_type) {
    case "intpicker":
    case "doublepicker":
        ispicker = 1;
        
    case "textint":
    case "textdecimal":
    case "textstring":
        isinput = 1;
        
        break;
    case "button":
    case "textbutton":
        
        
        break;
    case "slider":
    case "label":
    case "dropdown":
        
        break;
    default:
        // no match; override to show invalid:
        _type = "invalid";
        
        break;
}

(IID).ControlType = _type;
(IID).ControlInput = isinput;
(IID).ControlPicker = ispicker;


// Set the data type
_getType = GMUI_GetDataType(_type);
(IID).ControlDataType = _getType;

if (_getType == global.GMUIDataTypeInteger || _getType == global.GMUIDataTypeDecimal) {
    (IID).ControlIsNumeric = true;
    (IID).ControlIsString = false;
}
else if (_getType == global.GMUIDataTypeString) {
    (IID).ControlIsString = true;
    (IID).ControlIsNumeric = false;
}

// Return sanitized and processed type back
return _type;



#define GMUI_GetAnchoredCellX
///GMUI_GetAnchoredCellX(GMUII, Layer, Cell X given, Anchor Type)
/// Returns the new X cell position in the grid based on the anchoring


// Width of a GMUI grid is usually: ds_grid_width((GMUII()).GMUI_grid[Layer]);

var __GridW, __CellX, __Anchor;
__GridW = argument0;
__CellX = argument1;
__Anchor = argument2;

// Left anchors by default will not need to calculate the grid dimensions or any adjustments
if (__Anchor == global.GMUIAnchorTopLeft || __Anchor == global.GMUIAnchorLeft || __Anchor == global.GMUIAnchorBottomLeft) {
    return __CellX;
}
else {
    // The Mid X's, else the Right X's 
    if (__Anchor == global.GMUIAnchorTop || __Anchor == global.GMUIAnchorBottom) {
        // Half-width accounts for the cell 0 added to the width.
        // (On even widths, 0 is left of the middle and 1 is right of the middle)
        return floor(__GridW / 2 - 0.5) + __CellX;
    }
    else if (__Anchor == global.GMUIAnchorTopRight || __Anchor == global.GMUIAnchorRight || __Anchor == global.GMUIAnchorBottomRight)
        return __GridW - __CellX - 1;
    else
        return __CellX;
}

#define GMUI_GetAnchoredCellY
///GMUI_GetAnchoredCellY(GMUII, Layer, Cell Y given, Anchor Type)
/// Returns the new X cell position in the grid based on the anchoring


// Height of a GMUI grid is usually: ds_grid_height((GMUII()).GMUI_grid[Layer]);

var __GridH, __CellY, __Anchor;
__GridH = argument0;
__CellY = argument1;
__Anchor = argument2;

// Top anchors by default will not need to calculate the grid dimensions or any adjustments
if (__Anchor == global.GMUIAnchorTopLeft || __Anchor == global.GMUIAnchorTop || __Anchor == global.GMUIAnchorTopRight) {
    return __CellY;
}
else {  
    // The Mid Y's else the Bottom Y's
    if (__Anchor == global.GMUIAnchorLeft || __Anchor == global.GMUIAnchorRight) {
        // Half-height accounts for the cell 0 added to the height.
        // (On even height, 0 is top of the middle and 1 is bottom of the middle)
        return floor(__GridH / 2 - 0.5) + __CellY;
    }
    else if (__Anchor == global.GMUIAnchorBottomLeft || __Anchor == global.GMUIAnchorBottom || __Anchor == global.GMUIAnchorBottomRight)
        return __GridH - __CellY - 1;
    else
        return __CellY;
}

#define GMUI_GetDataType
///GMUI_GetDataType("Control Type")
///Takes the control type and returns the data type it is
// Datatypes are defined in GMUI_Init()

var _controlType;
    _controlType = string_lower(string_replace(string(argument0)," ",""));
    
switch (_controlType) {
    case "textint":
    case "intpicker":
        return global.GMUIDataTypeInteger;
        break;
    case "textdecimal":
    case "doublepicker":
        return global.GMUIDataTypeDecimal;
        break;
    case "textstring":
    case "label":
        return global.GMUIDataTypeString;
        break;
    case "button":
    case "textbutton":
        return global.GMUIDataTypeButton;
        break;
    default:
        return -1;
        break;
}

#define GMUI_GridEnabled
///GMUI_GridEnabled()
/// Returns if the entire grid is enabled to be used

if (InitialDisable > 0)
{
    InitialDisable -= 1;
    return false;
}
else
{
    return true;
}

#define GMUI_GridDraw
///GMUI_GridDraw()
/// Actions done to operate the grid, executed by the GMUI object in the draw event


// Count down initial disable before executing actions
if (GMUI_GridEnabled())
{
    //do grid stuff:
    
    // Assign mouse values here to easily switch out later if needed
    var MX, MY, inRegion, onDirection;
    MX = mouse_x;
    MY = mouse_y;
    inRegion = false;
    
    // Check if the mouse has moved before checking for any changed selections
    if (MX != mouse_px || MY != mouse_py) {
        // Get the mouse position on the current top layer visible:
        var mouseHor,mouseVert,ctrlObject;
        mouseHor = GMUI_GridGetMouseCellX(MX);
        mouseVert = GMUI_GridGetMouseCellY(MY);

        // Find if there is a control at that position
        ctrlObject = 0;
        if (mouseHor >= GMUI_grid_x[UILayer] && mouseVert >= GMUI_grid_y[UILayer] && mouseHor < GMUI_grid_w[UILayer] && mouseVert < GMUI_grid_h[UILayer])
            ctrlObject = ds_grid_get(GMUI_grid[UILayer],mouseHor+GMUI_grid_x[UILayer],mouseVert+GMUI_grid_y[UILayer]);
            
        if (ctrlObject != 0 && is_real(ctrlObject)) {
            // Found object number, do checks before assigning hovering or selected flag
            if (instance_exists(ctrlObject)) {
            
                if (DebugData) TestHoverObject = ctrlObject;
                if (ctrlObject != previousHoveringControl && !ctrlObject.Disabled && !ctrlObject.NonClickable) {
                    GMUI_ResetControlStatus("Hovering");
                    if (ctrlObject.IsAdjusted) {
                        if (GMUI_MouseInAdjustedRegion(ctrlObject,MX,MY))
                            inRegion = true;
                    }
                    else
                        inRegion = true;
                    
                    if (inRegion) {
                        // The int picker has a region on the right side for up/down
                        if (ctrlObject.ControlType == "intpicker")
                        {
                            onDirection = GMUI_MouseInSpecialRegion(ctrlObject,MX,MY);
                            
                            if (onDirection != global.GMUIHoveringDirection_None)
                                ctrlObject.HoveringDirection = onDirection;
                            else
                                ctrlObject.Hovering = 1;
                        }
                        else {
                            ctrlObject.Hovering = 1;
                        }
                        
                        // Set the hovering control and execute optional hover action if set
                        HoveringControl = ctrlObject;
                        
                        if (GMUI_IsScript(ctrlObject.HoverActionScript)) {
                            script_execute(ctrlObject.HoverActionScript);
                        }
                    }
                    
                }
                
            }
            else
                GMUI_ThrowError("Instance recorded is not a control object or no longer exists @ GMUI_GridStep : " + string(ctrlObject));
        }
        else if (HoveringControl != -1) {
            GMUI_ResetControlStatus("Hovering");
            if (DebugData) TestHoverObject = -1;
        }
    
    
        // Reset previous position
        mouse_px = MX;
        mouse_py = MY;
    }
    
    // Mouse click on grid
    if (mouse_check_button_pressed(mb_left)) {
        GMUI_ResetControlStatus("Selected");
    
        // Get the mouse position on the current top layer visible:
        var mouseHor,mouseVert;
        mouseHor = GMUI_GridGetMouseCellX(MX);
        mouseVert = GMUI_GridGetMouseCellY(MY);
        // Find if there is a control at that position
        ctrlObject = ds_grid_get(GMUI_grid[UILayer],mouseHor,mouseVert);
        if (ctrlObject != 0) {
            if (instance_exists(ctrlObject)) {
                if ((!ctrlObject.Disabled) && (!ctrlObject.NonClickable) && (!ctrlObject.Hidden)) {
                    // Switch between special types, general input types, and other controls
                    if (ctrlObject.ControlType == "intpicker") {
                        switch (ctrlObject.HoveringDirection) {
                            case global.GMUIHoveringDirection_Up:
                            case global.GMUIHoveringDirection_Right:
                                GMUI_SetValue(ctrlObject.valueName,ctrlObject.value + 1,"integer");
                                break;
                            case global.GMUIHoveringDirection_Left:
                            case global.GMUIHoveringDirection_Down:
                                GMUI_SetValue(ctrlObject.valueName,ctrlObject.value - 1,"integer");
                                break;
                            case global.GMUIHoveringDirection_None:
                                GMUI_GridSelect(ctrlObject);
                                break;
                        }
                    }
                    else if (ctrlObject.ControlInput) {
                        GMUI_GridSelect(ctrlObject);
                    }
                    else if (ctrlObject.ActionScript != -1) {
                        // Control buttons clicked
                        GMUI_ControlActionScript(ctrlObject);
                    }
                }
            }
        }
    }
    
    // Any key event will trigger a set value on a selected control in GMUI_ControlDraw, so here    ..
    if (SelectedControl != -1) {
        if (keyboard_check_pressed(vk_tab)) {
            GMUI_GridNextControl();
        }
        else if (keyboard_check_pressed(vk_enter)) {
            GMUI_ResetControlStatus("Selected");
        }
    }
    
    
    
    // Check if the room size has changed to move any anchored controls positions
    // each control needs a relative position...
    

}


#define GMUI_GridSelect
///GMUI_GridSelect(control object)
/// Selects a control object from the grid (Called by GMUI_GridStep)


// Set the keyboard string to the value string
(argument0).valuePrevious = (argument0).value;
(argument0).valueStringPrevious = (argument0).valueString;

keyboard_string = (argument0).valueString;

(GMUII()).SelectedControl = argument0;
(argument0).Selected = 1;

// Double selection will overwrite the current value
if ((GMUII()).PreviousSelectedControl == argument0) {
    if ((GMUII()).GMUIAllowDoubleSelect)
        (argument0).DoubleSelected = 1;   
}
else if (GMUI_IsScript((argument0).SelectingActionScript)) {
    // If there is a script to assigned to run it'll only be done once
    script_execute((argument0).SelectingActionScript);
}

#define GMUI_GridAdjust
///GMUI_GridAdjust(cells wide , cells high)
/// Adjusts grid for all layers of the GMUI instance

var layer;
for(i=0;i<ds_list_size((GMUII()).GMUI_gridlist);i+=1) {

    layer = ds_list_find_value((GMUII()).GMUI_gridlist,i);
    
    if (layer >= 0) {
        GMUI_GridAdjustLayer(layer,argument0,argument1);
    }
}

#define GMUI_GridAdjustLayer
///GMUI_GridAdjustLayer(Layer Number, cells wide, cells high)
/// Adjusts the layer's grid based on new dimensions and moves the controls according to their anchors

// Layer needs to exist
if (!GMUI_LayerExists(argument0))
    return false;


var _Layer, CW, CH;
_Layer = floor(argument0);

// If cells wide/high are 0, then it is assumed to be adjusted to the room dimensions. If using views, the cells should be specified to avoid glitching.
if (argument1 == 0)
    CW = ceil(room_width/(GMUII()).cellsize);
else
    CW = argument1;

if (argument2 == 0)
    CH = ceil(room_height/(GMUII()).cellsize_h);
else
    CH = argument2;

ds_grid_resize((GMUII()).GMUI_grid[_Layer],CW,CH);

// Get grid dimensions
var gridW, gridH, anc, relX, relY, pCellX, pCellY;
gridW = ds_grid_width((GMUII()).GMUI_grid[_Layer]);
gridH = ds_grid_height((GMUII()).GMUI_grid[_Layer]);

// Move any controls that are anchored to other positions
var ctrl;
for(i=0;i<ds_list_size((GMUII()).GMUI_controlList);i+=1) {
    // Get control value
    ctrl = ds_list_find_value((GMUII()).GMUI_controlList,i);
    
    if (!instance_exists(ctrl)) {
        GMUI_ThrowError("Control no longer exists. GMUI_GridAdjustLayer()");
    }
    else if ((ctrl).Layer == _Layer && ctrl.Group == 0) {
        // The relative values when the grid is adjusted has four relative positions: Middle X's, Middle Y's, Right X's, Bottom Y's)
    
        // Use the anchor and position relative to it 
        anc = (ctrl).Anchor;
        relX = (ctrl).RelativeCellX;
        relY = (ctrl).RelativeCellY;
        pCellX = (ctrl).CellX;
        pCellY = (ctrl).CellY;        
        
        // Use grid's dimensions unless part of a group (handled by group move)
        (ctrl).CellX = GMUI_GetAnchoredCellX(gridW,relX,anc);
        (ctrl).CellY = GMUI_GetAnchoredCellY(gridH,relY,anc);
        
        // Actual position based on its grid position
        (ctrl).ActualX = GMUI_CellGetActualX((ctrl).CellX);
        (ctrl).ActualY = GMUI_CellGetActualY((ctrl).CellY);
        
        // Check boundaries
        if (!GMUI_ValidCellBounds(anc,(ctrl).CellX,(ctrl).CellY,gridW,gridH)) {
            GMUI_ThrowError("Cell values out of bounds. GMUI_GridAdjustLayer() on ('" + string((ctrl).Layer) + "'," + string(argument1) + "," + string(argument2) + "...");
        }
    }
}

// Move any groups that are anchored to other positions
var groupId;
for(i=0;i<ds_list_size((GMUII()).GMUI_groupList[_Layer]);i+=1) {
    groupId = ds_list_find_value((GMUII()).GMUI_groupList[_Layer],i);
    
    GMUI_GroupSetPosition(_Layer,groupId,GMUI_groupCellX[_Layer,groupId],GMUI_groupCellY[_Layer,groupId],GMUI_groupRelativeX[_Layer,groupId],GMUI_groupRelativeY[_Layer,groupId]);
}

// Reset the regions for the layer
GMUI_GridSetRegionsLayer(_Layer);



return true;


#define GMUI_GridSetRegions
/// Set the control regions for all layers

// Cycle through each grid layer to set region
var i,l;
for(i=0;i<ds_list_size((GMUII()).GMUI_gridlist);i+=1) {
    l = ds_list_find_value((GMUII()).GMUI_gridlist,i);
    GMUI_GridSetRegionsLayer(l);
}

#define GMUI_GridSetRegionsLayer
/// Set the control regions for the given layer

var _Layer,_Grid;
_Layer = argument0;
_Grid = (GMUII()).GMUI_grid[_Layer];

// Clear grid out first
ds_grid_clear(_Grid,0);

// Loop through all controls in the layer
var i,ctrl,_CX2,_CY2;
for(i=0;i<ds_list_size((GMUII()).GMUI_controlList);i+=1) {
    // Get control value
    ctrl = ds_list_find_value((GMUII()).GMUI_controlList,i);
    
    if (!instance_exists(ctrl)) {
        GMUI_ThrowError("Control no longer exists. GMUI_GridSetRegionsLayer()");
    }
    else if ((ctrl).Layer == _Layer) {
        // Map the control to the grid[layer#] - Warning: This will overwrite any existing instance values (overlapping)
        _CX2 = (ctrl).CellX+(ctrl).CellWide-1+ceil((ctrl).RelativeX / (GMUII()).cellsize);
        _CY2 = (ctrl).CellY+(ctrl).CellHigh-1+ceil((ctrl).RelativeY / (GMUII()).cellsize_h);
        ds_grid_set_region(_Grid,(ctrl).CellX,(ctrl).CellY,_CX2,_CY2,ctrl);
    }
    
}

#define GMUI_GridResetControlRegion
///GMUI_GridResetControlRegion(Layer, previous CellX, previous CellY, Cell Width, Cell Height, control id)
/// Resets any control values in the control's previous region


var _Layer, _pCellX, _pCellY, _CellW, _CellH, _CtrlId;
_Layer = argument0;
_pCellX = argument1;
_pCellY = argument2;
_CellW = argument3;
_CellH = argument4;
_CtrlId = argument5;

// Loop through region to reset control value to 0
var i,j;
for (i=0;i<_CellW;i+=1) {
    for (j=0;j<_CellH;j+=1) {
        if (ds_grid_get((GMUII()).GMUI_grid[_Layer],_pCellX+i,_pCellY+j) == _CtrlId) {
                ds_grid_set((GMUII()).GMUI_grid[_Layer],_pCellX+i,_pCellY+j,0);
        }
    }
}

#define GMUI_GridNextControl
/// Changes the selected control to the next control in the list by ID

// Select the first control if none are selected, otherwise pull the next ID
var ctrlIndex,ctrl;
if ((GMUII()).SelectedControl != -1)
{
    ctrlIndex = ds_list_find_index((GMUII()).GMUI_controlList,(GMUII()).SelectedControl);
    if (ctrlIndex < 0)
        ctrlIndex = -1;
}
else
    ctrlIndex = -1;

GMUI_ResetControlStatus("Selected");

ctrl = ds_list_find_value((GMUII()).GMUI_controlList,ctrlIndex + 1);
if (ctrl > 0 && instance_exists(ctrl))
{
    if ((!ctrl.Disabled) && (!ctrl.NonClickable) && (!ctrl.Hidden))
    {
        GMUI_GridSelect(ctrl);
        return true;
    }
}


return false;

#define GMUI_GridGetMouseCellX
/// Returns the horizontal cell block that the mouse is on
// argument0 is usually mouse_x

return ceil((argument0-(GMUII()).GMUI_grid_x[(GMUII()).UILayer])/(GMUII()).cellsize)-1;



#define GMUI_GridGetMouseCellY
/// Returns the vertical cell block that the mouse is on
// argument0 is usually mouse_y

return ceil((argument0-(GMUII()).GMUI_grid_y[(GMUII()).UILayer])/(GMUII()).cellsize_h)-1;



#define GMUI_GroupExists
///GMUI_GroupExists(Layer Number, Group Number)
///Checks that the group number given exists in the layer in GMUI

if (!is_real(argument0))
    return false;
    
if (!is_real(argument0))
    return false;

var L,G;
L = floor(argument0);
G = floor(argument1);

return (ds_list_find_index((GMUII()).GMUI_groupList[L],G) != -1);

#define GMUI_GroupPositionControls
/// Internal: Re-position the controls of the group, or a specific one
// GMUI_GroupPositionControls(

#define GMUI_GroupSetPositionAnchored
///GMUI_GroupSetPositionAnchored(Layer Number, Group Number, Cell X, Cell Y, X Adjustment, Y Adjustment, Anchor)
///Change the position of the group (and all of the controls inside it) according to its anchor

// Arguments
var _LayerNumber,_GroupNumber,_CellX,_CellY,_AdjustmentX,_AdjustmentY, ctrl;
_LayerNumber = argument0;
_GroupNumber = argument1;
_CellX = argument2;
_CellY = argument3;
_AdjustmentX = argument4;
_AdjustmentY = argument5;
_Anchor = argument6;


// Validate
if (!is_real(_GroupNumber) || !is_real(_LayerNumber) || !is_real(_CellX) || !is_real(_CellY) || _GroupNumber <= 0) {
    GMUI_ThrowError("Invalid parameters for GMUI_GroupSetPositionAnchored");
    return false;
}

if (!GMUI_LayerExists(_LayerNumber)) {
    GMUI_ThrowError("Layer " + string(_LayerNumber) + " doesn't exist. GMUI_GroupSetPositionAnchored");
    return false;
}

if (!GMUI_GroupExists(_LayerNumber,_GroupNumber)) {
    GMUI_ThrowError("Group " + string(_GroupNumber) + " doesn't exist on layer " + string(_LayerNumber) + ". GMUI_GroupSetPositionAnchored");
    return false;
}

// Max adjustment values
_AdjustmentX = min(_AdjustmentX, (GMUII()).cellsize - 1);
_AdjustmentY = min(_AdjustmentY, (GMUII()).cellsize_h - 1);

// Change group position
(GMUII()).GMUI_groupCellX[_LayerNumber,_GroupNumber] = GMUI_GetAnchoredCellX(ds_grid_width((GMUII()).GMUI_grid[_LayerNumber]),_CellX,_Anchor);
(GMUII()).GMUI_groupCellY[_LayerNumber,_GroupNumber] = GMUI_GetAnchoredCellY(ds_grid_height((GMUII()).GMUI_grid[_LayerNumber]),_CellY,_Anchor);
(GMUII()).GMUI_groupActualX[_LayerNumber,_GroupNumber] = GMUI_CellGetActualX((GMUII()).GMUI_groupCellX[_LayerNumber,_GroupNumber]);
(GMUII()).GMUI_groupActualY[_LayerNumber,_GroupNumber] = GMUI_CellGetActualY((GMUII()).GMUI_groupCellY[_LayerNumber,_GroupNumber]);
(GMUII()).GMUI_groupRelativeX[_LayerNumber,_GroupNumber] = _AdjustmentX;
(GMUII()).GMUI_groupRelativeY[_LayerNumber,_GroupNumber] = _AdjustmentY;

// Re-position all controls within the group
var i;
for(i=0;i<ds_list_size((GMUII()).GMUI_groupControlList[_LayerNumber,_GroupNumber]);i+=1) {
    // Get the control id
    ctrl = ds_list_find_value((GMUII()).GMUI_groupControlList[_LayerNumber,_GroupNumber],i);
    
    if (!instance_exists(ctrl))
    {
        GMUI_ThrowError("Control no longer exists. GMUI_GroupSetPositionAnchored(" + _LayerNumber + "," + _GroupNumber + ")");
    }
    else {
        var pCellX,pCellY,groupWidth;
        groupWidth = (GMUII()).GMUI_groupCellsW[_LayerNumber,_GroupNumber];
        pCellX = GMUI_GetAnchoredCellX(groupWidth,(ctrl).RelativeCellX,(ctrl).Anchor);
        pCellY = GMUI_GetAnchoredCellY(groupWidth,(ctrl).RelativeCellY,(ctrl).Anchor);
        
        // Reset positioning based on group's position
        (ctrl).CellX = GMUI_GetAnchoredCellX(groupWidth,pCellX,(ctrl).Anchor)
            + (GMUII()).GMUI_groupCellX[_LayerNumber,_GroupNumber];
        (ctrl).CellY = GMUI_GetAnchoredCellY(groupWidth,pCellY,(ctrl).Anchor)
            + (GMUII()).GMUI_groupCellY[_LayerNumber,_GroupNumber];
        (ctrl).RelativeX = (GMUII()).GMUI_groupRelativeX[_LayerNumber,_GroupNumber];
        (ctrl).RelativeY = (GMUII()).GMUI_groupRelativeY[_LayerNumber,_GroupNumber];
        
        // Properly have control configure its own adjustments (sets IsAdjusted and adds cell boundary as necessary)
        with (ctrl) {
            GMUI_ControlSetPositioning(RelativeX,RelativeY,ActualW,ActualH);
        }
            
        (ctrl).ActualX = GMUI_CellGetActualX((ctrl).CellX);
        (ctrl).ActualY = GMUI_CellGetActualY((ctrl).CellY);
    }
}

// Reset all control regions for the layer
GMUI_GridSetRegionsLayer(_LayerNumber);


#define GMUI_IsControl
///GMUI_IsControl()
/// Checks that the object calling script is a control in GMUI

// Call the actual check with the current object's ID
return GMUI_IsControlID(id);

#define GMUI_IsControlID
///GMUI_IsControlID(id)
/// Checks that the object ID provided is a control


return (ds_list_find_index((GMUII()).GMUI_controlList,argument0) != -1);

#define GMUI_IsScript
///GMUI_IsScript(script)
///Determines whether the value provided is an existing script

var _ScrVar;

_ScrVar = argument0;

if (is_real(_ScrVar)) {
    if (_ScrVar > -1) {
        if (script_exists(_ScrVar)) {
            return true;
        }
    }
}

return false;

#define GMUI_LastError
///GMUI_LastError()
/// Return the last error reported from the error list

return (GMUII()).GMUI_Error[(GMUII()).GMUI_ErrorNumber];

#define GMUI_LayerExists
///GMUI_LayerExists(Layer Number)
/// Checks that the layer number given exists in GMUI

if (!is_real(argument0))
    return false;

var L;L = floor(argument0);

return (ds_list_find_index((GMUII()).GMUI_gridlist,L) != -1);


#define GMUI_MouseInAdjustedRegion
///GMUI_MouseInAdjustedRegion(Control Object, mouse x, mouse y)
/// Checks to see if the mouse is in the adjusted region of the control (true/false)

var _Control, _MX, _MY, _CW, _CH;
_Control = argument0;
_MX = argument1;
_MY = argument2;

// Check region of control if valid cotrol
if (!GMUI_IsControlID(_Control) && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_MouseInAdjustedRegion");
    return false;
}

// Get the proper width/height of the cell (using cellsize functions)
if ((_Control).ActualW != 0)
    _CW = (_Control).ActualW;
else
    _CW = GMUI_CellGetActualX((_Control).CellWide);

if ((_Control).ActualH != 0)
    _CH = (_Control).ActualH;
else
    _CH = GMUI_CellGetActualY((_Control).CellHigh);
    
// Check if coordinates are inside the adjusted control based on what adjustments are set
if ((_MX >= (_Control).ActualX + (_Control).RelativeX && _MX <= (_Control).ActualX + (_Control).RelativeX + _CW) &&
    (_MY >= (_Control).ActualY + (_Control).RelativeY && _MY <= (_Control).ActualY + (_Control).RelativeY + _CH)
    )
    return true;
else
    return false;

#define GMUI_MouseInSpecialRegion
///GMUI_MouseInAdjustedSpecialRegion(Control Object, mouse x, mouse y)
/// Returns direction if mouse is in the adjusted region of the control

var _Control, _MX, _MY, _D, _CW, _CH, sizingW, sizingH;
_Control = argument0;
_MX = argument1;
_MY = argument2;
sizingW = 0;
sizingH = 0;

// Check region of control if valid cotrol
if (!GMUI_IsControlID(_Control) && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_MouseInSpecialRegion");
    return global.GMUIHoveringDirection_None;
}

// Get the proper width/height of the cell
if ((_Control).ActualW != 0)
    _CW = (_Control).ActualW;
else
    _CW = (_Control).CellWide * ((GMUII()).cellsize);

if ((_Control).ActualH != 0)
    _CH = (_Control).ActualH;
else
    _CH = (_Control).CellHigh * ((GMUII()).cellsize_h);
    
_D = (_Control).ControlPickerDirection;
    
// if sizing mode is half of cell, then use the direction to find midpoints, otherwise use picker size
if (_D == global.GMUIDirectionTypeSideVertical)
{
    sizingW = (_Control).ControlPickerWidth;
    sizingH = _CH / 2;
}
else if (_D == global.GMUIDirectionTypeVertical)
{
    sizingH = (_Control).ControlPickerHeight + 2; // +2 borders
}
else
{
    sizingW = (_Control).ControlPickerWidth + 2; // +2 borders
}
    
// Check if coordinates are inside the adjusted control based on what adjustments are set
if (_D == global.GMUIDirectionTypeHorizontal)
{
    if ((_MX >= (_Control).ActualX + (_Control).RelativeX) && 
        (_MX <= (_Control).ActualX + (_Control).RelativeX + sizingW))
        return global.GMUIHoveringDirection_Left;
    else if ((_MX >= (_Control).ActualX + (_Control).RelativeX + _CW - sizingW) && 
        (_MX <= (_Control).ActualX + (_Control).RelativeX + _CW))
        return global.GMUIHoveringDirection_Right;
}
else if (_D == global.GMUIDirectionTypeSideVertical)
{
    if ((_MY >= (_Control).ActualY + (_Control).RelativeY) && 
        (_MY <= (_Control).ActualY + (_Control).RelativeY + sizingH) &&
        (_MX >= (_Control).ActualX + (_Control).RelativeX + _CW - sizingW))
        return global.GMUIHoveringDirection_Up;
    else if ((_MY >= (_Control).ActualY + (_Control).RelativeY + _CH - sizingH) &&
        (_MY <= (_Control).ActualY + (_Control).RelativeY + _CH) &&
        (_MX >= (_Control).ActualX + (_Control).RelativeX + _CW - sizingW))
    return global.GMUIHoveringDirection_Down;
}

// No Conditions were met
return global.GMUIHoveringDirection_None;



#define GMUI_ResetControlStatus
///GMUI_GridStep ("Hovering" / "Selected", GridID)
/// Resets the hovering or selected values of the controls

var a0,ff,ffo,m,ms; a0 = string(argument0);

if (string_lower(a0) == "selected" || a0 == "1")
{
    (GMUII()).SelectedControl = -1;
    ff = ds_map_find_first((GMUII()).GMUI_map);
    if (string(ff) == "0")
        GMUI_ThrowError("No controls exist for GMUI_ResetControlStatus()");
    else
    {
        // Set all controls' selected variable to false and find previous selection if there is one
        PreviousSelectedControl = -1;
        
        ms = ds_map_size((GMUII()).GMUI_map);
        for (m=0; m < ms; m+=1) {
            if (string(ff) != "0" && GMUI_StudioCheckDefined(ff)) {
                ffo = ds_map_find_value((GMUII()).GMUI_map,ff);
                if (GMUI_StudioCheckDefined(ffo)) {
                    if ((ffo).Selected)
                        PreviousSelectedControl = ffo;
                    (ffo).Selected = 0;
                    (ffo).DoubleSelected = 0;
                }
            }
            
            ff = ds_map_find_next((GMUII()).GMUI_map,ff);
        }
    }
}
else
{
    // Quiet failure if incorrect arguments provided, but still do hovering value
    if (string_lower(a0) != "hovering" && a0 != "0")
        GMUI_ThrowError("Incorrect parameter given to GMUI_ResetControlStatus()");
    
    (GMUII()).HoveringControl = -1;
    ff = ds_map_find_first((GMUII()).GMUI_map);
    if (string(ff) == "0")
        GMUI_ThrowError("No controls exist for GMUI_ResetControlStatus()");
    else
    {
        // Set all controls' hover variable to false
        ms = ds_map_size((GMUII()).GMUI_map);
        for (m=0; m < ms; m+=1) {
            if (string(ff) != "0" && GMUI_StudioCheckDefined(ff)) {
                ffo = ds_map_find_value((GMUII()).GMUI_map,ff);
                if (GMUI_StudioCheckDefined(ffo)) {
                    (ffo).Hovering = 0;
                    (ffo).HoveringDirection = 0;
                }
            }
            
            ff = ds_map_find_next((GMUII()).GMUI_map,ff);
        }
    }
    
}

#define GMUI_StudioCheckDefined
///GMUI_StudioCheckDefined(value) Returns if the argument is defined or not (GM:Studio)

var a0; a0 = argument0;

//GM8:
if (global.GMUIGameMaker8)
    return true;

//Studio: UNCOMMENT THE NEXT LINE IN GM:STUDIO
//return !is_undefined(a0);

#define GMUI_ThrowError
///GMUI_ThrowError(Error Message)
///GMUI can store errors and can choose to save/report them if needed

(GMUII()).GMUI_ErrorNumber += 1;
(GMUII()).GMUI_Error[(GMUII()).GMUI_ErrorNumber] = string(argument0);

if ((GMUII()).PopUpGMUIError) {
    show_message(GMUI_LastError());
}

#define GMUI_ThrowErrorDetailed
///GMUI_ThrowErrorDetailed(Error Message,script name)
///Throw script name and object caller name with the message

GMUI_ThrowError(string(argument0) + " | " + string(argument1) + " | " + string(object_get_name(object_index)));

#define GMUI_ValidCellBounds
///GMUI_ValidCellBounds(anchor,cellX,cellY,gridW,gridH)
///This procedure will lightly check the boundaries for each anchor position, as controls outside the grid will not be recognized properly
// Only checks for max bounds such as negative or over the width/height. User should notice anything else, so I don't think it needs to be a strict check.... for now at least.

// The X cell values 
if (
argument0 == global.GMUIAnchorLeft || argument0 == global.GMUIAnchorTopLeft || argument0 == global.GMUIAnchorBottomLeft || 
argument0 == global.GMUIAnchorTopRight || argument0 == global.GMUIAnchorRight || argument0 == global.GMUIAnchorBottomRight
)
{
    if (argument1 < 0 || argument1 > argument3 - 1)
        return false;
}
//else if ( ... strict check on centered controls


// The Y cell values
if (
argument0 == global.GMUIAnchorTopLeft || argument0 == global.GMUIAnchorTopRight || argument0 == global.GMUIAnchorTop || 
argument0 == global.GMUIAnchorBottomLeft || argument0 == global.GMUIAnchorBottomRight || argument0 == global.GMUIAnchorBottom
)
{
    if (argument2 < 0 || argument2 > argument4 - 1)
        return false;
}
// else if ( ... strict check on centered controls

// Passed
return true;

#define GMUII
/// INTERNAL USE: Returns the current GMUI object instance
// (GMUII()).Value

return global.GMUIiid[0];

