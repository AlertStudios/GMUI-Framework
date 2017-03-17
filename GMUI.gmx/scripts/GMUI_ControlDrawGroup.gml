///GMUI_ControlDrawGroup(GMUI instance, Layer, Group)
///Draws the group if set to do any drawing - Called by master control of group

var _GMUII, _layer, _group, gx, gy, gw, gh;
_GMUII = argument0;
_layer = argument1;
_group = argument2;

// Draw the selected group if set from the form
if ((_GMUII).GMUI_groupGraphicMapIsUsed[_layer,_group]) {
    GMUI_DrawSpriteBox(_GMUII,_layer,_group,1);
}            

