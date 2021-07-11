///GMUI_GridCheckLine(Direction, CellsLine, CellFrom, CellsOut[or -1 for end of grid])
///Returns the first object found in the line from cell to cell
function GMUI_GridCheckLine(argument0,argument1,argument2,argument3) {


var _ctrlObject, _GMUII, _startCell, _i, _endCell, _outCell, _horz;
_GMUII = GMUII();
_startCell = max(0,argument2);
_outCell = argument3;

switch (argument0) {

    case global.GMUIDirectionTypeHorizontal:
        
        _endCell = (_GMUII).GMUI_grid_w[(_GMUII).UILayer];
        _horz = true;
        
        break;
        
    case global.GMUIDirectionTypeSideVertical:
    case global.GMUIDirectionTypeVertical:
    
        _endCell = (_GMUII).GMUI_grid_h[(_GMUII).UILayer];
        _horz = false;
        
        break;
        
    default:
        return -1;
    
}

if (_outCell < 0)
    _outCell = max(_startCell,abs(_endCell - _startCell));
    
for (_i=0; _i <= _outCell; _i+= 1) {

    if (_startCell + _i <= _endCell) {
    
        if (_horz)
            _ctrlObject = ds_grid_get((_GMUII).GMUI_grid[(_GMUII).UILayer],_startCell + _i,argument1);
        else
            _ctrlObject = ds_grid_get((_GMUII).GMUI_grid[(_GMUII).UILayer],argument1, _startCell + _i);
    }
    
    if (is_real(_ctrlObject))
        if (_ctrlObject != 0)
            if (instance_exists(_ctrlObject))
                return _ctrlObject;
    
    if (_i != 0 && _startCell - _i >= 0) {
    
        if (_horz)
            _ctrlObject = ds_grid_get((_GMUII).GMUI_grid[(_GMUII).UILayer],_startCell - _i,argument1);
        else
            _ctrlObject = ds_grid_get((_GMUII).GMUI_grid[(_GMUII).UILayer],argument1, _startCell - _i);
    }
    
    if (is_real(_ctrlObject))
        if (_ctrlObject != 0)
            if (instance_exists(_ctrlObject))
                return _ctrlObject;

}

return -1;


}

