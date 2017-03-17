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

