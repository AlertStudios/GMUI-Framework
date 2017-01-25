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

