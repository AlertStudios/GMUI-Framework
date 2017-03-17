#define _Test_Form
///_Test_Form() This interface is for the demo

// DEMO INTERFACE:
var layer;
// Set optional grid settings
GMUI_GridSetNavigation(global.GMUIDirectionTypeVertical,vk_up,vk_down,vk_left,vk_right,true);

// Create a control group if you would like: (layer number, group number (> 0), CellX, CellY, CellWide, CellHigh, anchor)

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
    //GMUI_ControlSetSpriteMap(s2,s3,s4,s5,s6,s7,s8,s1,s9,false);
}

with (GMUI_Add("Test4", "intpicker",            0,6,    10,2,   layer, global.GMUIAnchorTopLeft)) {
    GMUI_ControlSetAttributes(0,0,-20,20);
    GMUI_ControlSetInitValue(-1);
    GMUI_ControlAddToGroup(2);
    GMUI_ControlSetHoverAction(_Hover_Int);
    GMUI_ControlSetHoverOffAction(_HoverOff_Int);
    
    with (GMUI_ControlAddTooltip("-20 to 20.",global.GMUIAnchorLeft,6,2,12,4,-1,-1)) {
        GMUI_ControlSetFadeOnHide(id, room_speed*100);
    }
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


// Call actions dependent on existing controls
GMUI_GroupSetFadeOnHide(layer, 2, room_speed/4);





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
//switch group positions

if (!global.Switched) {
    var anchoredRight; 
    anchoredRight = GMUI_GetAnchoredCellX(GMUI_GridGetWidth(GMUII(),0),11,global.GMUIAnchorTopRight);
    
    GMUI_GroupTransitionToCell(0, 1, 2, 3, easeElasticOut, 30);
    GMUI_GroupTransitionToCell(0, 2, anchoredRight, 3, easeElasticOut, 30);
    global.Switched = true;
}
else {
    var anchoredRight; 
    anchoredRight = GMUI_GetAnchoredCellX(GMUI_GridGetWidth(GMUII(),0),20,global.GMUIAnchorTopRight);
    
    GMUI_GroupTransitionToCell(0, 1, anchoredRight, 3, easeElasticOut, 30);
    GMUI_GroupTransitionToCell(0, 2, 2, 3, easeElasticOut, 30);
    global.Switched = false;
}

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

#define _Enlarge_Button
// Make window bigger

//show_message("Not implemented yet");

if (room == GMUIdemo)
    room_goto_next();

    GMUI_GridAdjust(ceil(room_width/(GMUII()).cellsize),ceil(room_height/(GMUII()).cellsize_h));

#define _Exit_Button
game_end();

#define _Hover_Int

if (!GMUI_ControlIsHidden("Test4"))
    GMUI_ControlHideTooltip("Test4",false);


#define _HoverOff_Int


GMUI_ControlHideTooltip("Test4",true);

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
GMUI_ControlSetSpriteMap(-1,-1,-1,-1,-1,-1,-1,-1,-1,false);

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
layerDepth_maxLayers = 100;

// Display messages over all control layers
layerDepth_messages = layerDepth_layers - (layerDepth_maxLayers*3);

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
if (_t == 1)
    return _b + _c;
    
_p = _d * .3;
_s = _p / 4;

return (_c * power( 2, -10 * _t ) * sin(((_t*_d)-_s) * (2*pi)/_p) + _c + _b );

#define easeExpIn
///easeExpIn(t,b,c,d) where t is current time, b is start value, c is change in value, and d is duration
///Exponential Ease for moving controls smoothly

var _t,_b,_c,_d;

_t = argument0;
_b = argument1;
_c = argument2;
_d = argument3;


return _c * power( 2, 10 * (_t/_d - 1) ) + _b;

#define easeExpOut
///easeExpOut(t,b,c,d) where t is current time, b is start value, c is change in value, and d is duration
///Exponential Ease for moving controls smoothly

var _t,_b,_c,_d;

_t = argument0;
_b = argument1;
_c = argument2;
_d = argument3;


return _c * ( -power( 2, -10 * _t/_d ) + 1 ) + _b;

#define easeInBack
///easeInBack(t,b,c,d) where t is current time, b is start value, c is change in value, and d is duration
///Elastic Ease for moving controls smoothly

var _t,_b,_c,_d, _p,_s;
_t = argument0;
_b = argument1;
_c = argument2;
_d = argument3;

_s = 1.70158;
_t = _t/_d;

return _c*(_t)*_t*((_s+1)*_t - _s) + _b;

#define easeOutBack
///easeOutBack(t,b,c,d) where t is current time, b is start value, c is change in value, and d is duration
///Elastic Ease for moving controls smoothly

var _t,_tt,_b,_c,_d, _p,_s;
_t = argument0;
_b = argument1;
_c = argument2;
_d = argument3;

_s = 1.70158;
_t = _t/_d-1;

return _c*((_t)*_t*((_s+1)*_t + _s) + 1) + _b;

#define GMUI_ControlSetFade
///GMUI_ControlSetFade("Control Name", Time, In (1) / Out (0) / Hover (2) )
///
/// will be moved to internals when done

#define GMUI_ControlSetFadeHover
///GMUI_ControlSetFadeHover("Control Name", Time)
///

GMUI_ControlSetFade(argument0,argument1,2);

#define GMUI_ControlSetFadeIn
///GMUI_ControlSetFadeIn("Control Name", Time)
///

GMUI_ControlSetFade(argument0,argument1,1);

#define GMUI_ControlSetFadeOut
///GMUI_ControlSetFadeOut("Control Name", Time)
///

GMUI_ControlSetFade(argument0,argument1,0);

#define GMUI_ControlTransitionStop
///GMUI_ControlTransitionStop()



#define GMUI_ControlTransitionToCell
///GMUI_ControlTransitionToCell("ControlName",Cell X, Cell Y, Transition Script, Time)
///

// Get coordinates of CellX and CellY and pass to actual position
var _ActualX, _ActualY;

_ActualX = GMUI_CellGetActualX(argument1);
_ActualY = GMUI_CellGetActualY(argument2);

GMUI_ControlTransitionToActual(argument0,_ActualX,_ActualY,argument3,argument4);

#define GMUI_ControlTransitionToActual
///GMUI_ControlTranstionToActual("ControlName",Grid X, Grid Y, Transition Script, Time)
///

var _ctrl, _iid, _GridX, _GridY;
_iid = GMUII();
_GridX = argument1;
_GridY = argument2;

// Retrieve _ctrl from the reference map
_ctrl = ds_map_find_value((_iid).GMUI_map,string(argument0));
if (string(_ctrl) == "0")
    return false;
    
// Check that the transition script is valid
if (!GMUI_IsScript(argument3))
    return false;

// Calculate coordinates and set the room positions and start transition
(_ctrl).T_t = 0;
(_ctrl).T_d = argument4;

(_ctrl).T_bx = (_ctrl).ActualX;
(_ctrl).T_by = (_ctrl).ActualY;

(_ctrl).T_cx = _GridX - (_ctrl).ActualX;
(_ctrl).T_cy = _GridY - (_ctrl).ActualY;

(_ctrl).TransitionScript = argument3;
(_ctrl).Transitioning = true;


#define GMUI_GroupTransitionStop
///GMUI_GroupTransitionStop(Layer Number, Group Number)



#define GMUI_GroupTransitionToCell
///GMUI_GroupTransitionToCell(Layer Number, Group Id, Cell X, Cell Y, Transition Script, Time)
///

// Get coordinates of CellX and CellY and pass to actual position
var _ActualX, _ActualY;

_ActualX = GMUI_CellGetActualX(argument2);
_ActualY = GMUI_CellGetActualY(argument3);

GMUI_GroupTransitionToActual(argument0, argument1,_ActualX,_ActualY,argument4,argument5);

#define GMUI_GroupTransitionToActual
///GMUI_GroupTransitionToActual(Layer Number, Group Id, Grid X, Grid Y, Transition Script, Time)
///

var _SCRIPT, _ctrl, _iid, _LayerNumber,  _GridX, _GridY;
_SCRIPT = "GMUI_GroupTransitionToActual";
_iid = GMUII();
_LayerNumber = argument0;
_GroupNumber = argument1;
_GridX = argument2;
_GridY = argument3;

// Check that the transition script is valid
if (!GMUI_IsScript(argument4))
    return false;
    
(_iid).GMUI_groupTransitioning[_LayerNumber,_GroupNumber] = true;

// Call transition on all controls
var i,_relX,_relY,groupWidth,groupHeight,_setMaster;
groupWidth = (_iid).GMUI_groupCellsW[_LayerNumber,_GroupNumber];
groupHeight = (_iid).GMUI_groupCellsH[_LayerNumber,_GroupNumber];

_setMaster = false;
for(i=0;i<ds_list_size((_iid).GMUI_groupControlList[_LayerNumber,_GroupNumber]);i+=1) {
    // Get the control id
    _ctrl = ds_list_find_value((_iid).GMUI_groupControlList[_LayerNumber,_GroupNumber],i);
    
    if (!instance_exists(_ctrl))
    {
        GMUI_ThrowErrorDetailed("Control no longer exists (" + _LayerNumber + "," + _GroupNumber + ")", _SCRIPT);
    }
    else {
        _relX = (_ctrl).ActualX - (_iid).GMUI_groupActualX[_LayerNumber,_GroupNumber];
        _relY = (_ctrl).ActualY - (_iid).GMUI_groupActualY[_LayerNumber,_GroupNumber];
        // The master control will handle the group transition itself
        if (!_setMaster) {
            (_ctrl).T_bx_group = (_iid).GMUI_groupActualX[_LayerNumber,_GroupNumber];
            (_ctrl).T_by_group = (_iid).GMUI_groupActualY[_LayerNumber,_GroupNumber];
            (_ctrl).T_cx_group = _GridX - (_iid).GMUI_groupActualX[_LayerNumber,_GroupNumber];
            (_ctrl).T_cy_group = _GridY - (_iid).GMUI_groupActualY[_LayerNumber,_GroupNumber];
            
            (_iid).GMUI_groupTransitioningControl[_LayerNumber,_GroupNumber] = _ctrl;
            _setMaster = true;
        }
        
        (_ctrl).TransitioningGroup = true;
        
        GMUI_ControlTransitionToActual((_ctrl).valueName,_GridX+_relX,_GridY+_relY,argument4,argument5);
    }
    
}

// If no controls, the transition won't work.... for now?
if (!_setMaster) {
    GMUI_ThrowErrorDetailed("No Controls to move! (" + string(_LayerNumber) + "," + string(_GroupNumber) + ")", _SCRIPT);
    return false;
}

(_iid).GMUI_groupTransitioning[_LayerNumber,_GroupNumber] = true;

return true;



#define GMUI_Transition
///GMUI_Transition()

/// will be moved to internals when done

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

var SCRIPT,_Layer,_Anchor,_CellX,_CellY,_CellWide,_CellHigh;
SCRIPT = "GMUI_Add";
_Layer = argument6;
_Anchor = argument7;
_CellX = argument2;
_CellY = argument3;
_CellWide = argument4;
_CellHigh = argument5;

// Check that the layer exists first
if (!GMUI_LayerExists(_Layer)) {
    GMUI_ThrowErrorDetailed("The layer does not exist for " + string(argument0),SCRIPT);
    return -1;
}

// Check grid positioning first and assign after created
var gridW, gridH;
// Get the dimensions and round down for grids that have even grid sizes
gridW = GMUI_GridGetWidth(GMUII(),_Layer);
gridH = GMUI_GridGetHeight(GMUII(),_Layer);

//if (!GMUI_ValidCellBounds(_Anchor,_CellX,_CellY,gridW,gridH)) {
//    GMUI_ThrowErrorDetailed("Cell values out of bounds for " + string(argument0) + " (" + string(argument1) + "," + string(_CellX) + ",...",SCRIPT);
//    return -1;
//}


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
    
// Assign the grid instance to the control and layer and group
thecontrol.GMUIP = GMUII();
thecontrol.Layer = _Layer;
thecontrol.Group = 0;

// Add control to control list for reference
ds_list_add((GMUII()).GMUI_controlList,thecontrol);

// First the control type vars must be set
thetype = GMUI_ControlSetType(thecontrol,string(argument1));

// Then set the relative and actual position, and Anchor and IsAdjusted status
GMUI_ControlPosition(thecontrol,_CellX,_CellY,0,0,_Anchor);

thecontrol.valueName = argument0;
thecontrol.CellWide = _CellWide;
thecontrol.CellHigh = _CellHigh;
thecontrol.CellWideMax = _CellWide;
thecontrol.CellHighMax = _CellHigh;
thecontrol.depth = (GMUII()).layerDepth_layers-(_Layer*3)-(thetype=="tooltip");
thecontrol.persistent = (GMUII()).persistence; // This is kind of unnecessary but could be used at some point?

// Specific setup for particular types
if (thecontrol.ControlIsString) {
    thecontrol.value = "";
    thecontrol.valueString = "";
}

// Map the name to the instance
ds_map_add((GMUII()).GMUI_map,argument0,thecontrol);


// SET ALL DEFAULTS (set from the gmui controller):

// Set the default style properties
GMUI_ControlSetDefaultStyle(thecontrol);

// Set the default optional sprite override vars
GMUI_ControlSetDefaultSprite(thecontrol);

// Set the default optional flexible sprite map properties
GMUI_ControlSetDefaultSpriteMap(thecontrol);

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
ds_list_add((GMUII()).GMUI_gridlist,_Layer);

// Add a group list to the layer in case its used
(GMUII()).GMUI_groupList[_Layer] = ds_list_create();
(GMUII()).GMUI_groupControlList[_Layer,0] = ds_list_create();

//Default
(GMUII()).GMUI_grid_w[_Layer] = ceil((GMUII()).UIgridwidth/(GMUII()).cellsize);
(GMUII()).GMUI_grid_h[_Layer] = ceil((GMUII()).UIgridheight/(GMUII()).cellsize_h);

// Assign
(GMUII()).GMUI_grid[_Layer] = ds_grid_create((GMUII()).GMUI_grid_w[_Layer],(GMUII()).GMUI_grid_h[_Layer]);
(GMUII()).GMUI_grid_x[_Layer] = argument1;
(GMUII()).GMUI_grid_y[_Layer] = argument2;


if ((GMUII()).UILayerTop < _Layer)
    (GMUII()).UILayerTop = _Layer;

return true;

#define GMUI_AddTooltipToControl
///GMUI_AddTooltipToControl(Control id, "message string", direction/side of control, width cells [or -1], height cells [or -1], max cells width, max cells height, relative x [or -1], relative y [or -1])
///Adds a tooltip to the specified control

var _SCRIPT, _message, _direction, _relX, _relY, _cellX, _cellY, _newCtrl,
    _width, _height, _newwidth, _newheight, _actwidth, _actheight, _maxwidth, _maxheight, gcellsize;
_SCRIPT = "GMUI_AddTooltipToControl";
_ctrl = argument0;
_message = argument1;
_direction = argument2;
_width = argument3;
_height = argument4;
_maxwidth = argument5;
_maxheight = argument6;
_relX = max(0,argument7);
_relY = max(0,argument8);

// Must be control
if (!GMUI_IsControlID(_ctrl)) {
    GMUI_ThrowErrorDetailed("Invalid control",_SCRIPT);
    return -1;
}
// Must have real coordinates
if (!is_real(_relX) || !is_real(_relY)) {
    GMUI_ThrowErrorDetailed("Invalid coordinates",_SCRIPT);
    return -1;
}

if (_direction < 0 || _direction > 8) {
    GMUI_ThrowErrorDetailed("Invalid direction",_SCRIPT);
    return -1;
}

// Adjust sizing based on text given
draw_set_font(((_ctrl).GMUIP).ControlFont);
gcellsize = ((_ctrl).GMUIP).cellsize;

_actwidth = string_width_ext(_message,-1,_maxwidth*gcellsize);
_actheight = string_height_ext(_message,-1,_maxwidth*gcellsize);
_newwidth = ceil(_actwidth/gcellsize);
_newheight = ceil(_actheight/((_ctrl).GMUIP).cellsize_h);


// Create the control to store the tooltip, creating it in an adjacent cell
if (_direction == global.GMUIAnchorBottom) {
    _cellX = (_ctrl).CellX + ceil((_ctrl).CellWide / 2) - ceil(abs(_width) / 2);
    _cellY = (_ctrl).CellY - abs(_height) - 1;
}
else if (_direction == global.GMUIAnchorTop) {
    _cellX = (_ctrl).CellX + ceil((_ctrl).CellWide / 2) - ceil(abs(_width) / 2);
    _cellY = (_ctrl).CellY + (_ctrl).CellHigh + 1;
}
else if (_direction == global.GMUIAnchorRight || _direction == global.GMUIAnchorTopRight || _direction == global.GMUIAnchorBottomRight) {
    _cellX = (_ctrl).CellX - abs(_width) - 1;
    _cellY = (_ctrl).CellY + ceil((_ctrl).CellHigh / 2) - ceil(abs(_height) / 2);
}
else {
    // Left anchored (right side)
    _cellX = (_ctrl).CellX + (_ctrl).CellWide + 1;
    _cellY = (_ctrl).CellY + ceil((_ctrl).CellHigh / 2) - ceil(abs(_height) / 2);
}

newCtrl = GMUI_Add((_ctrl).valueName + "_tooltip","tooltip",_cellX,_cellY,_newwidth,_newheight,(_ctrl).Layer,(_ctrl).Anchor);

with (newCtrl) {
    valueString = _message;
    Hidden = true;
    FadeAlpha = 0;
    FadeIn = max(ControlBackgroundAlpha,ControlHoverAlpha,ControlSelectAlpha,ControlOverwriteAlpha,ControlFontAlpha);
    
    // Set positioning to given relative amount and fit width to content
    GMUI_ControlSetPositioning(_relX,_relY,_actwidth,0);

    // Assign tooltip settings to control...
    TT_minx = _width;
    TT_miny = _height;
    TT_maxx = _maxwidth;
    TT_maxy = _maxheight;
    
    TT_arrowsize = 8;
    TT_xposition = 8;
    TT_yposition = 16;
    TT_direction = _direction;
}

// Store position relative to the parent control
(newCtrl).TT_relativeCellX = _cellX - (_ctrl).CellX;
(newCtrl).TT_relativeCellY = _cellY - (_ctrl).CellY;
// Parent control stores the id
(_ctrl).TooltipId = newCtrl;

return newCtrl;


#define GMUI_ControlAddToGroup
///GMUI_ControlAddToGroup(group number)
///Adds control to a group if it exists in the layer

var SCRIPT, _Group, _Layer;
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

// The master control will handle drawing and transitioning of the group
if ((GMUIP).GMUI_groupMasterControl[_Layer,_Group] == -1 || (GMUIP).GMUI_groupMasterControl[_Layer,_Group] > id) {
    (GMUIP).GMUI_groupMasterControl[_Layer,_Group] = id;
}


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

// Update control draw location in the room
GMUI_ControlUpdateXY(id);

    
    

#define GMUI_ControlAddTooltip
///GMUI_ControlAddTooltip("message string", direction/side of control, width cells [or -1], height cells [or -1], max cells width, max cells height, relative x [or -1], relative y [or -1])
///Adds a tooltip to the control

return GMUI_AddTooltipToControl(id,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);



#define GMUI_ControlDisable
///GMUI_ControlDisable("ControlName", Disable?)
///Disable or enable a control
// argument1 is to disable (1) or enable (0)

with (GMUII()) {
    // Retrieve control from the reference map
    var _ctrl;
    if (is_string(argument0))
        _ctrl = ds_map_find_value(GMUI_map,string(argument0));
    else
        _ctrl = argument0;
    if (string(_ctrl) == "0")
        return false;
    else {
        (_ctrl).Disabled = argument1;
        return true;
    }
}

#define GMUI_ControlDrawTooltip
///GMUI_ControlDrawTooltip("name of control with the tooltip")
/// Draw the control's tooltip

with (GMUII()) {
    // Retrieve control from the reference map
    var control;
    control = ds_map_find_value(GMUI_map,string(argument0));
    if (string(control) == "0") {
        GMUI_ThrowErrorDetailed("Control doesn't exist", "GMUI_ControlDrawTooltip");
        return false;
    }
    else {
        GMUI_ControlDrawTooltipById((control).TooltipId);
    }
}

#define GMUI_ControlHide
///GMUI_ControlHide("ControlName", Hide?)
///Hide or show a control
// argument1 is to hide (1) or show (0)

with (GMUII()) {
    // Retrieve control from the reference map
    var _ctrl;
    if (is_string(argument0))
        _ctrl = ds_map_find_value(GMUI_map,argument0);
    else
        _ctrl = argument0;
    if (string(_ctrl) == "0")
        return false;
    else {
        (_ctrl).Hidden = argument1;
        if ((_ctrl).FadeOnHide) {
            if (argument1 > 0)
                GMUI_ControlFadeOut(argument0,(_ctrl).FadeTime);
            else
                GMUI_ControlFadeIn(argument0,(_ctrl).FadeTime);
        }
        return true;
    }
}

#define GMUI_ControlHideTooltip
///GMUI_ControlHideTooltip("ControlName that has tooltip", Hide?)
///Hide or show a control's tooltip
// argument1 is to hide (1) or show (0)

with (GMUII()) {
    // Retrieve control from the reference map
    var _ctrl, _ctrlTT;
    if (is_string(argument0))
        _ctrl = ds_map_find_value(GMUI_map,argument0);
    else
        _ctrl = argument0;
    if (string(_ctrl) == "0")
        return false;
    else if ((_ctrl).TooltipId == -1)
        return false;
    else {
        _ctrlTT = (_ctrl).TooltipId;
        GMUI_ControlHide(_ctrlTT,argument1);
        return true;
    }
}

#define GMUI_ControlFadeIn
///GMUI_ControlFadeIn("ControlName", speed in steps)
///Fade in a control to alpha value

with (GMUII()) {
    // Retrieve control from the reference map
    var _ctrl;
    if (is_string(argument0))
        _ctrl = ds_map_find_value(GMUI_map,argument0);
    else
        _ctrl = argument0;
    if (string(_ctrl) == "0")
        return false;
    else {
        // Call fade up
        (_ctrl).FadeCalled = 1;
        (_ctrl).FadeTime = argument1;
        return true;
    }
}

#define GMUI_ControlFadeOut
///GMUI_ControlFadeOut("ControlName", speed in steps)
///Fade out a control

with (GMUII()) {
    // Retrieve control from the reference map
    var _ctrl;
    if (is_string(argument0))
        _ctrl = ds_map_find_value(GMUI_map,argument0);
    else
        _ctrl = argument0;
    if (string(_ctrl) == "0")
        return false;
    else {
        // Call fade down
        (_ctrl).FadeCalled = -1;
        (_ctrl).FadeTime = argument1;
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

#define GMUI_ControlPosition
///GMUI_ControlPosition("control name" or id, cell x, cell y, relative x, relative y, Anchor)
///Set the relative positioning and sizing of the control within its cell

var _ctrl,_anchor,_CellX,_CellY,_gridW,_gridH;
_CellX = argument1;
_CellY = argument2;
_Anchor = argument5;

if (is_string(argument0))
    _ctrl = ds_map_find_value((GMUII()).GMUI_map,argument0);
else
    _ctrl = argument0;

if (!GMUI_IsControlID(_ctrl))
{
    GMUI_ThrowErrorDetailed("Invalid control","GMUI_ControlPosition");
    return false;
}

// Get the dimensions and round down for grids that have even grid sizes
_gridW = GMUI_GridGetWidth((_ctrl).GMUIP,(_ctrl).Layer);
_gridH = GMUI_GridGetHeight((_ctrl).GMUIP,(_ctrl).Layer);

// Check grid positioning if it is an interactable control
if ((_ctrl).ControlInteraction) {
    if (!GMUI_ValidCellBounds(_Anchor,_CellX,_CellY,_gridW,_gridH)) {
        GMUI_ThrowErrorDetailed("Cell values out of bounds for " + string(argument0),"GMUI_ControlPosition");
        return false;
    }
}

// Store the relative values provided that reference against the anchor position
(_ctrl).Anchor = _Anchor;
(_ctrl).RelativeCellX = _CellX;
(_ctrl).RelativeCellY = _CellY;

// Relative is to the anchor, this position is the actual:
// The relative values when the grid is adjusted has four relative positions: Middle X's, Middle Y's, Right X's, Bottom Y's)
(_ctrl).CellX = GMUI_GetAnchoredCellX(_gridW,_CellX,_Anchor);
(_ctrl).CellY = GMUI_GetAnchoredCellY(_gridH,_CellY,_Anchor);

// Actual position based on its grid position
(_ctrl).ActualX = GMUI_CellGetActualX((_ctrl).CellX);
(_ctrl).ActualY = GMUI_CellGetActualY((_ctrl).CellY);

// Relative position is used if the boundary box should be adjusted, must be < cell size
(_ctrl).RelativeX = min(argument3,((_ctrl).GMUIP).cellsize - 1);
(_ctrl).RelativeY = min(argument4,((_ctrl).GMUIP).cellsize_h - 1);

// Store that this object has an adjusted position
if ((_ctrl).ActualW != 0 || (_ctrl).ActualH != 0 || (_ctrl).RelativeX != 0 || (_ctrl).RelativeY != 0)
    (_ctrl).IsAdjusted = true;
else
    (_ctrl).IsAdjusted = false;
    

return true;



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
    

#define GMUI_ControlSetFadeOnHide
///GMUI_ControlSetFadeOnHide("ControlName" or id, speed in steps)
///Set the fade in/out when the control is hidden or not

with (GMUII()) {
    // Retrieve control from the reference map
    var _ctrl;
    if (is_string(argument0))
        _ctrl = ds_map_find_value(GMUI_map,argument0);
    else
        _ctrl = argument0;
    
    if (string(_ctrl) == "0")
        return false;
    else {
        // Set the fade settings for when hiding or unhiding
        (_ctrl).FadeTime = argument1;
        (_ctrl).FadeOnHide = true;
        return true;
    }
}

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
    

#define GMUI_ControlSetHoverOffAction
///GMUI_ControlSetHoverOffAction(Action Script)
///When hovering off, execute script (can also draw)

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowError("Invalid control for GMUI_ControlSetHoverOffAction");
    return false;
}

if (script_exists(argument0)) {
    HoverOffActionScript = argument0;
    return true;
}
else {
    GMUI_ThrowError("Invalid script argument for GMUI_ControlSetHoverOffAction");
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

#define GMUI_ControlSetSpriteMap
///GMUI_ControlSetSpriteMap(sprite top, sprite top right, right, bottom right, bottom, bottom left, left, top left, center, center fixed partial [1] / stretched[0])
///Replace the control drawing with a sprite map of each corner, side, and center

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control","GMUI_ControlSetSpriteMap");
    return false;
}

if (sprite_exists(argument0))
    ControlGraphicTop = argument0;
else
    ControlGraphicTop = -1;
    
if (sprite_exists(argument1))
    ControlGraphicTopRight = argument1;
else
    ControlGraphicTopRight = -1;

if (sprite_exists(argument2))
    ControlGraphicRight = argument2;
else
    ControlGraphicRight = -1;
    
if (sprite_exists(argument3))
    ControlGraphicBottomRight = argument3;
else
    ControlGraphicBottomRight = -1;
    
if (sprite_exists(argument4))
    ControlGraphicBottom = argument4;
else
    ControlGraphicBottom = -1;
    
if (sprite_exists(argument5))
    ControlGraphicBottomLeft = argument5;
else
    ControlGraphicBottomLeft = -1;
    
if (sprite_exists(argument6))
    ControlGraphicLeft = argument6;
else
    ControlGraphicLeft = -1;
    
if (sprite_exists(argument7))
    ControlGraphicTopLeft = argument7;
else
    ControlGraphicTopLeft = -1;
    
if (sprite_exists(argument8))
    ControlGraphicCenter = argument8;
else
    ControlGraphicCenter = -1;
    
if (is_real(argument9))
    ControlGraphicCenterIsFixed = !(argument9 < 1);
else
    ControlGraphicCenterIsFixed = 0;


ControlGraphicMapIsUsed = true; 

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
///GMUI_Create(Form Script, Cell Width, Cell Height)
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
    // Freeing GMUI data
    RemovingGMUI = false;
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
    
// Rather pointless to be redundant but it gives more flexibility if you really need it...
persistence = persistent;

// Error management (DEBUG)
GMUI_Error[0] = "";
GMUI_ErrorNumber = 0;

    
// Get cellsize arguments (w,h)
if (argument1 < 1)
    cellsize = 16;
else
    cellsize = argument1;
if (argument2 < 1)
    cellsize_h = cellsize;
else
    cellsize_h = argument2;
    
// Set the interface area for new layers, using view 0 if enabled. Can be adjusted later
GMUI_CreateSetDefaultArea();


// Grid setup (New layers will have their own grids)
GMUI_gridlist = ds_list_create();

GMUI_AddLayer(0,0,0);

// Initial Disable steps for the Grid checks
InitialDisable = 5;

// Navigation settings
GMUI_navigateDirection = -1;
GMUI_backKey = -1;
GMUI_forwardKey = -1;
GMUI_backAltKey = -1;
GMUI_forwardAltKey = -1;
GMUI_enableTab = true;


// Map setup for control name keys to instances
GMUI_map = ds_map_create();

// Map setup for menu name keys to group id's
GMUI_menu_map = ds_map_create();
GMUI_menu_lastId = 0;

// List of all controls
GMUI_controlList = ds_list_create();

// Create all of the default control settings
GMUI_SetControlDefaults();

// Currently hovering or selecting on control for controls to revert if not them
HoveringControl = -1;
SelectedControl = -1;
PreviousSelectedControl = -1;

// An offset change will trigger repositioning controls
previousXOffset = 0;
previousYOffset = 0;


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
GMUI_groupTransitioning[0,0] = false;
GMUI_groupTransitioningControl[0,0] = -1;


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
_layerNumber = argument0;
_groupNumber = argument1;
_CellX = argument2;
_CellY = argument3;
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
    GMUI_groupGraphicMapIsUsed[_layerNumber,_groupNumber] = false;
    // Default sprite map values
    GMUI_groupGraphicTop[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicTopRight[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicRight[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicBottomRight[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicBottom[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicBottomLeft[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicLeft[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicTopLeft[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicCenter[_layerNumber,_groupNumber] = -1;
    GMUI_groupGraphicCenterIsTiled[_layerNumber,_groupNumber] = false;
    
    // Set position
    GMUI_groupCellX[_layerNumber,_groupNumber] = GMUI_GetAnchoredCellX(GMUI_GridGetWidth(GMUII(),_layerNumber),_CellX,_Anchor);
    GMUI_groupCellY[_layerNumber,_groupNumber] = GMUI_GetAnchoredCellY(GMUI_GridGetHeight(GMUII(),_layerNumber),_CellY,_Anchor);
    GMUI_groupActualX[_layerNumber,_groupNumber] = GMUI_CellGetActualX(GMUI_groupCellX[_layerNumber,_groupNumber]);
    GMUI_groupActualY[_layerNumber,_groupNumber] = GMUI_CellGetActualY(GMUI_groupCellY[_layerNumber,_groupNumber]);
    GMUI_groupCellsW[_layerNumber,_groupNumber] = 1;
    GMUI_groupCellsH[_layerNumber,_groupNumber] = 1;
    GMUI_groupRelativeCellX[_layerNumber,_groupNumber] = _CellX;
    GMUI_groupRelativeCellY[_layerNumber,_groupNumber] = _CellY;
    GMUI_groupAnchor[_layerNumber,_groupNumber] = _Anchor;
    GMUI_groupTransitioning[_layerNumber,_groupNumber] = false;
    GMUI_groupMasterControl[_layerNumber,_groupNumber] = -1;
}



return true;

#define GMUI_CreateMenu
///GMUI_CreateMenu (menu name, cell# x, cell# y, cells wide, cells high, Anchor)
///Adds a menu to a GMUI layer that controls can be put into


// Arguments
var _SCRIPT,_menuName,_CellX,_CellY,_CW,_CH,_Anchor,_menuNumber,_layerNumber;
_SCRIPT = "GMUI_CreateMenu";
_menuName = string(argument0);
_CellX = argument1;
_CellY = argument2;
_CW = argument3;
_CH = argument4;
_Anchor = argument5;


// Validate
if (!is_real(_CellX) || !is_real(_CellY)) {
    GMUI_ThrowErrorDetailed("Invalid parameters",_SCRIPT);
    return -1;
}

// Get menu number and assign name to the ID
(GMUII()).GMUI_menu_lastId += 1;
_menuNumber = (GMUII()).GMUI_menu_lastId;
ds_map_add((GMUII()).GMUI_menu_map,_menuName,_menuNumber);

_layerNumber = (GMUII()).layerDepth_maxLayers - 1;

// Create a group with the assigned layer and group numbers
if (GMUI_CreateGroup(_layerNumber,_menuNumber,_CellX,_CellY,_Anchor)) {
    (GMUII()).GMUI_groupCellsW[_layerNumber,_menuNumber] = _CW;
    (GMUII()).GMUI_groupCellsH[_layerNumber,_menuNumber] = _CH;
}
else
    return -1;


return _menuNumber;

#define GMUI_Destroy
///GMUI_Destroy()
///Only call this when you want to remove all traces of this GMUI instance, including the object itself

var gmuiid;

gmuiid = GMUIself();

if (gmuiid != -1) {
    GMUI_DestroyNumber(gmuiid);
}

#define GMUI_DestroyNumber
///GMUI_Destroy(GMUI number)
///Only call this when you want to remove all traces of the GMUI instance provided, including the object itself


with (argument0) {

    // Needs to destroy all controls
    var c, ctrl;
    for(c=0;c<ds_list_size(GMUI_controlList);c+=1) {
        // Get the control id
        ctrl = ds_list_find_value((GMUII()).GMUI_controlList,c);
        
        if (instance_exists(ctrl)) {
            with (ctrl) {
                instance_destroy();
            }
        }
    }
    
    ds_list_destroy(GMUI_controlList);
    
    
    // For each layer, clear its group lists and control lists
    var i,l,j,g;
    for(i=0;i<ds_list_size(GMUI_gridlist);i+=1) {
        l = ds_list_find_value(GMUI_gridlist,i);
        // Remove the groups
        for (j=0;j<ds_list_size(GMUI_groupList[l]);j+=1) {
            g = ds_list_find_value(GMUI_groupList[l],j);
            ds_list_destroy(GMUI_groupControlList[l,g]);
        }
        
        ds_grid_destroy(GMUI_grid[l]);
    }
    
    ds_list_destroy(GMUI_gridlist);
    
    
    
    ds_map_destroy(GMUI_menu_map);
    
    ds_map_destroy(GMUI_map);
    
    
    // will need to destroy surfaces if used
    
    
    
    // Destroy the object when done
    RemovingGMUI = true;
    instance_destroy();
}

#define GMUI_DrawDebug
// DEBUGGING SCRIPT! Call this in the draw event of the GMUI main object 
// Run only if DebugData is on
if (DebugData && !RemovingGMUI) {

    var gridW,gridH,w,h,xoffset,yoffset;
    gridW = GMUI_GridGetWidth(GMUII(),0);
    gridH = GMUI_GridGetHeight(GMUII(),0);
    
    if ((GMUII()).UIsnaptoview) {
        xoffset = view_xview[(GMUII()).UIgridview];
        yoffset = view_yview[(GMUII()).UIgridview];
    }
    
    // draw the grid lines 
    color_alpha(c_black,0.1);
    for (w=0;w<gridW;w+=1) {
        draw_line(w*cellsize+(GMUII()).GMUI_grid_x[0]+xoffset,yoffset,w*cellsize+(GMUII()).GMUI_grid_x[0]+xoffset,(GMUII()).UIgridheight+yoffset);
    }
    for (h=0;h<gridH;h+=1) {
        draw_line(xoffset,h*cellsize_h+(GMUII()).GMUI_grid_y[0]+yoffset,(GMUII()).UIgridwidth+xoffset,h*cellsize_h+(GMUII()).GMUI_grid_y[0]+yoffset);
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
            
            draw_rectangle(
                GMUI_groupActualX[layer,groupId] + (GMUII()).GMUI_grid_x[layer] + xoffset,
                GMUI_groupActualY[layer,groupId] + (GMUII()).GMUI_grid_y[layer] + yoffset,
                GMUI_groupActualX[layer,groupId] + GMUI_groupCellsW[layer,groupId]*cellsize + (GMUII()).GMUI_grid_x[layer] + xoffset,
                GMUI_groupActualY[layer,groupId] + GMUI_groupCellsH[layer,groupId]*cellsize_h + (GMUII()).GMUI_grid_y[layer] + yoffset,
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

#define GMUI_GridSetNavigation
///GMUI_GridSetNavigation(direction that navigates, back key, forward key, alternate back key [or -1], alternate forward key [or -1], allow tab)
///Set the controls that can navigate through the list
// Called by the GMUI instance in the form or otherwise

var _navdir, _back, _forward, _backalt, _forwardalt, _allowtab;
_navdir = minmax(argument0,0,2); // 3 and 2 count as the same
_back = argument1;
_forward = argument2;
_backalt = argument3;
_forwardalt = argument4;
_allowtab = argument5;

GMUI_navigateDirection = _navdir;
GMUI_backKey = _back;
GMUI_forwardKey = _forward;
GMUI_backAltKey = _backalt;
GMUI_forwardAltKey = _forwardalt;
GMUI_enableTab = _allowtab;

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
        GMUI_ThrowErrorDetailed("Control no longer exists layer, group: (" + _Layer + "," + _Group + ")","GMUI_GroupHide");
    }
    else {
        GMUI_ControlHide(ctrl,_Hide);
    }
}

#define GMUI_GroupSetFadeOnHide
///GMUI_GroupSetFadeOnHide(Layer Number, Group Number, speed in steps)
///Set the fade in/out when the control is hidden or not

// Arguments
var SCRIPT,_LayerNumber,_GroupNumber,_Speed, _ctrl;
SCRIPT = "GMUI_GroupSetFadeOnHide";
_LayerNumber = argument0;
_GroupNumber = argument1;
_Speed = max(0,argument2);

// Validate
if (!is_real(_GroupNumber) || !is_real(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Invalid parameters",_SCRIPT);
    return false;
}

if (!GMUI_LayerExists(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Layer " + string(_LayerNumber) + " doesn't exist", _SCRIPT);
    return false;
}

if (!GMUI_GroupExists(_LayerNumber,_GroupNumber)) {
    GMUI_ThrowErrorDetailed("Group " + string(_GroupNumber) + " doesn't exist on layer " + string(_LayerNumber), _SCRIPT);
    return false;
}

// Set fade on hide rule for all controls
var i;
for(i=0;i<ds_list_size((GMUII()).GMUI_groupControlList[_LayerNumber,_GroupNumber]);i+=1) {
    // Get the control id
    ctrl = ds_list_find_value((GMUII()).GMUI_groupControlList[_LayerNumber,_GroupNumber],i);
    
    if (!instance_exists(ctrl))
    {
        GMUI_ThrowErrorDetailed("Control no longer exists (" + _LayerNumber + "," + _GroupNumber + ")", _SCRIPT);
    }
    else {
        GMUI_ControlSetFadeOnHide(ctrl,_Speed);
    }
}

#define GMUI_GroupSetPosition
///GMUI_GroupSetPosition(Layer Number, Group Number, Cell X, Cell Y, X Adjustment, Y Adjustment)
///Change the position of the group (and all of the controls inside it)

// Arguments
var SCRIPT,_LayerNumber,_GroupNumber,_CellX,_CellY,_AdjustmentX,_AdjustmentY;
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

var _LayerNumber, _GroupNumber, _xcord, _ycord, _adjx, _adjy, _offsetx, _offsety;
_LayerNumber = argument0;
_GroupNumber = argument1;
_xcord = argument2;
_ycord = argument3;

// Validate
if (!is_real(_GroupNumber) || !is_real(_LayerNumber) || !is_real(_xcord) || !is_real(_ycord)) {
    GMUI_ThrowError("Invalid parameters for GMUI_GroupSetPositionActual");
    return false;
}

if (!GMUI_LayerExists(_LayerNumber)) {
    GMUI_ThrowError("Layer " + string(_LayerNumber) + " doesn't exist. GMUI_GroupSetPositionActual");
    return false;
}

if (!GMUI_GroupExists(_LayerNumber,_GroupNumber)) {
    GMUI_ThrowError("Group " + string(_GroupNumber) + " doesn't exist on layer " + string(_LayerNumber) + ". GMUI_GroupSetPositionActual");
}

_offsetx = 0;
_offsety = 0;

if ((GMUII()).UIsnaptoview) {
    _offsetx = view_xview[(GMUII()).UIgridview];
    _offsety = view_yview[(GMUII()).UIgridview];
}

_adjx = _xcord - _offsetx - GMUI_CellGetActualX(GMUI_GridGetCellX(GMUII(),_LayerNumber,_xcord));
_adjy = _ycord - _offsety - GMUI_CellGetActualY(GMUI_GridGetCellY(GMUII(),_LayerNumber,_ycord));

// Set position by default anchor (topleft), and adjustment to the given coordinates
GMUI_GroupSetPositionAnchored(_LayerNumber,_GroupNumber,GMUI_GridGetCellX(GMUII(),_LayerNumber,_xcord),GMUI_GridGetCellY(GMUII(),_LayerNumber,_ycord),_adjx,_adjy,0);

#define GMUI_GroupSetSize
///GMUI_GroupSetSize(Layer, Group, cells wide, cells high)
///Set the cell size of the group

var _groupNumber, _CellsW, _CellsH, _layerNumber;
_layerNumber = argument0;
_groupNumber = argument1;
_CellsW = argument2;
_CellsH = argument3;


GMUI_groupCellsW[_layerNumber,_groupNumber] = _CellsW;
GMUI_groupCellsH[_layerNumber,_groupNumber] = _CellsH;

#define GMUI_GroupSetSpriteMap
///GMUI_GroupSetSpriteMap(Layer, Group, sprite top, sprite top right, right, bottom right, bottom, bottom left, left, top left, center, center fixed partial [1] / stretched[0])
///Replace the group drawing with a sprite map of each corner, side, and center

// Arguments
var SCRIPT,_LayerNumber,_GroupNumber;
SCRIPT = "GMUI_GroupSetSpriteMap";
_LayerNumber = argument0;
_GroupNumber = argument1;

// Validate
if (!is_real(_GroupNumber) || !is_real(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Invalid parameters",SCRIPT);
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


if (sprite_exists(argument2))
    (GMUII()).GMUI_groupGraphicTop[_LayerNumber,_GroupNumber] = argument2;
else
    (GMUII()).GMUI_groupGraphicTop[_LayerNumber,_GroupNumber] = -1;
    
if (sprite_exists(argument3))
    (GMUII()).GMUI_groupGraphicTopRight[_LayerNumber,_GroupNumber] = argument3;
else
    (GMUII()).GMUI_groupGraphicTopRight[_LayerNumber,_GroupNumber] = -1;

if (sprite_exists(argument4))
    (GMUII()).GMUI_groupGraphicRight[_LayerNumber,_GroupNumber] = argument4;
else
    (GMUII()).GMUI_groupGraphicRight[_LayerNumber,_GroupNumber] = -1;
    
if (sprite_exists(argument5))
    (GMUII()).GMUI_groupGraphicBottomRight[_LayerNumber,_GroupNumber] = argument5;
else
    (GMUII()).GMUI_groupGraphicBottomRight[_LayerNumber,_GroupNumber] = -1;
    
if (sprite_exists(argument6))
    (GMUII()).GMUI_groupGraphicBottom[_LayerNumber,_GroupNumber] = argument6;
else
    (GMUII()).GMUI_groupGraphicBottom[_LayerNumber,_GroupNumber] = -1;
    
if (sprite_exists(argument7))
    (GMUII()).GMUI_groupGraphicBottomLeft[_LayerNumber,_GroupNumber] = argument7;
else
    (GMUII()).GMUI_groupGraphicBottomLeft[_LayerNumber,_GroupNumber] = -1;
    
if (sprite_exists(argument8))
    (GMUII()).GMUI_groupGraphicLeft[_LayerNumber,_GroupNumber] = argument8;
else
    (GMUII()).GMUI_groupGraphicLeft[_LayerNumber,_GroupNumber] = -1;
    
if (sprite_exists(argument9))
    (GMUII()).GMUI_groupGraphicTopLeft[_LayerNumber,_GroupNumber] = argument9;
else
    (GMUII()).GMUI_groupGraphicTopLeft[_LayerNumber,_GroupNumber] = -1;
    
if (sprite_exists(argument10))
    (GMUII()).GMUI_groupGraphicCenter[_LayerNumber,_GroupNumber] = argument10;
else
    (GMUII()).GMUI_groupGraphicCenter[_LayerNumber,_GroupNumber] = -1;
    
if (is_real(argument11))
    (GMUII()).GMUI_groupGraphicCenterIsFixed[_LayerNumber,_GroupNumber] = !(argument11 < 1);
else
    (GMUII()).GMUI_groupGraphicCenterIsFixed[_LayerNumber,_GroupNumber] = 0;
    
    

(GMUII()).GMUI_groupGraphicMapIsUsed[_LayerNumber,_GroupNumber] = true;
        

return true;

#define GMUI_Init
///GMUI_Init() Call this initialization script before creating any GMUI interfaces
//
// !WARNING! MODIFYING THE GMUI SCRIPTS CAN BREAK FUNCTIONALITY AND CAUSE ERRORS! TRY TO EDIT THE OBJECTS INSTEAD!
//
// Copyright 2017 Alert Studios (Mark Palnau). Initially designed by Alert Studios and released as Open-Source.
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
global.GMUIAnchorCenter = 9;

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

// Control datatypes
global.GMUIDataTypeString = 0;
global.GMUIDataTypeInteger = 1;
global.GMUIDataTypeDecimal = 2;
global.GMUIDataTypeButton = 3;
global.GMUIDataTypeInfo = 4;


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

_mouseCellX = GMUI_GridGetMouseCellX(GMUII());
_mouseCellY = GMUI_GridGetMouseCellY(GMUII());

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

// STEP actions:

// Run transition action
if (Transitioning) {
    if (GMUI_IsScript(TransitionScript)) {
        if (Hovering)
            Hovering = false;
        if (TooltipId != -1)
            GMUI_ControlHide(TooltipId,1);
            
        if (T_t < T_d) {
            T_t += 1;
            ActualX = script_execute(TransitionScript,T_t,T_bx,T_cx,T_d);
            ActualY = script_execute(TransitionScript,T_t,T_by,T_cy,T_d);
            
            if (TransitioningGroup && (GMUIP).GMUI_groupMasterControl[Layer,Group] == id) {
                (GMUIP).GMUI_groupActualX[Layer,Group] = script_execute(TransitionScript,T_t,T_bx_group,T_cx_group,T_d);
                (GMUIP).GMUI_groupActualY[Layer,Group] = script_execute(TransitionScript,T_t,T_by_group,T_cy_group,T_d);
            }
        }
        else {
            T_t = T_d;
            Transitioning = false;
            
            if (TransitioningGroup) {
                if ((GMUIP).GMUI_groupMasterControl[Layer,Group] == id) {
                    var _getGroupX,_getGroupY,_diffX,_diffY;
                    _diffX = (GMUIP).GMUI_groupActualX[Layer,Group]-GMUI_CellGetActualX(GMUI_GridGetCellXRoom(GMUIP,Layer,(GMUIP).GMUI_groupActualX[Layer,Group]));
                    _diffY = (GMUIP).GMUI_groupActualY[Layer,Group]-GMUI_CellGetActualY(GMUI_GridGetCellYRoom(GMUIP,Layer,(GMUIP).GMUI_groupActualY[Layer,Group]));
                    
                    _getGroupX = GMUI_GetAnchoredCellX(GMUI_GridGetWidth(GMUIP,Layer),GMUI_GridGetCellXRoom(GMUIP,Layer,(GMUIP).GMUI_groupActualX[Layer,Group]),(GMUIP).GMUI_groupAnchor[Layer,Group]);
                    _getGroupY = GMUI_GetAnchoredCellY(GMUI_GridGetHeight(GMUIP,Layer),GMUI_GridGetCellYRoom(GMUIP,Layer,(GMUIP).GMUI_groupActualY[Layer,Group]),(GMUIP).GMUI_groupAnchor[Layer,Group]);
                    
                    GMUI_GroupSetPositionAnchored(Layer,Group,_getGroupX,_getGroupY,
                        _diffX,_diffY,
                        (GMUIP).GMUI_groupAnchor[Layer,Group]);
                        
                    TransitioningGroup = false;
                }
            }
            else {
                CellX = GMUI_GridGetCellX(GMUIP,Layer,ActualX);
                CellY = GMUI_GridGetCellY(GMUIP,Layer,ActualY);
                
                GMUI_ControlSetPositioning(CellX*(GMUIP).cellsize,CellY*(GMUIP).cellsize_h,ActualW,ActualH);
            }            
        }
       
        // Update control draw location in the room
        NeedsPositionUpdate = true;
    }
    else {
        Transitioning = false;
    }
}

// Run fade in/out action
if (FadeCalled != 0) {
    // Fade in, else, fade out
    if (FadeCalled > 0) {
        if (FadeAlpha < FadeIn) {
            FadeAlpha += 1/FadeTime;
        }
        else {
            FadeAlpha = FadeIn;
            FadeCalled = 0;
        }
    }
    else {
        if (FadeAlpha > FadeOut) {
            FadeAlpha -= 1/FadeTime;
        }
        else {
            FadeAlpha = FadeOut;
            FadeCalled = 0;
        }
    }
    NeedsDrawUpdate = true;
}

// Set new position if the view offset has changed, or transitioning
if (NeedsPositionUpdate) {
    GMUI_ControlUpdateXY(id);
    NeedsPositionUpdate = false;
    NeedsDrawUpdate = true;
}



// Don't process any input or drawing if hidden
if (Hidden && FadeCalled == 0)
    return false;
//
    

// Process input 
if (Selected && !Hidden) {
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
        
        // Only does assignment of the value once the key is released (and not transitioning)
        if (Transitioning) {
            keyboard_string = valueString;
        }
        else if (keyboard_check_released(vk_anykey)) {
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
                
    GMUI_SetValue(valueName,value,ControlDataType);
    
    //Reset
    valueChangeDetected = 0;
}


// DRAW //

if (argument0 == true) {

    // Call the draw actions for groups if in one and is set to draw
    if ((GMUIP).GMUI_groupMasterControl[Layer,Group] == id) {
        GMUI_ControlDrawGroup(GMUIP,Layer,Group);
    }

    // Draw the control based on the type and user-defined settings
    var padx, _BackgroundAlpha;
    padx = ControlPaddingX;
    _BackgroundAlpha = min(ControlBackgroundAlpha,FadeAlpha);
    _HoverAlpha = min(ControlHoverAlpha,FadeAlpha);
    _SelectAlpha = min(ControlSelectAlpha,FadeAlpha);
    _OverwriteAlpha = min(ControlOverwriteAlpha,FadeAlpha);
    _FontAlpha = min(ControlFontAlpha,FadeAlpha);
    
        
    // Start drawing the control (inputs and buttons)
    if (ControlInput || ControlDataType == global.GMUIDataTypeButton) {
        if (ControlGraphicMapIsUsed) {
            GMUI_DrawSpriteBox(GMUIP,Layer,Group,0);
        }
        else if (sprite_exists(ControlGraphic)) {
            // Sprite has been substituted for the default drawing
            var subi; subi = ControlGraphicIndex;
            if (Hovering) subi = ControlGraphicHoveringIndex;
            if (Selected) subi = ControlGraphicSelectedIndex;
            
            draw_sprite_ext(ControlGraphic,subi,RoomX,RoomY,ControlGraphicXScale,ControlGraphicYScale,ControlGraphicRotation,ControlGraphicColor,ControlGraphicAlpha);
        }
        else {
            // Background
            color_alpha(ControlBackgroundColor,_BackgroundAlpha);
            draw_rectangle(RoomX, RoomY, RoomW, RoomH, 0);
            
            // Border
            color_alpha(ControlBorderColor,_BackgroundAlpha);
            draw_rectangle(RoomX, RoomY, RoomW, RoomH, 1);
        
    
            if (Hovering || Selected) {
                // Draw the hovering effect
                if (!Selected)
                    color_alpha(ControlHoverColor,_HoverAlpha);
                else
                    color_alpha(ControlSelectColor,_SelectAlpha);
                draw_rectangle(RoomX+1,RoomY+1,RoomW-1,RoomH-1, ControlHoverBorder);
            }
            
            if (DoubleSelected && ControlInput) {
                // Draw 'Overwrite' affect
                color_alpha(ControlOverwriteColor,_OverwriteAlpha);
                draw_rectangle(RoomX+2,RoomY+2,RoomW-2,RoomH-2,0);
            }
        }
    }
    else if (ControlType == "tooltip") {
        GMUI_ControlDrawTooltipById(id);
    }
    
    
    
    // Draw special features for the other types
    // Picker types (integer, double, etc)
    if (ControlPicker) {
        // draw arrows (origin should be on the right and to the corner it is placed at)
        // Top arrow and bottom arrow
        draw_sprite_ext(ControlPickerSpriteRightOrUp,0,RoomW-2,RoomY+2,1,1,0,c_white,_BackgroundAlpha);
        draw_sprite_ext(ControlPickerSpriteLeftOrDown,0,RoomW-2,RoomH-2,1,1,0,c_white,_BackgroundAlpha);
        
        if (ControlPickerDirection == global.GMUIDirectionTypeSideVertical) {
            color_alpha(ControlHoverColor,_HoverAlpha);
            switch (HoveringDirection) {
                case global.GMUIHoveringDirection_Up:
                    draw_rectangle(RoomW-2-ControlPickerWidth,RoomY,RoomW-1,RoomY+(RoomH-RoomY)/2,0);
                    break;
                case global.GMUIHoveringDirection_Down:
                    draw_rectangle(RoomW-2-ControlPickerWidth,RoomH-(RoomH-RoomY)/2,RoomW-1,RoomH,0);
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
    dtx = RoomX + padx;    
    if (ControlFontAlign == fa_center)
        dtx = RoomX+(RoomW-RoomX)/2;
    else if (ControlFontAlign == fa_right)
        dtx = RoomW - padx;
    else if (ControlFontAlign != fa_left) {
        ControlFontAlign = (GMUIP).ControlFontAlign;
        GMUI_ThrowErrorDetailed("Invalid font align","GMUI_ControlDraw");
    }
    
    if (ActualH > 0)
        midHeight = ActualH / 2;
    else
        midHeight = CellHigh * (GMUIP).cellsize_h / 2;
        
    // Set control font and alignment
    draw_set_font(ControlFont);
    align(ControlFontAlign,ControlFontAlignV);
    
    // Specific controls may override display
    if (ControlDataType == global.GMUIDataTypeButton && ControlButtonTextHoveringOn && Hovering)
        color_alpha(ControlButtonTextHoverColor,_FontAlpha);
    else
        color_alpha(ControlFontColor,_FontAlpha);
        
    // TEMPORARY SOLUTION! :
    if (Disabled)
        draw_set_alpha(_FontAlpha / 2);
        
    // Button with graphic inside
    if (ControlDataType == global.GMUIDataTypeButton) {
        if (sprite_exists(ControlButtonGraphic)) {
            draw_sprite(ControlButtonGraphic,0,dtx, RoomY + midHeight);
            dtx += sprite_get_width(ControlButtonGraphic) + padx;
        }
    }
    
    // Draw value string or button text
    if (ControlShowCursor && Selected && !DoubleSelected)
        Text = Text + "|";
    draw_text(dtx, RoomY + midHeight,Text);
    
}
//

#define GMUI_ControlDrawTooltipById
///GMUI_ControlDrawTooltipById(id of tooltip control object)
/// Draw the control as a tooltip

var _tt_id;
_tt_id = argument0;

with (_tt_id) {
    var _txt, cx, cy, cwx, chy, minx, maxx, miny, maxy, padx, pady;
    _txt = valueString;
    cx = RoomX;
    cy = RoomY;
    cwx = RoomW;
    chy = RoomH;
    padx = ControlPaddingX;
    pady = ControlPaddingY;
    
    // Draw the area
    color_alpha(ControlBackgroundColor,min(ControlBackgroundAlpha,FadeAlpha));
    draw_rectangle(cx, cy, cwx+padx*2, chy, 0);
    
    
    // Draw point based on the direction of the tooltip (relative to the parent control)
    // Points are drawn: left corner, right corner, then top
    switch (TT_direction) {
        case global.GMUIAnchorLeft:
            draw_triangle(cx,max(cy,cy+TT_yposition-TT_arrowsize),cx,min(cy+TT_yposition+TT_arrowsize,chy),cx-TT_xposition,cy+TT_yposition,0);
            break;
        case global.GMUIAnchorRight:
            draw_triangle(cwx,max(cy,cy+TT_yposition-TT_arrowsize),cwx,min(cy+TT_yposition+TT_arrowsize,chy),cwx+TT_xposition,cy+TT_yposition,0);
            break;
        case global.GMUIAnchorBottom:
        case global.GMUIAnchorBottomRight:
        case global.GMUIAnchorBottomLeft:
            draw_triangle(max(cx,cx+TT_xposition-TT_arrowsize),chy,min(cx+TT_xposition+TT_arrowsize,cwx),chy,cx+TT_xposition,chy+TT_yposition,0);
            break;
        case global.GMUIAnchorTop:
        case global.GMUIAnchorTopLeft:
        case global.GMUIAnchorTopRight:
            draw_triangle(max(cx,cx+TT_xposition-TT_arrowsize),cy,min(cx+TT_xposition+TT_arrowsize,cwx),cy,cx+TT_xposition,cy-TT_yposition,0);
            break;
    }
    
    color_alpha(ControlFontColor,min(ControlFontAlpha,FadeAlpha));
    
    var _dtx, _midHeight;
    _dtx = cx + padx;
    
    draw_text_ext(_dtx,cy + (chy-cy)/2,_txt,-1,cwx);
}

#define GMUI_ControlDrawGroup
///GMUI_ControlDrawGroup(GMUI instance, Layer, Group)
///Draws the group if set to do any drawing - Called by master control of group

var _GMUII, _layer, _group, gx, gy, gw, gh;
_GMUII = argument0;
_layer = argument1;
_group = argument2;

// Draw the selected group if set from the form
if ((_GMUII).GMUI_groupGraphicMapIsUsed[_layer,_group]) {
    GMUI_DrawSpriteBox(_GMUII,_layer,_group,1);
}            


#define GMUI_ControlInit
///GMUI_ControlInit(control object to instantiate)
/// Initialize the values to use with a GMUI control
// These values are controlled by the GMUI controller, and if commented, they are actually intialized by the Add script.

var i; i = argument0;

if (!instance_exists(i))
    return false;
    
// The parent GMUI Instance
i.GMUIP = -1;

i.Hovering = 0;
i.Selected = 0;
i.DoubleSelected = 0;

i.ControlType = "";
i.ControlDataType = global.GMUIDataTypeString; // Default (0)

i.NeedsPositionUpdate = false;
i.NeedsDrawUpdate= false;

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
i.HoverOffActionScript = -1;
i.SelectingActionScript = -1;
i.DeselectActionScript = -1;
i.ValueChangedActionScript = -1;

// All of these values are set when added ::

// Layer can disable the control if a higher layer is opened (0 is default)
//Layer = 0;

// Group allows actions for a group of controls, such as disabling, moving, and hiding (0 is no-group)
//Group = 0;

// Cells work like the room grid and are assigned numbers baised on the cell dimensions given
//CellWide = 1;
//CellHigh = 1;
//CellWideMax = 1;
//CellHighMax = 1;
//CellX = 0;
//CellY = 0;

// Horizontal font alignment always set on creation
//ControlFontAlign = fa_left;
i.ControlFontAlignV = fa_middle;
i.ControlPaddingX = 4;
i.ControlPaddingY = 4;

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

// Real room location after adjustments made to the grid, boundary, and offsets
i.RoomX = 0;
i.RoomY = 0;
i.RoomW = 0;
i.RoomH = 0;

// Graphical variables
i.outboundMax = ceil(room_speed/3);
i.outbound = 0;
i.inboundMax = ceil(room_speed/3);
i.inbound = 0;

// Tooltip variables (relative)
i.TooltipId = -1;
i.TT_arrowsize = 16;
i.TT_xposition = 0;
i.TT_yposition = 0;
i.TT_direction = 0;
i.TT_minx = 0;
i.TT_miny = 0;
i.TT_maxx = 0;
i.TT_maxy = 0;
i.TT_relativeCellX = 0;
i.TT_relativeCellY = 0;

// Transitions: time: t, begin: xy, change: xy, delta: d
i.Transitioning = false;
i.TransitioningGroup = false;
i.TransitionScript = -1;

i.T_t = 0;
i.T_bx = 0;
i.T_cx = 0;
i.T_by = 0;
i.T_cy = 0;
i.T_d = room_speed;

i.T_bx_group = 0;
i.T_by_group = 0;
i.T_cx_group = 0;
i.T_cy_group = 0;

// Effects
i.FadeAlpha = 1; // of 1
i.FadeIn = 1;
i.FadeOut = 0;
i.FadeTime = room_speed; // in steps
i.FadeCalled = 0; // 0 for none, 1 for up, -1 for down
i.FadeOnHide = false;


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

#define GMUI_ControlSetDefaultSpriteMap
///GMUI_ControlSetDefaultSpriteMap(id)
///Set the default attributes of the control from the controller

if (!instance_exists(argument0)) {
    GMUI_ThrowErrorDetailed("Invalid control","GMUI_ControlSetDefaultSpriteMap");
    return false;
}

with (argument0) {
    GMUI_ControlSetSpriteMap(
        (GMUII()).ControlGraphicTop,
        (GMUII()).ControlGraphicTopRight,
        (GMUII()).ControlGraphicRight,
        (GMUII()).ControlGraphicBottomRight,
        (GMUII()).ControlGraphicBottom,
        (GMUII()).ControlGraphicBottomLeft,
        (GMUII()).ControlGraphicLeft,
        (GMUII()).ControlGraphicTopLeft,
        (GMUII()).ControlGraphicCenter,
        (GMUII()).ControlGraphicCenterIsFixed
    );
    
    ControlGraphicMapIsUsed = false;
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
///GMUI_ControlSetType(Control, "Control Type")
///Set the type variables based on the control the developer wants to make

var IID,            _type,              isinput,    ispicker,   canInteract,    _getType;
    IID=argument0;  _type=argument1;    isinput=0;  ispicker=0; canInteract=1;  _getType=0;

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
    case "tooltip":
        canInteract = false;
        break;
    default:
        // no match; override to show invalid:
        _type = "invalid";
        
        break;
}

(IID).ControlType = _type;
(IID).ControlInput = isinput;
(IID).ControlPicker = ispicker;
(IID).ControlInteraction = canInteract;


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



#define GMUI_ControlUpdateXY
///GMUI_ControlUpdateXY(control)
///Updates the actual location in the room after adjustments

var _ctrl, _GMUIP, _xoffset, _yoffset;
_ctrl = argument0;
_GMUIP = (_ctrl).GMUIP;

if (!GMUI_IsControlID(_ctrl)) {
    GMUI_ThrowErrorDetailed("Invalid control","GMUI_ControlUpdateXY");
    return false;
}

if ((_GMUIP).UIsnaptoview) {
    _xoffset = view_xview[(_GMUIP).UIgridview];
    _yoffset = view_yview[(_GMUIP).UIgridview];
}

// X,Y position
(_ctrl).RoomX = (_ctrl).ActualX + (_ctrl).RelativeX + (_GMUIP).GMUI_grid_x[(_ctrl).Layer] + _xoffset;
(_ctrl).RoomY = (_ctrl).ActualY + (_ctrl).RelativeY + (_GMUIP).GMUI_grid_y[(_ctrl).Layer] + _yoffset;

// Width and height
if ((_ctrl).ActualW > 0)
    (_ctrl).RoomW = (_ctrl).RoomX + (_ctrl).ActualW;
else
    (_ctrl).RoomW = (_ctrl).RoomX + (_ctrl).CellWide * (_GMUIP).cellsize;
    
if ((_ctrl).ActualH > 0)
    (_ctrl).RoomH = (_ctrl).RoomY + (_ctrl).ActualH;
else
    (_ctrl).RoomH = (_ctrl).RoomY + (_ctrl).CellHigh * (_GMUIP).cellsize_h;
    
// If the control has a tooltip, update the tooltip location
if ((_ctrl).TooltipId != -1) {
    GMUI_ControlPosition((_ctrl).TooltipId,
        (_ctrl).CellX + ((_ctrl).TooltipId).TT_relativeCellX,
        (_ctrl).CellY + ((_ctrl).TooltipId).TT_relativeCellY,
        0,0,
        (_ctrl).Anchor);
    ((_ctrl).TooltipId).NeedsPositionUpdate = true;
}

#define GMUI_DrawSpriteBox
///GMUI_DrawSpriteBox(GMUI instance, Layer, Group, Control[0] / Group [1] / Menu[2])
///Draws the box of the specified type

var _GMUII, _layer, _group, _bType;
_GMUII = argument0;
_layer = argument1;
_group = argument2;
_bType = argument3;

var _dbx, _dby, _dbw, _dbh, _xoffset, _yoffset, _spr_width, _spr_height, _spr_isFixed,
    _sprTopLeft, _sprTop, _sprTopRight, _sprRight, _sprBottomRight, _sprBottom, _sprBottomLeft, _sprLeft, _sprCenter;

if ((_GMUII).UIsnaptoview) {
    _xoffset = view_xview[(_GMUII).UIgridview];
    _yoffset = view_yview[(_GMUII).UIgridview];
}

if (_bType == 0) {
    // Control
    if (!ControlGraphicMapIsUsed)
        return false;
    
    // dimensions
    _dbx = RoomX;
    _dby = RoomY;
    _dbw = CellWide * (GMUIP).cellsize;
    _dbh = CellHigh * (GMUIP).cellsize_h;
    _spr_width = sprite_get_width(ControlGraphicTopLeft);
    _spr_height = sprite_get_height(ControlGraphicTopLeft);
    
    _sprTopLeft = ControlGraphicTopLeft;
    _sprTop = ControlGraphicTop;
    _sprTopRight = ControlGraphicTopRight;
    _sprRight = ControlGraphicRight;
    _sprBottomRight = ControlGraphicBottomRight;
    _sprBottom = ControlGraphicBottom;
    _sprBottomLeft = ControlGraphicBottomLeft;
    _sprLeft = ControlGraphicLeft;
    
    _sprCenter = ControlGraphicCenter;
    _spr_isFixed = ControlGraphicCenterIsFixed;
}
else if (_bType == 1) {
    // Group
    if (!(_GMUII).GMUI_groupGraphicMapIsUsed[_layer,_group])
        return false;
        
    // dimensions
    _dbx = (_GMUII).GMUI_groupActualX[_layer,_group] + (_GMUII).GMUI_grid_x[_layer] + _xoffset;
    _dby = (_GMUII).GMUI_groupActualY[_layer,_group] + (_GMUII).GMUI_grid_y[_layer] + _yoffset;
    _dbw = (_GMUII).GMUI_groupCellsW[_layer,_group]*(_GMUII).cellsize + (_GMUII).GMUI_grid_x[_layer,_group] + _xoffset;
    _dbh = (_GMUII).GMUI_groupCellsH[_layer,_group]*(_GMUII).cellsize_h + (_GMUII).GMUI_grid_y[_layer,_group] + _yoffset;
    _spr_width = sprite_get_width((_GMUII).GMUI_groupGraphicTopLeft[_layer,_group]);
    _spr_height = sprite_get_height((_GMUII).GMUI_groupGraphicTopLeft[_layer,_group]);
    
    _sprTopLeft = (_GMUII).GMUI_groupGraphicTopLeft[_layer,_group];
    _sprTop = (_GMUII).GMUI_groupGraphicTop[_layer,_group];
    _sprTopRight = (_GMUII).GMUI_groupGraphicTopRight[_layer,_group];
    _sprRight = (_GMUII).GMUI_groupGraphicRight[_layer,_group];
    _sprBottomRight = (_GMUII).GMUI_groupGraphicBottomRight[_layer,_group];
    _sprBottom = (_GMUII).GMUI_groupGraphicBottom[_layer,_group];
    _sprBottomLeft = (_GMUII).GMUI_groupGraphicBottomLeft[_layer,_group];
    _sprLeft = (_GMUII).GMUI_groupGraphicLeft[_layer,_group];
    
    _sprCenter = (_GMUII).GMUI_groupGraphicCenter[_layer,_group];
    _spr_isFixed = (_GMUII).GMUI_groupGraphicCenterIsFixed[_layer,_group];
}
else if (_bType == 2) {
    // Menu
    
    // dimensions
}

// Draw the box based on the dimensions and sprites gathered 
// top left
draw_sprite(_sprTopLeft,-1,_dbx,_dby);

// top
draw_sprite_stretched(_sprTop,-1,_dbx+_spr_width,_dby,_dbw-_spr_width*2,sprite_get_height(_sprTop));//_spr_height);

// top right
draw_sprite(_sprTopRight,-1,_dbx+_dbw-_spr_width,_dby);

// right
draw_sprite_stretched(_sprRight,-1,_dbx+_dbw-_spr_width,_dby+_spr_height,_spr_width,_dbh-_spr_height);

// bottom right
draw_sprite(_sprBottomRight,-1,_dbx+_dbw-_spr_width,_dby+_dbh-_spr_height);

// bottom
draw_sprite_stretched(_sprBottom,-1,_dbx+_spr_width,_dby+_dbh-_spr_height,_dbw-_spr_width*2,sprite_get_width(_sprBottom));

// bottom left
draw_sprite(_sprBottomLeft,-1,_dbx,_dby+_dbh-_spr_height);

// left
draw_sprite_stretched(_sprLeft,-1,_dbx,_dby+_spr_height,_spr_width,_dbh-_spr_height);


// center (either partial or stretched to fit)
if (_spr_isFixed) {
    draw_sprite_part(_sprCenter,-1,0,0,_dbw-_spr_width*2,_dbh-_spr_height*2,_dbx+_spr_width,_dby+_spr_height);
}
else {
    draw_sprite_stretched(_sprCenter,-1,_dbx+_spr_width,_dby+_spr_height,_dbw-_spr_width*2,_dbh-_spr_height*2);
}

#define GMUI_CreateSetDefaultArea
///GMUI_CreateSetDefaultArea() Set the default area to use to set the grid size for layers called by GMUI_Create()
///This depends on views or room size to set the grid size

UIsnaptoview = true;
UIgridview = 0;

UIgridwidth = room_width;
UIgridheight = room_height;

if (view_enabled) {
    UIgridwidth = view_wport[UIgridview];
    UIgridheight = view_hport[UIgridview];
}

#define GMUI_GetAnchoredCellX
///GMUI_GetAnchoredCellX(Area Width, Cell X given, Anchor Type)
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

#define GMUI_GetControlAtPosition
///GMUI_GetControlAtPosition(GMUI instance,X,Y)
///Returns the control that is present in the cell if one exists there

var _CellHor, _CellVer, _PosX, _PosY, _GMUII, _ctrlObject;
_GMUII = argument0;
_PosX = argument1;
_PosY = argument2;

// Position (typically mouse) must be greater than the x and y position of the grid to find a control
if (_PosX < (_GMUII).GMUI_grid_x[(_GMUII).UILayer] || _PosY < (_GMUII).GMUI_grid_y[(_GMUII).UILayer])
    return -1;

_CellHor = GMUI_GridGetCellX(_GMUII,(_GMUII).UILayer,_PosX);
_CellVer = GMUI_GridGetCellY(_GMUII,(_GMUII).UILayer,_PosY);
    
// Position (typically mouse) must be within the width and height of the grid
if (_CellHor >= (_GMUII).GMUI_grid_w[(_GMUII).UILayer] || _CellVer >= (_GMUII).GMUI_grid_h[(_GMUII).UILayer])
    return -1;


// Retrieve value and then object at that position
_ctrlObject = ds_grid_get((_GMUII).GMUI_grid[(_GMUII).UILayer],_CellHor,_CellVer);

if (is_real(_ctrlObject)) {
    if (_ctrlObject != 0) {
        if (instance_exists(_ctrlObject)) {
            return _ctrlObject;
        }
        else
            GMUI_ThrowErrorDetailed("Instance recorded is not a control object or no longer exists","GMUI_GetControlAtPosition");
    }
}

// Couldn't find the instance, or none assigned at this cell.
return -1;

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
    case "tooltip":
        return global.GMUIDataTypeInfo;
        break;
    default:
        return -1;
        break;
}

#define GMUI_GridAdjust
///GMUI_GridAdjust(cells wide , cells high)
/// Adjusts grid for all layers of the GMUI instance

var layer, i;
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


var _GMUI,_Layer, CW, CH;
_GMUI = GMUII();
_Layer = floor(argument0);

// If cells wide/high are 0, then it is assumed to be adjusted to the room or view dimensions
if (argument1 == 0)
    CW = ceil((_GMUI).UIgridwidth/(_GMUI).cellsize);
else
    CW = argument1;

if (argument2 == 0)
    CH = ceil((_GMUI).UIgridheight/(_GMUI).cellsize_h);
else
    CH = argument2;

ds_grid_resize((_GMUI).GMUI_grid[_Layer],CW,CH);

(_GMUI).UIgridwidth = max((_GMUI).UIgridwidth, CW * (_GMUI).cellsize);
(_GMUI).UIgridheight = max((_GMUI).UIgridheight, CH * (_GMUI).cellsize_h);
(_GMUI).GMUI_grid_w[_Layer] = CW * (_GMUI).cellsize;
(_GMUI).GMUI_grid_h[_Layer] = CH * (_GMUI).cellsize_h;


// Get grid dimensions
var gridW, gridH, anc, relX, relY, pCellX, pCellY;
gridW = GMUI_GridGetWidth(_GMUI,_Layer);
gridH = GMUI_GridGetHeight(_GMUI,_Layer);

// Move any controls that are anchored to other positions
var ctrl;
for(i=0;i<ds_list_size((_GMUI).GMUI_controlList);i+=1) {
    // Get control value
    ctrl = ds_list_find_value((_GMUI).GMUI_controlList,i);
    
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
for(i=0;i<ds_list_size((_GMUI).GMUI_groupList[_Layer]);i+=1) {
    groupId = ds_list_find_value((_GMUI).GMUI_groupList[_Layer],i);
    
    GMUI_GroupSetPosition(_Layer,groupId,GMUI_groupCellX[_Layer,groupId],GMUI_groupCellY[_Layer,groupId],GMUI_groupRelativeX[_Layer,groupId],GMUI_groupRelativeY[_Layer,groupId]);
}

// Reset the regions for the layer
GMUI_GridSetRegionsLayer(_Layer);



return true;


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
    var MX, MY, inRegion, onDirection, mouseHor, mouseVert, ctrlObject;
    MX = mouse_x;
    MY = mouse_y;
    inRegion = false;
    
    // Check if the mouse has moved before checking for any changed selections
    if (MX != mouse_px || MY != mouse_py) {
        // Find if there is a control at that position on the current layer
        ctrlObject = GMUI_GetControlAtPosition(id,MX,MY);
        
        if (ctrlObject != -1) {
            if (DebugData) TestHoverObject = ctrlObject;
            
            if (previousHoveringControl != -1 && ctrlObject != previousHoveringControl) {
                (previousHoveringControl).Hovering = 0;
                (previousHoveringControl).HoveringDirection = 0;
                if (GMUI_IsScript((previousHoveringControl).HoverOffActionScript)) {
                    script_execute((previousHoveringControl).HoverOffActionScript);
                }
                previousHoveringControl = -1;
            }
            
            if (!ctrlObject.Disabled && !ctrlObject.NonClickable) {
                ctrlObject.Hovering = 0;
                ctrlObject.HoveringDirection = 0;
                
                if (!ctrlObject.IsAdjusted) {
                    inRegion = true;
                }
                else if (GMUI_MouseInAdjustedRegion(ctrlObject,MX,MY)) {
                    inRegion = true;
                }
                    
                
                if (inRegion) {
                    // The int picker has a region on the right side for up/down
                    if (ctrlObject.ControlType == "intpicker")
                    {
                        onDirection = GMUI_MouseInSpecialRegion(ctrlObject,MX,MY);
                        
                        if (onDirection != global.GMUIHoveringDirection_None) {
                            ctrlObject.HoveringDirection = onDirection;
                        }
                        else {
                            ctrlObject.Hovering = 1;
                        }
                            
                    }
                    else {
                        ctrlObject.Hovering = 1;
                    }
                    
                    // Set the hovering control and execute optional hover action if set
                    if (ctrlObject != previousHoveringControl) {
                        HoveringControl = ctrlObject;
                        previousHoveringControl = ctrlObject;
                        
                        if (GMUI_IsScript(ctrlObject.HoverActionScript)) {
                            script_execute((ctrlObject).HoverActionScript);
                        }
                    }
                }
                
            }
        }
        else if (HoveringControl != -1) {
            if (previousHoveringControl != -1) {
            global.test = previousHoveringControl;
                if (GMUI_IsScript((previousHoveringControl).HoverOffActionScript)) {
                    script_execute((previousHoveringControl).HoverOffActionScript);
                }
                previousHoveringControl = -1;
            }
            GMUI_ResetControlStatus("Hovering",id);
            HoveringControl = -1;
        }
    
    
        // Reset previous position
        mouse_px = MX;
        mouse_py = MY;
    }
    
    // Mouse click on grid
    if (mouse_check_button_pressed(mb_left)) {
        GMUI_ResetControlStatus("Selected",id);

        // Find if there is a control at that position with the current layer
        ctrlObject = GMUI_GetControlAtPosition(id,MX,MY);

        if (ctrlObject != -1) {
            if ((!ctrlObject.Disabled) && (!ctrlObject.NonClickable) && (!ctrlObject.Hidden)) {
                if (ctrlObject.IsAdjusted) {
                    if (GMUI_MouseInAdjustedRegion(ctrlObject,MX,MY))
                        inRegion = true;
                }
                else
                    inRegion = true;
                
                if (inRegion) {
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
        if (GMUI_NavigateNextControl(true)) {
            GMUI_GridNextControl(true);
        }
        else if (GMUI_NavigateNextControl(false)) {
            GMUI_GridNextControl(false);
        }
        else if (keyboard_check_pressed(vk_enter)) {
            GMUI_ResetControlStatus("Selected",id);
        }
    }
    
    // The grid offset has changed, all controls must update their position
    if (UIsnaptoview) {
        if (previousXOffset != view_xview[UIgridview] || previousYOffset != view_yview[UIgridview]) {
            GMUI_ResetControlStatus("Position",id);
            previousXOffset = view_xview[UIgridview];
            previousYOffset = view_yview[UIgridview];
        }
    }
    
    
    // Transitioning entire grid
    
    
    
    // Check if the room size has changed to move any anchored controls positions
    // each control needs a relative position...
    

}


#define GMUI_GridDrawGroups
///GMUI_GridDrawGroups(GMUI instance)
///Draws the groups if set to do so

var _GMUII, layer, l, g, gx, gy, gw, gh, xoffset, yoffset, spr_width, spr_height;
_GMUII = argument0;

if ((_GMUII).UIsnaptoview) {
    xoffset = view_xview[(_GMUII).UIgridview];
    yoffset = view_yview[(_GMUII).UIgridview];
}

for(l=0;l<ds_list_size((_GMUII).GMUI_gridlist);l+=1) {

    layer = ds_list_find_value((_GMUII).GMUI_gridlist,l);
    
    if (layer >= 0) {
        // Draw grids for this layer
        for (g=0;g<ds_list_size((_GMUII).GMUI_groupList[layer]);g+=1) {
            // Draw the selected group if set from the form
            if ((_GMUII).GMUI_groupGraphicMapIsUsed[layer,g]) {
                // group dimensions
                gx = GMUI_groupActualX[layer,g] + (GMUII()).GMUI_grid_x[layer] + xoffset;
                gy = GMUI_groupActualY[layer,g] + (GMUII()).GMUI_grid_y[layer] + yoffset;
                gw = GMUI_groupCellsW[layer,g]*cellsize + (_GMUII).GMUI_grid_x[layer,g] + xoffset;
                gh = GMUI_groupCellsH[layer,g]*cellsize_h + (_GMUII).GMUI_grid_y[layer,g] + yoffset;
                
                spr_width = sprite_get_width((_GMUII).GMUI_groupGraphicTopLeft);
                spr_height = sprite_get_height((_GMUII).GMUI_groupGraphicTopLeft);
                    
                // top left
                draw_sprite((_GMUII).GMUI_groupGraphicTopLeft[layer,g],-1,gx,gy);
                
                // top
                draw_sprite_stretched((_GMUII).GMUI_groupGraphicTop[layer,g],-1,gx+spr_width,gy,gw-spr_width,spr_height);
                
                // top right
                draw_sprite((_GMUII).GMUI_groupGraphicTopRight[layer,g],-1,gx+gw-spr_width,gy);
                
                // right
                draw_sprite_stretched((_GMUII).GMUI_groupGraphicRight[layer,g],-1,gx+gw-spr_width,gy+spr_height,spr_width,gh-spr_height);
                
                // bottom right
                draw_sprite((_GMUII).GMUI_groupGraphicBottomRight[layer,g],-1,gx+gw-spr_width,gy+gh-spr_height);
                
                // bottom
                draw_sprite_stretched((_GMUII).GMUI_groupGraphicBottom[layer,g],-1,gx+spr_width,gy+gh-spr_height,gw-spr_width,spr_height);
                
                // bottom left
                draw_sprite((_GMUII).GMUI_groupGraphicBottomLeft[layer,g],-1,gx,gy+gh-spr_height);
                
                // left
                draw_sprite_stretched((_GMUII).GMUI_groupGraphicLeft[layer,g],-1,gx,gy+spr_height,spr_width,gh-spr_height);
            
                // center (either partial or stretched to fit)
                if ((_GMUII).GMUI_groupGraphicCenterIsFixed[layer,g]) {
                    draw_sprite_part((_GMUII).GMUI_groupGraphicCenter[layer,g],-1,0,0,gw-spr_width*2,gh-spr_height*2,gx+spr_width,gy+spr_height);
                }
                else {
                    draw_sprite_stretched((_GMUII).GMUI_groupGraphicCenter[layer,g],-1,gx+spr_width,gy+spr_height,gw-spr_width*2,gh-spr_height*2);
                }
            }            
        }
    
    }
}

#define GMUI_GridGetCellX
///GMUI_GridGetCellX(GMUI instance, Layer, X)  Returns the horizontal cell block that the mouse is on
// argument0 is the GMUI instance
// argument1 is the layer
// argument2 is the X coordinate

var _GMUII,_offset;
_GMUII = argument0;
_offset = 0;

if ((_GMUII).UIsnaptoview) {
    _offset = view_xview[(_GMUII).UIgridview];
}

return GMUI_GridGetCellXOffset(_GMUII,argument1,argument2,_offset);
//return ceil((argument2-(_GMUII).GMUI_grid_x[_LayerNumber]-_offset+1)/(_GMUII).cellsize)-1;



#define GMUI_GridGetCellXOffset
///GMUI_GridGetCellXOffset(GMUI instance, Layer, X, Offset X)  Returns the horizontal cell block of coordinate
// argument0 is the GMUI instance
// argument1 is the layer
// argument2 is the X coordinate
// argument3 is the X offset

var _GMUII, _LayerNumber, _offset;
_GMUII = argument0;
_LayerNumber = argument1;
_offset = argument3;

return ceil((argument2-(_GMUII).GMUI_grid_x[_LayerNumber]-_offset+1)/(_GMUII).cellsize)-1;



#define GMUI_GridGetCellXRoom
///GMUI_GridGetCellXRoom(GMUI instance, Layer, X)  Returns the horizontal cell block by room coordinates
// argument0 is the GMUI instance
// argument1 is the layer
// argument2 is the X coordinate

var _GMUII;
_GMUII = argument0;

return GMUI_GridGetCellXOffset(_GMUII,argument1,argument2,0);



#define GMUI_GridGetCellY
///GMUI_GridGetCellY(GMUI instance, Layer, Y)  Returns the vertical cell block by coordinate
// argument0 is the GMUI instance
// argument1 is the layer
// argument2 is the Y coordinate

var _GMUII,_offset;
_GMUII = argument0;
_offset = 0;

if ((_GMUII).UIsnaptoview) {
    _offset = view_yview[(_GMUII).UIgridview];
}

return GMUI_GridGetCellYOffset(_GMUII,argument1,argument2,_offset);
//return ceil((argument2-(_GMUII).GMUI_grid_y[_LayerNumber]-_offset+1)/(_GMUII).cellsize_h)-1;



#define GMUI_GridGetCellYOffset
///GMUI_GridGetCellYOffset(GMUI instance, Layer, Y, Offset Y)  Returns the vertical cell block of coordinate
// argument0 is the GMUI instance
// argument1 is the layer
// argument2 is the Y coordinate
// argument3 is the Y offset

var _GMUII, _LayerNumber, _offset;
_GMUII = argument0;
_LayerNumber = argument1;
_offset = argument3;

return ceil((argument2-(_GMUII).GMUI_grid_y[_LayerNumber]-_offset+1)/(_GMUII).cellsize_h)-1;



#define GMUI_GridGetCellYRoom
///GMUI_GridGetCellYRoom(GMUI instance, Layer, Y)  Returns the vertical cell block by room coordinates
// argument0 is the GMUI instance
// argument1 is the layer
// argument2 is the Y coordinate

var _GMUII;
_GMUII = argument0;

return GMUI_GridGetCellYOffset(_GMUII,argument1,argument2,0);



#define GMUI_GridGetMouseCellX
///GMUI_GridGetMouseCellX(GMUI instance)  Returns the horizontal cell block that the mouse is on
// argument0 is the GMUI instance

var _GMUII, _offset;
_GMUII = argument0;
_offset = 0;

if ((_GMUII).UIsnaptoview) {
    _offset = view_xview[(_GMUII).UIgridview];
}


return ceil((mouse_x-(_GMUII).GMUI_grid_x[(_GMUII).UILayer]-_offset+1)/(_GMUII).cellsize)-1;



#define GMUI_GridGetMouseCellY
///GMUI_GridGetMouseCellY(GMUI instance)  Returns the vertical cell block that the mouse is on
// argument0 is the GMUI instance

var _GMUII, _offset;
_GMUII = argument0;
_offset = 0;

if ((_GMUII).UIsnaptoview) {
    _offset = view_yview[(_GMUII).UIgridview];
}

return ceil((mouse_y-(GMUII()).GMUI_grid_y[(GMUII()).UILayer]-_offset+1)/(GMUII()).cellsize_h)-1;



#define GMUI_GridGetHeight
///GMUI_GridGetHeight(GMUI, Layer)
///Returns the width of the grid of the given instance and layer

return ds_grid_height((argument0).GMUI_grid[argument1]);

#define GMUI_GridGetWidth
///GMUI_GridGetWidth(GMUI, Layer)
///Returns the width of the grid of the given instance and layer

return ds_grid_width((argument0).GMUI_grid[argument1]);

#define GMUI_GridNextControl
///GMUI_GridNextControl(next control /or previous: false)
///Changes the selected control to the next control in the list by ID

// Select the first control if none are selected, otherwise pull the next ID
var ctrlIndex,ctrl,i;
if ((GMUII()).SelectedControl != -1) {
    ctrlIndex = ds_list_find_index((GMUII()).GMUI_controlList,(GMUII()).SelectedControl);
    if (ctrlIndex < 0)
        ctrlIndex = 0;
}
else
    ctrlIndex = 0;

GMUI_ResetControlStatus("Selected",GMUII());
if (argument0) {
    if (ctrlIndex == ds_list_size((GMUII()).GMUI_controlList)) {
        ctrlIndex = 0;
    }
    else {
        ctrlIndex += 1;
    }
}
else {
    if (ctrlIndex == 0)
        ctrlIndex = ds_list_size((GMUII()).GMUI_controlList);
    else
        ctrlIndex -= 1;
}

i=0;
while (i < ds_list_size((GMUII()).GMUI_controlList)) {
    ctrl = ds_list_find_value((GMUII()).GMUI_controlList,ctrlIndex);
    if (ctrl > 0 && instance_exists(ctrl)) {
        if ((!ctrl.Disabled) && (!ctrl.NonClickable) && (!ctrl.Hidden)) {
            GMUI_GridSelect(ctrl);
            return true;
        }
    }
    if (argument0) {
        ctrlIndex += 1;
        if (ctrlIndex > ds_list_size((GMUII()).GMUI_controlList)) {
            ctrlIndex = -1;
        }
    }
    else {
        ctrlIndex -= 1;
        if (ctrlIndex < 0) {
            ctrlIndex = ds_list_size((GMUII()).GMUI_controlList);
        }
    }
    i += 1;
}


return false;

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
        if ((ctrl).ControlInteraction) {
            // Map the control to the grid[layer#] - Warning: This will overwrite any existing instance values (overlapping)
            _CX2 = (ctrl).CellX+(ctrl).CellWide-1+ceil((ctrl).RelativeX / (GMUII()).cellsize);
            _CY2 = (ctrl).CellY+(ctrl).CellHigh-1+ceil((ctrl).RelativeY / (GMUII()).cellsize_h);
            ds_grid_set_region(_Grid,(ctrl).CellX,(ctrl).CellY,_CX2,_CY2,ctrl);
        }
        
        // Update control draw location in the room
        GMUI_ControlUpdateXY(ctrl);
    }
    
}

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

#define GMUI_GroupSetPositionAnchored
///GMUI_GroupSetPositionAnchored(Layer Number, Group Number, Cell X, Cell Y, X Adjustment, Y Adjustment, Anchor)
///Change the position of the group (and all of the controls inside it) according to its anchor

// Arguments
var _SCRIPT, _LayerNumber,_GroupNumber,_CellX,_CellY,_AdjustmentX,_AdjustmentY, ctrl;
_SCRIPT = "GMUI_GroupSetPositionAnchored";
_LayerNumber = argument0;
_GroupNumber = argument1;
_CellX = argument2;
_CellY = argument3;
_AdjustmentX = argument4;
_AdjustmentY = argument5;
_Anchor = argument6;


// Validate
if (!is_real(_GroupNumber) || !is_real(_LayerNumber) || !is_real(_CellX) || !is_real(_CellY) || _GroupNumber <= 0) {
    GMUI_ThrowErrorDetailed("Invalid parameters",_SCRIPT);
    return false;
}

if (!GMUI_LayerExists(_LayerNumber)) {
    GMUI_ThrowErrorDetailed("Layer " + string(_LayerNumber) + " doesn't exist", _SCRIPT);
    return false;
}

if (!GMUI_GroupExists(_LayerNumber,_GroupNumber)) {
    GMUI_ThrowErrorDetailed("Group " + string(_GroupNumber) + " doesn't exist on layer " + string(_LayerNumber), _SCRIPT);
    return false;
}

// Max adjustment values
_AdjustmentX = min(_AdjustmentX, (GMUII()).cellsize - 1);
_AdjustmentY = min(_AdjustmentY, (GMUII()).cellsize_h - 1);

// Change group position
(GMUII()).GMUI_groupCellX[_LayerNumber,_GroupNumber] = GMUI_GetAnchoredCellX(GMUI_GridGetWidth(GMUII(),_LayerNumber),_CellX,_Anchor);
(GMUII()).GMUI_groupCellY[_LayerNumber,_GroupNumber] = GMUI_GetAnchoredCellY(GMUI_GridGetHeight(GMUII(),_LayerNumber),_CellY,_Anchor);
(GMUII()).GMUI_groupRelativeX[_LayerNumber,_GroupNumber] = _AdjustmentX;
(GMUII()).GMUI_groupRelativeY[_LayerNumber,_GroupNumber] = _AdjustmentY;
(GMUII()).GMUI_groupActualX[_LayerNumber,_GroupNumber] = GMUI_CellGetActualX((GMUII()).GMUI_groupCellX[_LayerNumber,_GroupNumber]) + _AdjustmentX;
(GMUII()).GMUI_groupActualY[_LayerNumber,_GroupNumber] = GMUI_CellGetActualY((GMUII()).GMUI_groupCellY[_LayerNumber,_GroupNumber]) + _AdjustmentY;


// Re-position all controls within the group
var i;
for(i=0;i<ds_list_size((GMUII()).GMUI_groupControlList[_LayerNumber,_GroupNumber]);i+=1) {
    // Get the control id
    ctrl = ds_list_find_value((GMUII()).GMUI_groupControlList[_LayerNumber,_GroupNumber],i);
    
    if (!instance_exists(ctrl))
    {
        GMUI_ThrowErrorDetailed("Control no longer exists (" + _LayerNumber + "," + _GroupNumber + ")", _SCRIPT);
    }
    else {
        var groupWidth,groupHeight;
        groupWidth = (GMUII()).GMUI_groupCellsW[_LayerNumber,_GroupNumber];
        groupHeight = (GMUII()).GMUI_groupCellsH[_LayerNumber,_GroupNumber];
        
        // Reset positioning based on group's position
        (ctrl).CellX = GMUI_GetAnchoredCellX(groupWidth,(ctrl).RelativeCellX,(ctrl).Anchor)
            + (GMUII()).GMUI_groupCellX[_LayerNumber,_GroupNumber];
        (ctrl).CellY = GMUI_GetAnchoredCellY(groupHeight,(ctrl).RelativeCellY,(ctrl).Anchor)
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

var _Control, _MX, _MY, _CW, _CH, _xoffset, _yoffset;
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
    
// Adjustments if using views
_xoffset = 0;
_yoffset = 0;

if (((_Control).GMUIP).UIsnaptoview) {
    _xoffset = view_xview[((_Control).GMUIP).UIgridview];
    _yoffset = view_yview[((_Control).GMUIP).UIgridview];
}

// Adjustment if grid is offset
_xoffset += ((_Control).GMUIP).GMUI_grid_x[(_Control).Layer];
_yoffset += ((_Control).GMUIP).GMUI_grid_y[(_Control).Layer];

    
// Check if coordinates are inside the adjusted control based on what adjustments are set
if ((_MX >= (_Control).ActualX + (_Control).RelativeX + _xoffset && _MX <= (_Control).ActualX + (_Control).RelativeX + _xoffset + _CW) &&
    (_MY >= (_Control).ActualY + (_Control).RelativeY + _yoffset && _MY <= (_Control).ActualY + (_Control).RelativeY + _yoffset + _CH)
    )
    return true;
else
    return false;

#define GMUI_MouseInSpecialRegion
///GMUI_MouseInAdjustedSpecialRegion(Control Object, mouse x, mouse y)
/// Returns direction if mouse is in the adjusted region of the control

var _Control, _MX, _MY, _D, _CW, _CH, sizingW, sizingH, _xoffset, _yoffset;
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

// Adjustments if using views
_xoffset = 0;
_yoffset = 0;

if (((_Control).GMUIP).UIsnaptoview) {
    _xoffset = view_xview[((_Control).GMUIP).UIgridview];
    _yoffset = view_yview[((_Control).GMUIP).UIgridview];
}

// Adjustment if grid is offset
_xoffset += ((_Control).GMUIP).GMUI_grid_x[(_Control).Layer];
_yoffset += ((_Control).GMUIP).GMUI_grid_y[(_Control).Layer];
    

// Check if coordinates are inside the adjusted control based on what adjustments are set
if (_D == global.GMUIDirectionTypeHorizontal)
{
    if ((_MX >= (_Control).ActualX + (_Control).RelativeX + _xoffset) && 
        (_MX <= (_Control).ActualX + (_Control).RelativeX + sizingW + _xoffset))
        return global.GMUIHoveringDirection_Left;
    else if ((_MX >= (_Control).ActualX + (_Control).RelativeX + _CW - sizingW + _xoffset) && 
        (_MX <= (_Control).ActualX + (_Control).RelativeX + _CW + _xoffset))
        return global.GMUIHoveringDirection_Right;
}
else if (_D == global.GMUIDirectionTypeSideVertical)
{
    if ((_MY >= (_Control).ActualY + (_Control).RelativeY + _yoffset) && 
        (_MY <= (_Control).ActualY + (_Control).RelativeY + sizingH + _yoffset) &&
        (_MX >= (_Control).ActualX + (_Control).RelativeX + _CW - sizingW + _xoffset))
        return global.GMUIHoveringDirection_Up;
    else if ((_MY >= (_Control).ActualY + (_Control).RelativeY + _CH - sizingH + _yoffset) &&
        (_MY <= (_Control).ActualY + (_Control).RelativeY + _CH + _yoffset) &&
        (_MX >= (_Control).ActualX + (_Control).RelativeX + _CW - sizingW + _xoffset))
    return global.GMUIHoveringDirection_Down;
}

// No Conditions were met
return global.GMUIHoveringDirection_None;



#define GMUI_NavigateNextControl
///GMUI_NavigateNextControl(check for next control [true] or previous [false])
///Check for the keys to change control selection

if (keyboard_check_pressed(vk_anykey)) {
    // Next control
    if (argument0 >= 1) {
        if (GMUI_enableTab) {
            if (keyboard_check_pressed(vk_tab))
                return true;
        }
        
        if (GMUI_forwardKey != -1) {
            if (keyboard_check_pressed(GMUI_forwardKey))
                return true;
            if (GMUI_forwardAltKey != -1) {
                if (keyboard_check_pressed(GMUI_forwardAltKey))
                    return true;
            }
        }
    }
    else {
    // Previous control
        if (GMUI_backKey != -1) {
            if (keyboard_check_pressed(GMUI_backKey))
                return true;
            if (GMUI_backAltKey != -1) {
                if (keyboard_check_pressed(GMUI_backAltKey))
                    return true;
            }
        }
    }
}

return false;

#define GMUI_ResetControlStatus
///GMUI_ResetControlStatus("Hovering" / "Selected" / "Position", GridID)
/// Resets the hovering or selected values of the controls

var _SCRIPT,_GridID,a0,ff,ffo,m,ms; a0 = string(argument0);
_SCRIPT = "GMUI_ResetControlStatus";
_GID = argument1;

if (string_lower(a0) == "selected" || a0 == "1") {
    (_GID).SelectedControl = -1;
    ff = ds_map_find_first((_GID).GMUI_map);
    if (string(ff) == "0")
        GMUI_ThrowErrorDetailed("No controls exist",_SCRIPT);
    else {
        // Set all controls' selected variable to false and find previous selection if there is one
        PreviousSelectedControl = -1;
        
        ms = ds_map_size((_GID).GMUI_map);
        for (m=0; m < ms; m+=1) {
            if (string(ff) != "0" && GMUI_StudioCheckDefined(ff)) {
                ffo = ds_map_find_value((_GID).GMUI_map,ff);
                if (GMUI_StudioCheckDefined(ffo)) {
                    if ((ffo).Selected)
                        PreviousSelectedControl = ffo;
                    (ffo).Selected = 0;
                    (ffo).DoubleSelected = 0;
                }
            }
            
            ff = ds_map_find_next((_GID).GMUI_map,ff);
        }
    }
}
else if (string_lower(a0) == "hovering" || a0 == "0") {
    (_GID).HoveringControl = -1;
    ff = ds_map_find_first((_GID).GMUI_map);
    if (string(ff) == "0")
        GMUI_ThrowErrorDetailed("No controls exist",_SCRIPT);
    else {
        // Set all controls' hover variable to false
        ms = ds_map_size((_GID).GMUI_map);
        for (m=0; m < ms; m+=1) {
            if (string(ff) != "0" && GMUI_StudioCheckDefined(ff)) {
                ffo = ds_map_find_value((_GID).GMUI_map,ff);
                if (GMUI_StudioCheckDefined(ffo)) {
                    (ffo).Hovering = 0;
                    (ffo).HoveringDirection = 0;
                }
            }
            
            ff = ds_map_find_next((_GID).GMUI_map,ff);
        }
    }
}
else if (string_lower(a0) == "position" || a0 == "2") {
    ff = ds_map_find_first((_GID).GMUI_map);
    if (string(ff) == "0")
        GMUI_ThrowErrorDetailed("No controls exist",_SCRIPT);
    else {
        // Set all controls' hover variable to false
        ms = ds_map_size((_GID).GMUI_map);
        for (m=0; m < ms; m+=1) {
            if (string(ff) != "0" && GMUI_StudioCheckDefined(ff)) {
                ffo = ds_map_find_value((_GID).GMUI_map,ff);
                if (GMUI_StudioCheckDefined(ffo)) {
                    (ffo).NeedsPositionUpdate = true;
                }
            }
            
            ff = ds_map_find_next((_GID).GMUI_map,ff);
        }
    }
}
else {
    GMUI_ThrowErrorDetailed("Incorrect parameter given",_SCRIPT);
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

