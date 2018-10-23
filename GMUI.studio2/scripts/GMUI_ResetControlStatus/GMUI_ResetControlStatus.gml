///GMUI_ResetControlStatus("Hovering" / "Selected" / "Position", GridID)
/// Resets the hovering or selected values of the controls

var _SCRIPT,_GridID,a0,ff,ffo,m,ms; a0 = string(argument0);
_SCRIPT = GMUI_ResetControlStatus;
_GID = argument1;

if (string_lower(a0) == "selected" || a0 == "1") {
    (_GID).SelectedControl = -1;
    ff = ds_map_find_first((_GID).GMUI_map);
    if (string(ff) == "0")
        GMUI_ThrowErrorDetailed("No controls exist",_SCRIPT);
    else {
        // Set all controls' selected variable to false and find previous selection if there is one
        PreviousSelectedControl = -1;
        
        ms = ds_map_size((_GID).GMUI_map);
        for (m=0; m < ms; m+=1) {
            if (string(ff) != "0" && GMUI_StudioCheckDefined(ff)) {
                ffo = ds_map_find_value((_GID).GMUI_map,ff);
                if (GMUI_StudioCheckDefined(ffo)) {
                    if ((ffo).Selected)
                        PreviousSelectedControl = ffo;
                    (ffo).Selected = 0;
                    (ffo).DoubleSelected = 0;
                    (ffo).Holding = 0;
                    (ffo).HoldingTime = 0;
                }
            }
            
            ff = ds_map_find_next((_GID).GMUI_map,ff);
        }
    }
}
else if (string_lower(a0) == "hovering" || a0 == "0") {
    (_GID).HoveringControl = -1;
    ff = ds_map_find_first((_GID).GMUI_map);
    if (string(ff) == "0")
        GMUI_ThrowErrorDetailed("No controls exist",_SCRIPT);
    else {
        // Set all controls' hover variable to false
        ms = ds_map_size((_GID).GMUI_map);
        for (m=0; m < ms; m+=1) {
            if (string(ff) != "0" && GMUI_StudioCheckDefined(ff)) {
                ffo = ds_map_find_value((_GID).GMUI_map,ff);
                if (GMUI_StudioCheckDefined(ffo)) {
                    (ffo).Hovering = 0;
                    (ffo).HoveringDirection = 0;
                    
                    if ((ffo).ControlHasScrollbar) {
                        if (!(ffo).Scrollbar_dragging)
                            (ffo).Scrollbar_hover = false;
                    }
                }
            }
            
            ff = ds_map_find_next((_GID).GMUI_map,ff);
        }
    }
}
else if (string_lower(a0) == "position" || a0 == "2") {
    ff = ds_map_find_first((_GID).GMUI_map);
    if (string(ff) == "0")
        GMUI_ThrowErrorDetailed("No controls exist",_SCRIPT);
    else {
        // Set all controls' position update to true
        ms = ds_map_size((_GID).GMUI_map);
        for (m=0; m < ms; m+=1) {
            if (string(ff) != "0" && GMUI_StudioCheckDefined(ff)) {
                ffo = ds_map_find_value((_GID).GMUI_map,ff);
                if (GMUI_StudioCheckDefined(ffo)) {
                    (ffo).NeedsPositionUpdate = true;
                }
            }
            
            ff = ds_map_find_next((_GID).GMUI_map,ff);
        }
    }
}
else {
    GMUI_ThrowErrorDetailed("Incorrect parameter given",_SCRIPT);
}

