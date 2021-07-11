///GMUI_GridNextControl(next control /or previous: false, WrapAroundLayer[bool])
///Changes the selected control to the next control in the list by ID
function GMUI_GridNextControl(argument0,argument1) {

// Select the first control if none are selected, otherwise pull the next ID
var _GMUII,_ctrlIndex,_ctrl,_i,_forward,_CellFrom,_CellTo;
_GMUII = GMUII();
_ctrl = -1;
_ctrlIndex = -1;
_forward = argument0;
_CellFrom = -1;
    

if ((_GMUII).GMUI_navigateDirection != global.GMUIDirectionTypeNone) {
    
    if ((_GMUII).GMUI_navigateDirection == global.GMUIDirectionTypeHorizontal) {
        
        _CellTo = (_GMUII).GMUI_grid_w[(_GMUII).UILayer];
        _CellFrom = min(((_GMUII).SelectedControl).CellX+1,_CellTo);
    }
    else if ((_GMUII).GMUI_navigateDirection == global.GMUIDirectionTypeVertical) {
        
        _CellTo = (_GMUII).GMUI_grid_h[(_GMUII).UILayer];
        _CellFrom = min(((_GMUII).SelectedControl).CellY+1,_CellTo);
    }

    if (_CellFrom > -1) {
        
        if (_forward)
            _ctrl = GMUI_GridCheckForControls((_GMUII).GMUI_navigateDirection,true,_CellFrom,_CellTo,(_GMUII).SelectedControl);
        else
            _ctrl = GMUI_GridCheckForControls((_GMUII).GMUI_navigateDirection,false,_CellFrom,0,(_GMUII).SelectedControl);
        
        if (_ctrl == -1 && argument1) {
        
            if (_forward)
                _ctrl = GMUI_GridCheckForControls((_GMUII).GMUI_navigateDirection,true,0,max(0,_CellFrom-1),(_GMUII).SelectedControl);
            else
                _ctrl = GMUI_GridCheckForControls((_GMUII).GMUI_navigateDirection,false,_CellTo,max(0,_CellFrom-1),(_GMUII).SelectedControl);
        }
    }
    else {
        // Both directions - Switch between horizontal and vertical
        var _CellMin,_CellMax,_Ignore; 
        
        if (_forward) {
        
            _CellMin = min(min(((_GMUII).SelectedControl).CellX+1,(_GMUII).GMUI_grid_w[(_GMUII).UILayer]),min(((_GMUII).SelectedControl).CellY+1,(_GMUII).GMUI_grid_h[(_GMUII).UILayer]));
            _CellMax = max((_GMUII).GMUI_grid_w[(_GMUII).UILayer],(_GMUII).GMUI_grid_h[(_GMUII).UILayer]);
        
            for (_i=_CellMin; _i<=_CellMax; _i+=1;) {
            
                _CellTo = (_GMUII).GMUI_grid_w[(_GMUII).UILayer];
            
                if (_i <= _CellTo && _i >= min(((_GMUII).SelectedControl).CellX+1,_CellTo))                
                    _ctrl = GMUI_GridCheckForControls(global.GMUIDirectionTypeHorizontal,true,_i,_i,-1);
                
                if (_ctrl > -1)
                    break;
                
                _CellTo = (_GMUII).GMUI_grid_h[(_GMUII).UILayer];
                    
                if (_i <= _CellTo && _i >= min(((_GMUII).SelectedControl).CellY+1,_CellTo))
                    _ctrl = GMUI_GridCheckForControls(global.GMUIDirectionTypeVertical,true,_i,_i,-1);
                
                if (_ctrl > -1)
                    break;
            }
            
            if (_ctrl == -1 && argument1) {
            
                _CellMax = max(min(((_GMUII).SelectedControl).CellX+1,(_GMUII).GMUI_grid_w[(_GMUII).UILayer]),min(((_GMUII).SelectedControl).CellY+1,(_GMUII).GMUI_grid_h[(_GMUII).UILayer]));
                
                for (_i=0; _i<=_CellMax; _i+=1;) {
                
                    _CellTo = min(((_GMUII).SelectedControl).CellX+1,(_GMUII).GMUI_grid_w[(_GMUII).UILayer]);
                
                    if (_i <= _CellTo)                
                        _ctrl = GMUI_GridCheckForControls(global.GMUIDirectionTypeHorizontal,true,_i,_i,-1);
                    
                    if (_ctrl > -1)
                        break;
                    
                    _CellTo = min(((_GMUII).SelectedControl).CellY+1,(_GMUII).GMUI_grid_h[(_GMUII).UILayer]);
                        
                    if (_i <= _CellTo)
                        _ctrl = GMUI_GridCheckForControls(global.GMUIDirectionTypeVertical,true,_i,_i,-1);
                    
                    if (_ctrl > -1)
                        break;
                }
            }
        }
        else {
        
            _CellMax = max(min(((_GMUII).SelectedControl).CellX+1,(_GMUII).GMUI_grid_w[(_GMUII).UILayer]),min(((_GMUII).SelectedControl).CellY+1,(_GMUII).GMUI_grid_h[(_GMUII).UILayer]));
            //_CellMax = max((_GMUII).GMUI_grid_w[(_GMUII).UILayer],(_GMUII).GMUI_grid_h[(_GMUII).UILayer]);
        
            for (_i=_CellMax; _i>= 0; _i-=1;) {
            
                _CellTo = min(((_GMUII).SelectedControl).CellX+1,(_GMUII).GMUI_grid_w[(_GMUII).UILayer]);
            
                if (_i <= _CellTo && _i >= 0)              
                    _ctrl = GMUI_GridCheckForControls(global.GMUIDirectionTypeHorizontal,true,_i,_i,-1);
                
                if (_ctrl > -1)
                    break;
                
                _CellTo = min(((_GMUII).SelectedControl).CellY+1,(_GMUII).GMUI_grid_h[(_GMUII).UILayer]);
                    
                if (_i <= _CellTo && _i >= 0)
                    _ctrl = GMUI_GridCheckForControls(global.GMUIDirectionTypeVertical,true,_i,_i,-1);
                
                if (_ctrl > -1)
                    break;
            }
            
            if (_ctrl == -1 && argument1) {
            
                _CellMin = min(min(((_GMUII).SelectedControl).CellX+1,(_GMUII).GMUI_grid_w[(_GMUII).UILayer]),min(((_GMUII).SelectedControl).CellY+1,(_GMUII).GMUI_grid_h[(_GMUII).UILayer]));
                _CellMax = max((_GMUII).GMUI_grid_w[(_GMUII).UILayer],(_GMUII).GMUI_grid_h[(_GMUII).UILayer]);
                
                for (_i=_CellMax; _i>=_CellMin; _i-=1;) {
                
                    _CellTo = (_GMUII).GMUI_grid_w[(_GMUII).UILayer];
                
                    if (_i <= _CellTo && _i >= min(((_GMUII).SelectedControl).CellX+1,_CellTo))                
                        _ctrl = GMUI_GridCheckForControls(global.GMUIDirectionTypeHorizontal,true,_i,_i,-1);
                    
                    if (_ctrl > -1)
                        break;
                    
                    _CellTo = (_GMUII).GMUI_grid_h[(_GMUII).UILayer];
                        
                    if (_i <= _CellTo && _i >= min(((_GMUII).SelectedControl).CellY+1,_CellTo))
                        _ctrl = GMUI_GridCheckForControls(global.GMUIDirectionTypeVertical,true,_i,_i,-1);
                    
                    if (_ctrl > -1)
                        break;
                }
            }
        }
    }
    
    
    if (_ctrl > -1) {

        GMUI_ResetControlStatus("Selected",_GMUII);
        GMUI_GridSelect(_ctrl);
        return true;
    }

}
else {

    if ((_GMUII).SelectedControl != -1) {
        _ctrlIndex = ds_list_find_index((_GMUII).GMUI_controlList,(_GMUII).SelectedControl);
        if (_ctrlIndex < 0)
            _ctrlIndex = 0;
    }
    else
        _ctrlIndex = 0;
    
    GMUI_ResetControlStatus("Selected",_GMUII);
    
    if (argument0) {
        if (_ctrlIndex == ds_list_size((_GMUII).GMUI_controlList)) {
            _ctrlIndex = 0;
        }
        else {
            _ctrlIndex += 1;
        }
    }
    else {
        if (_ctrlIndex == 0)
            _ctrlIndex = ds_list_size((_GMUII).GMUI_controlList);
        else
            _ctrlIndex -= 1;
    }
    
    i=0;
    while (i < ds_list_size((_GMUII).GMUI_controlList)) {
        _ctrl = ds_list_find_value((_GMUII).GMUI_controlList,_ctrlIndex);
        if (_ctrl > 0 && instance_exists(_ctrl)) {
            if ((!_ctrl.Disabled) && (!_ctrl.NonClickable) && (!_ctrl.Hidden)) {
                GMUI_GridSelect(_ctrl);
                return true;
            }
        }
        if (argument0) {
            _ctrlIndex += 1;
            if (_ctrlIndex > ds_list_size((_GMUII).GMUI_controlList)) {
                _ctrlIndex = -1;
            }
        }
        else {
            _ctrlIndex -= 1;
            if (_ctrlIndex < 0) {
                _ctrlIndex = ds_list_size((_GMUII).GMUI_controlList);
            }
        }
        i += 1;
    }
    
}


return false;
}

