///GMUI_ControlHideTooltip("ControlName that has tooltip", Hide?)
///Hide or show a control's tooltip
// argument1 is to hide (1) or show (0)

with (GMUII()) {
    // Retrieve control from the reference map
    var _ctrl, _ctrlTT;
    if (is_string(argument0))
        _ctrl = ds_map_find_value(GMUI_map,argument0);
    else
        _ctrl = argument0;
    if (string(_ctrl) == "0")
        return false;
    else if ((_ctrl).TooltipId == -1)
        return false;
    else {
        _ctrlTT = (_ctrl).TooltipId;
        GMUI_ControlHide(_ctrlTT,argument1);
        return true;
    }
}
