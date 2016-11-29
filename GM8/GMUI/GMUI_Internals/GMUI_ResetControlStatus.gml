#define GMUI_ResetControlStatus
///GMUI_GridStep ("Hovering" / "Selected", GridID)
/// Resets the hovering or selected values of the controls

var a0,ff,ffo,m,ms; a0 = string(argument0);

if (string_lower(a0) == "selected" || a0 == "1")
{
    (GMUII()).SelectedControl = -1;
    ff = ds_map_find_first((GMUII()).GMUI_map);
    if (string(ff) == "0")
        GMUI_ThrowError("No controls exist for GMUI_ResetControlStatus()");
    else
    {
        // Set all controls' selected variable to false and find previous selection if there is one
        PreviousSelectedControl = -1;
        
        ms = ds_map_size((GMUII()).GMUI_map);
        for (m=0; m < ms; m+=1) {
            if (string(ff) != "0" && GMUI_StudioCheckDefined(ff)) {
                ffo = ds_map_find_value((GMUII()).GMUI_map,ff);
                if (GMUI_StudioCheckDefined(ffo)) {
                    if ((ffo).Selected)
                        PreviousSelectedControl = ffo;
                    (ffo).Selected = 0;
                    (ffo).DoubleSelected = 0;
                }
            }
            
            ff = ds_map_find_next((GMUII()).GMUI_map,ff);
        }
    }
}
else
{
    // Quiet failure if incorrect arguments provided, but still do hovering value
    if (string_lower(a0) != "hovering" && a0 != "0")
        GMUI_ThrowError("Incorrect parameter given to GMUI_ResetControlStatus()");
    
    (GMUII()).HoveringControl = -1;
    ff = ds_map_find_first((GMUII()).GMUI_map);
    if (string(ff) == "0")
        GMUI_ThrowError("No controls exist for GMUI_ResetControlStatus()");
    else
    {
        // Set all controls' hover variable to false
        ms = ds_map_size((GMUII()).GMUI_map);
        for (m=0; m < ms; m+=1) {
            if (string(ff) != "0" && GMUI_StudioCheckDefined(ff)) {
                ffo = ds_map_find_value((GMUII()).GMUI_map,ff);
                if (GMUI_StudioCheckDefined(ffo)) {
                    (ffo).Hovering = 0;
                    (ffo).HoveringDirection = 0;
                }
            }
            
            ff = ds_map_find_next((GMUII()).GMUI_map,ff);
        }
    }
    
}

