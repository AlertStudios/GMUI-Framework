///GMUI_GridSetMappedValues(GMUI instance, layer, group number)
///Iterate over the value map for the specific group to set values

var _SCRIPT, _Layer, _Map, _Key, _i, _prevLayer;
_SCRIPT = GMUI_GridSetMappedValues;
_Layer = argument1;
_Group = argument2;

with (argument0) {
    _Map = GMUI_groupSettingsMap[_Layer,_Group];
    if (_Map == -1) {
        return false;
    }
    
    _prevLayer = UIAddToLayer;
    UIAddToLayer = _Layer;
    
    _Key = ds_map_find_first(_Map);
    for (_i=0;_i<ds_map_size(_Map);_i+=1) {
        // Match key values with the script calls
        switch (_Key) {
            //GMUI_GroupSetFadeOnHide, GMUI_MenuSetFadeOnHide, GMUI_PopupSetFadeOnHide
            case "FadeSpeed":
                if (ds_map_exists(_Map,"FadeMode")) {
                    GMUI_GroupSetFadeOnHide(_Group,
                        ds_map_find_value(_Map,"FadeSpeed"), ds_map_find_value(_Map,"FadeMode"));
                }
                else {
                    GMUI_ThrowErrorDetailed("Missing FadeMode for GroupSetFadeOnHide. Unable to set",_SCRIPT);
                }
                break;
            //GMUI_GroupSetStyle, GMUI_MenuSetStyle, GMUI_PopupSetStyle
            case "BackgroundColor":
                if (ds_map_exists(_Map,"BackgroundAlpha")
                    && ds_map_exists(_Map,"BorderColor")
                    && ds_map_exists(_Map,"BorderAlpha")
                    && ds_map_exists(_Map,"IsRoundRect")) {
                    GMUI_GroupSetStyle(_Group,
                        ds_map_find_value(_Map, "BackgroundColor"),
                        ds_map_find_value(_Map, "BackgroundAlpha"),
                        ds_map_find_value(_Map, "BorderColor"),
                        ds_map_find_value(_Map, "BorderAlpha"),
                        ds_map_find_value(_Map, "IsRoundRect"));
                }
                else {
                    GMUI_ThrowErrorDetailed("Missing value for SetStyle. Unable to set",_SCRIPT);
                }
                break;
            //GMUI_GroupSetHidePosition, GMUI_MenuSetHidePosition, GMUI_PopupSetHidePosition
            case "HideCellX":
                if (ds_map_exists(_Map,"HideCellY")
                    && ds_map_exists(_Map,"HideTransition")
                    && ds_map_exists(_Map,"HideSpeed")) {
                    GMUI_GroupSetHidePosition(_Group,
                        ds_map_find_value(_Map, "HideCellX"),
                        ds_map_find_value(_Map, "HideCellY"),
                        ds_map_find_value(_Map, "HideTransition"),
                        ds_map_find_value(_Map, "HideSpeed"));
                }
                else {
                    GMUI_ThrowErrorDetailed("Missing value for SetHidePosition. Unable to set",_SCRIPT);
                }
                break;
            default:
                break;
        }
        _Key = ds_map_find_next(_Map,_Key);
    }
    
    //Restore the previous Add Layer value
    UIAddToLayer = _prevLayer;

    return true;
}

