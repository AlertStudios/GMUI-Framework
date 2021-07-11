///GMUI_GridCheckControls(Direction, CheckForward[bool], CellStart, CellEnd, CurrentSelectedControl[or -1])
///Look for the next available control with the given direction
function GMUI_GridCheckControls(argument0,argument1,argument2,argument3,argument4) {

var _Dir,_CellFrom,_CellTo,_SelectedControl,_i,_ctrl,_ccell,_fcell;
_Dir = argument0;
_Forward = argument1;
_CellFrom = argument2;
_CellTo = argument3;
_SelectedControl = argument4;
_ctrl = -1;
_ccell = -1;
_fcell = -1;

if (_Dir == global.GMUIDirectionTypeHorizontal) {
    
    if (_Forward) {
    
        if (_SelectedControl > -1) {
        
            _ccell = (_SelectedControl).CellX;
            _fcell = (_SelectedControl).CellY;
        }
        
    
        for (_i=_CellFrom; _i<=_CellTo; _i+=1;) {
        
            _ctrl = GMUI_GridCheckLine(global.GMUIDirectionTypeVertical,_i,_fcell,-1);

            if (_ctrl > -1) {
        
                if (GMUI_GridCheckSelectable(_ctrl,global.GMUIDirectionTypeHorizontal,_ccell,-1))
                    break;
                else
                    _ctrl = -1;
            }
        }
    }
    else {
    
        if (_SelectedControl > -1) {
        
            _ccell = (_SelectedControl).CellX;
            _fcell = (_SelectedControl).CellY;
        }
    
        for (_i=_CellFrom; _i>=_CellTo; _i-=1;) {
    
            _ctrl = GMUI_GridCheckLine(global.GMUIDirectionTypeVertical,_i,_fcell,-1);
        
            if (_ctrl > -1) {
                    
                if (GMUI_GridCheckSelectable(_ctrl,global.GMUIDirectionTypeHorizontal,_ccell,-1))
                    break;
                else
                    _ctrl = -1;
            }
        }
    }
}
else if (_Dir == global.GMUIDirectionTypeVertical) {

    if (_Forward) {
    
        if (_SelectedControl > -1) {
        
            _ccell = (_SelectedControl).CellY;
            _fcell = (_SelectedControl).CellX;
        }
    
        for (_i=_CellFrom; _i<=_CellTo; _i+=1;) {
        
            _ctrl = GMUI_GridCheckLine(global.GMUIDirectionTypeHorizontal,_i,_fcell,-1);
            
            if (_ctrl > -1) {
            
                if (_SelectedControl > -1)
                    _ccell = (_SelectedControl).CellY;
                    
                if (GMUI_GridCheckSelectable(_ctrl,global.GMUIDirectionTypeVertical,_ccell,-1))
                    break;
                else
                    _ctrl = -1;
            }
        }
    }
    else {
    
        if (_SelectedControl > -1) {
        
            _ccell = (_SelectedControl).CellY;
            _fcell = (_SelectedControl).CellX;
        }
    
        for (_i=_CellFrom; _i>=_CellTo; _i-=1;) {
        
            _ctrl = GMUI_GridCheckLine(global.GMUIDirectionTypeHorizontal,_i,_fcell,-1);
            
            if (_ctrl > -1) {
            
                if (_SelectedControl > -1)
                    _ccell = (_SelectedControl).CellY;
            
                if (GMUI_GridCheckSelectable(_ctrl,global.GMUIDirectionTypeVertical,_ccell,-1))
                    break;
                else
                    _ctrl = -1;
            }
        }
    }
}
else {
//currently unused
}
//show_message('final for DIR' +string(_Dir) +' line ' + string(_CellFrom) + ': ' + string(_ctrl));
return _ctrl;


}

