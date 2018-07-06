#define GMUI_GroupMouseOnScrollbar
///GMUI_GroupMouseOnScrollbar(GMUI instance, Mouse X position)
///Adds the control handling the scrollbar to the list if it doesnt exist

var _GMUI, _s, _sb, _MX, _MC;
_GMUI = argument0;
_MX = argument1;

for(_s=0;_s<ds_list_size(_GMUI.GMUI_groupScrollbars);_s+=1) {
    _sb = ds_list_find_value(_GMUI.GMUI_groupScrollbars,_s);
    
    if (GMUI_StudioCheckDefined(_sb)) {
        if (GMUI_MouseInGroupRegion(_sb.Group,_sb.Layer)) {
            _MC = _GMUI.GMUI_groupMasterControl[_sb.Layer,_sb.Group];
            // Calculated: X + W - scrollbar W - gridX - offset
            if (_MX >= _MC.Scrollbar_x) {
                return _MC;
                break;
            }
        }
    }
}

return -1;

