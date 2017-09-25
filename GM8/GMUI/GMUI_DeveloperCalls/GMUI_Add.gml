#define GMUI_Add
///GMUI_Add("Name", "Type String", cell# x, cell# y, cells wide (min 1), cells high (min 1), Layer**, Anchor***)
///Adds a component(instance) to the GMUI grid

var SCRIPT,_Layer,_Anchor,_CellX,_CellY,_CellWide,_CellHigh;
SCRIPT = GMUI_Add;
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
thecontrol.CellWideMax = gridW-_CellX;//_CellWide;
thecontrol.CellHighMax = gridH-_CellY;//_CellHigh;
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

// Set the default group style properties, if set
GMUI_GroupSetDefaultStyle(thecontrol);

// Override defaults for specific controls (Avoid defaults conflicts):

// Button style override
if (GMUI_GetDataType(thetype) == global.GMUIDataTypeButton) {
    thecontrol.ControlFontAlign = fa_center;
    thecontrol.ControlShowCursor = false;
}

// String length settings
if (GMUI_GetDataType(thetype) == global.GMUIDataTypeString) {
    thecontrol.ControlMaxStringLength = 1024;
}


return thecontrol;




