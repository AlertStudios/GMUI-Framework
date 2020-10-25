///GMUI_GroupMouseOnScrollbar(GMUI instance, Mouse X position)
///Adds the control handling the scrollbar to the list if it doesnt exist
function GMUI_GroupMouseOnScrollbar(argument0,argument1) {

var _GMUI, _Si, _SBC, _L, _MX;
_GMUI = argument0;
_MX = argument1;
_L = _GMUI.UILayer;

for(_Si=0;_Si<ds_list_size(_GMUI.GMUI_groupScrollbars);_Si+=1) {
    _SBC = ds_list_find_value(_GMUI.GMUI_groupScrollbars,_Si);
    if (GMUI_StudioCheckDefined(_SBC)) {
        if (GMUI_MouseInGroupRegion(_SBC.Group,_SBC.Layer)) {
            //_MC = _GMUI.GMUI_groupMasterControl[_SBC.Layer,_SBC.Group];
            // Calculated: X + W - scrollbar W - gridX - offset
            if (_MX >= _SBC.Scrollbar_x) {
                return _SBC;
                break;
            }
        }
    }
}

return -1;

}

