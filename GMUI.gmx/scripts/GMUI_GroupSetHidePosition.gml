///GMUI_GroupSetHidePosition(Layer Number, Group Number, Cell X, Cell Y, Transition_script [or -1], speed in steps)
// Set a group position to transition from and to when showing or hiding group

//todo: get master control and set coordinates to it
var _GMUI, _LayerNumber, _GroupNumber, _MasterControl;
_GMUI = GMUII();
_LayerNumber = argument0;
_GroupNumber = argument1;

if ((_GMUI).GMUI_groupMasterControl[_LayerNumber,_GroupNumber] == -1) {
    GMUI_ThrowErrorDetailed("No controls to assign position", GMUI_GroupSetHidePosition);
    return false;
}
else {
    // convert from cell to actual, and call new script to call gmui group transition to cell actual
    _MasterControl = (_GMUI).GMUI_groupMasterControl[_LayerNumber,_GroupNumber];
    
    (_MasterControl).T_px_group = GMUI_groupActualX[_LayerNumber,_GroupNumber];
    (_MasterControl).T_py_group = GMUI_groupActualY[_LayerNumber,_GroupNumber];
    
    (_MasterControl).T_hx_group = GMUI_CellGetActualX(GMUI_GetAnchoredCellX(GMUI_GridGetWidth(GMUII(),_LayerNumber),argument2,(_GMUI).GMUI_groupAnchor[_LayerNumber,_GroupNumber]));
    (_MasterControl).T_hy_group = GMUI_CellGetActualY(GMUI_GetAnchoredCellY(GMUI_GridGetHeight(GMUII(),_LayerNumber),argument3,(_GMUI).GMUI_groupAnchor[_LayerNumber,_GroupNumber]));
    
    // If group is currently hidden, start at the hide position
    if ((_MasterControl).GroupHidden) {
        (_GMUI).GMUI_groupActualX[_LayerNumber,_GroupNumber] = (_MasterControl).T_hx_group;
        (_GMUI).GMUI_groupActualY[_LayerNumber,_GroupNumber] = (_MasterControl).T_hy_group;
        with (_MasterControl) {
            T_hrelx_group = T_hx_group - T_px_group;
            T_hrely_group = T_hy_group - T_py_group;
        }
        
        // Bump all controls to their own hidden positions
        for(i=0;i<ds_list_size((_GMUI).GMUI_groupControlList[_LayerNumber,_GroupNumber]);i+=1) {
        
            ctrl = ds_list_find_value((_GMUI).GMUI_groupControlList[_LayerNumber,_GroupNumber],i);
    
            if (instance_exists(ctrl))
            {
                (ctrl).ActualX += (_MasterControl).T_hrelx_group;
                (ctrl).ActualY += (_MasterControl).T_hrely_group;
            }
        }
        
    }
    
    (_MasterControl).T_hscript_group = argument4;
    (_MasterControl).T_hspeed_group = argument5;
    return true;
}

