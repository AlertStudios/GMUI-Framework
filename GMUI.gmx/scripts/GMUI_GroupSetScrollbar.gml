///GMUI_GroupSetScrollbar(GMUI instance, drawing control ID)
///Adds the control handling the scrollbar to the list if it doesnt exist

var _GMUI, _sbid, _s, _sb, _found;
_GMUI = argument0;
_sbid = argument1;
_found = false;

for(_s=0;_s<ds_list_size(_GMUI.GMUI_groupScrollbars);_s+=1) {
    _sb = ds_list_find_value(_GMUI.GMUI_groupScrollbars,_s);
    
    if (GMUI_StudioCheckDefined(_sb)) {
        if (_sb == _sbid)
            _found = true;
    }
}

if (!_found) {
    ds_list_add(_GMUI.GMUI_groupScrollbars,_sbid);
}
