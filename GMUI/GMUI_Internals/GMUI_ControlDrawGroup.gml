///GMUI_ControlDrawGroup(GMUI instance, Layer, Group, Alpha, FadeMode [0 or 1])
///Draws the group if set to do any drawing - Called by master control of group
function GMUI_ControlDrawGroup(argument0,argument1,argument2,argument3,argument4) {

var _GMUII, _layer, _group, _alpha, _fadeMode;
_GMUII = argument0;
_layer = argument1;
_group = argument2;
_alpha = argument3;
_fadeMode = round(GMUIminmax(argument4,0,1));

// Draw the selected group if set from the form
if ((_GMUII).GMUI_groupGraphicMapIsUsed[_layer,_group]) {
    GMUI_DrawSpriteBox(_GMUII,_layer,_group,1,_alpha);
}            

if (ControlHasGroupStyle) {
    var x1,x2,y1,y2,alphadiff;
    if (_GMUII.UIEnableSurfaces) {
        x1 = 0;
        y1 = 0;
    }
    else {
        x1 = (GMUII()).GMUI_groupActualX[_layer,_group] + (GMUII()).GMUI_grid_x[_layer] + GMUI_GridViewOffsetX(GMUII());
        y1 = (GMUII()).GMUI_groupActualY[_layer,_group] + (GMUII()).GMUI_grid_y[_layer] + GMUI_GridViewOffsetY(GMUII());
    }
    x2 = x1 + (GMUII()).GMUI_groupCellsW[_layer,_group]*(GMUII()).cellsize;
    y2 = y1 + (GMUII()).GMUI_groupCellsH[_layer,_group]*(GMUII()).cellsize_h;
    
    alphadiff = GroupBackgroundAlpha - GroupBorderAlpha;
    // Background
    GMUIcolor_alpha(GroupBackgroundColor,min(GroupBackgroundAlpha, _alpha+(alphadiff*(alphadiff<0))*_fadeMode ));
    if (GroupIsRoundRect)
        draw_roundrect(x1,y1,x2,y2,false);
    else
        draw_rectangle(x1,y1,x2,y2,false);
        
    // Border
    GMUIcolor_alpha(GroupBorderColor,min(GroupBorderAlpha, _alpha-(alphadiff*(alphadiff>0))*_fadeMode ));
    if (GroupIsRoundRect)
        draw_roundrect(x1,y1,x2,y2,true);
    else
        draw_rectangle(x1,y1,x2,y2,true);
        
}
}

