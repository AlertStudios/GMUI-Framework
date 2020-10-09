///GMUI_GroupSetScrollbar(GMUI instance, Layer Number, Group Number, scrollbar control ID [or -1])
///Adds the control handling the scrollbar to the list if it doesnt exist

var _GMUI, _LayerNumber, _GroupNumber, _SBC, _dc;
_GMUI = argument0;
_LayerNumber = argument1;
_GroupNumber = argument2;
_SBC = argument3;

_dc = _GMUI.GMUI_groupDrawingControl[_LayerNumber,_GroupNumber];
if (_dc > -1) {
    if (_SBC < 0) {
        _SBC = _dc.GroupScrollbarHandler;
        if (_SBC == -1) {
            _SBC = GMUI_AddToLayer(_LayerNumber,"_GroupScrollbar_" + string(_LayerNumber) + "_" + string(_GroupNumber),
                "scrollbarhandler",0,0,1,1,global.GMUIAnchorDefault);
                
            ds_list_add(_GMUI.GMUI_groupScrollbars, _SBC);
        }
        
        ds_list_add(_GMUI.GMUI_groupControlList[_LayerNumber,_GroupNumber],_SBC);
        _SBC.Group = _GroupNumber;
        
        with (_SBC) {
            GMUI_ControlSetScrollbarDefaults(false); // false = set as group
        }
        
        _dc.GroupScrollbarHandler = _SBC;
        _SBC.GroupHasScrollbar = true;
        
        
    }
    else if (instance_exists(_SBC)) {
        if (instance_exists(_dc.GroupScrollbarHandler))
            (_dc.GroupScrollbarHandler).GroupHasScrollbar = false;
            
        _dc.GroupScrollbarHandler = _SBC;
        _SBC.GroupHasScrollbar = true;
    }
    else {
        GMUI_ThrowErrorDetailed("Could not define scrollbar handler", GMUI_GroupSetScrollbar);
        return false;
    }
    
    
    // Calculates the scrollbar position: X + W - scrollbar W - gridX - offset
    return GMUI_GroupSetScrollbarX(_GMUI,_LayerNumber,_GroupNumber);
}
