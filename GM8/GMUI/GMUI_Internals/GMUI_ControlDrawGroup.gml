#define GMUI_ControlDrawGroup
///GMUI_ControlDrawGroup(GMUI instance, Layer, Group, Alpha, FadeMode [0 or 1])
///Draws the group if set to do any drawing - Called by master control of group

var _GMUII, _layer, _group, gx, gy, gw, gh, _fadeMode;
_GMUII = argument0;
_layer = argument1;
_group = argument2;
_alpha = argument3;
_fadeMode = round(minmax(argument4,0,1));

// Draw the selected group if set from the form
if ((_GMUII).GMUI_groupGraphicMapIsUsed[_layer,_group]) {
    GMUI_DrawSpriteBox(_GMUII,_layer,_group,1,_alpha);
}            

if (ControlHasGroupStyle) {
    var x1,x2,y1,y2,xoffset,yoffset,alphadiff;
    if ((GMUII()).UIsnaptoview) {
        xoffset = view_xview[(GMUII()).UIgridview];
        yoffset = view_yview[(GMUII()).UIgridview];
    }
    
    x1 = (GMUII()).GMUI_groupActualX[_layer,_group] + (GMUII()).GMUI_grid_x[_layer] + xoffset;
    y1 = (GMUII()).GMUI_groupActualY[_layer,_group] + (GMUII()).GMUI_grid_y[_layer] + yoffset;
    x2 = (GMUII()).GMUI_groupActualX[_layer,_group] + 
            (GMUII()).GMUI_groupCellsW[_layer,_group]*(GMUII()).cellsize + (GMUII()).GMUI_grid_x[_layer] + xoffset;
    y2 = (GMUII()).GMUI_groupActualY[_layer,_group] + 
            (GMUII()).GMUI_groupCellsH[_layer,_group]*(GMUII()).cellsize_h + (GMUII()).GMUI_grid_y[_layer] + yoffset;
    alphadiff = GroupBackgroundAlpha - GroupBorderAlpha;
    // Background
    color_alpha(GroupBackgroundColor,min(GroupBackgroundAlpha, _alpha+(alphadiff*(alphadiff<0))*_fadeMode ));
    if (GroupIsRoundRect)
        draw_roundrect(x1,y1,x2,y2,false);
    else
        draw_rectangle(x1,y1,x2,y2,false);
        
    // Border
    color_alpha(GroupBorderColor,min(GroupBorderAlpha, _alpha-(alphadiff*(alphadiff>0))*_fadeMode ));
    if (GroupIsRoundRect)
        draw_roundrect(x1,y1,x2,y2,true);
    else
        draw_rectangle(x1,y1,x2,y2,true);
        
}

