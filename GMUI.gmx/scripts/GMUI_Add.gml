/// Adds a component(instance) to the GMUI grid 
// GMUI_Add("Name", "Type String", cell# x, cell# y, cells wide (min 1), cells high (min 1), 
//                  Layer**, Anchor***)

var _Layer,_Anchor,_CellX,_CellY;
_Layer = argument6;
_Anchor = argument7;
_CellX = argument2;
_CellY = argument3;

// Check that the layer exists first
if (!GMUI_LayerExists(_Layer)) {
    GMUI_ThrowError("The layer does not exist. GMUI_Add('" + string(argument0) + "',...");
    return -1;
}


// Check grid positioning first and assign after created
var gridW, gridH;
// Get the dimensions and round down for grids that have even grid sizes
gridW = ds_grid_width((GMUII()).GMUI_grid[_Layer]);
gridH = ds_grid_height((GMUII()).GMUI_grid[_Layer]);

if (!GMUI_ValidCellBounds(_Anchor,_CellX,_CellY,gridW,gridH)) {
    GMUI_ThrowError("Cell values out of bounds. GMUI_Add('" + string(argument0) + "'," + string(argument1) + "," + string(_CellX) + "...");
    return -1;
}


// Check that it hasn't already been created
if (ds_map_exists((GMUII()).GMUI_map,argument0)) {
    GMUI_ThrowError("The control name has already been defined. GMUI_Add('" + string(argument0) + "',...");
    return -1;
}


// Check for type and either reference provided instance or create a new one. MUST BE A VALID TYPE
var thetype,thecontrol,isinput,isbutton;isinput=0;isbutton=0;
if (is_string(argument1)) {
    thetype = string_lower(string_replace(argument1," ",""));
    switch (thetype) {
        case "textint":
        case "textdecimal":
        case "textstring":
        case "intpicker":
        case "doublepicker":
            isinput = 1; // Input fields = 1;
            break;
        case "button":
        case "textbutton":
            isbutton=1;
        case "slider":
        case "dropdown":
            // valid
        break;
        default:
            // invalid
            thetype = "invalid";
        break;
    }
    
    thecontrol = instance_create(0,0,(GMUII()).GMUI_controlobject); // Default is: GMUI_control
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
thecontrol.valueName = argument0;
thecontrol.ControlType = thetype;
thecontrol.ControlInput = isinput;
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



// Set the default style properties (set from the gmui controller)
GMUI_ControlSetDefaultStyle(thecontrol);

// Set the default font style properties (set from the gmui controller)
GMUI_ControlSetDefaultFontStyle(thecontrol);

// Set the default attribute properies (set from the gmui controller)
GMUI_ControlSetDefaultAttributes(thecontrol);

// Set the default picker properties (set from the gmui controller)
GMUI_ControlSetDefaultPicker(thecontrol);

// Set the default button properties (set from the gmui controller)
GMUI_ControlSetDefaultButton(thecontrol);

// Override defaults for specific controls (Avoid defaults conflicts)
if (isbutton) {
    thecontrol.ControlFontAlign = fa_center;
    thecontrol.ControlShowCursor = false;
}


return thecontrol;



