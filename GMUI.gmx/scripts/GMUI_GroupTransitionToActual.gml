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


