///GMUI_ControlDrawItemList(Control ID, Using Surface[bool])
///Draws the group if set to do any drawing - Called by master control of group

var _GMUII, _Ctrl, _UsingSurface, _Surface, _i, _id, _relMY, _cx, _cy, _sbw, _canDraw, _offPos;
_Ctrl = argument0;
_UsingSurface = argument1;
_GMUII = _Ctrl.GMUIP;

_cx = 0; _cy = 0;
if (!_UsingSurface) {
    _Surface = -1;
    _cx = _Ctrl.ActualX+_Ctrl.GMUIP.GMUI_grid_x[_Ctrl.Layer]+GMUI_GridViewOffsetX(_Ctrl.GMUIP);
    _cy = _Ctrl.ActualY+_Ctrl.GMUIP.GMUI_grid_y[_Ctrl.Layer]+GMUI_GridViewOffsetY(_Ctrl.GMUIP);
}
else {
    _Surface = surface_target(_Ctrl.SelectListSurface,_Ctrl.RoomW-_Ctrl.RoomX,max(_Ctrl.RoomH-_Ctrl.RoomY,ItemListHeight*ItemListSize));
    surface_clear(_Surface);
}

_sbw = 0;
if (_Ctrl.ControlHasScrollbar)
    _sbw = Scrollbar_width;


// Get offset and hovering index
//if (_Ctrl.Hovering)
//    _relMY = mouse_y - _Ctrl.RoomY;

_offPos = GMUI_ControlListOffset(_Ctrl, _UsingSurface, mouse_x, mouse_y);

if (_UsingSurface) {
    _Ctrl.ItemListOffsetY = _offPos;
    
    // No drawing offset in surface
    _offPos = 0;
}

// Reset hover index if no longer hovering
if (!_Ctrl.Hovering)
    _Ctrl.ItemListHoverIndex = -1;
else
    _Ctrl.NeedsDrawUpdate = true;

// Set alignments (for now this is static)
align(fa_left,fa_middle);

// Array index [0] holds default values
// Draw the select list control, and all of its items
for (_i=1;_i<=ItemListSize;_i+=1) {
    //center text on height; if description, center both name and description to height (description smaller size)
    
    _id = ItemListId[_i];
    
    if (ItemListDrawScript > -1)
        script_execute(ItemListDrawScript,_id);
    else {
        // Draw the item. If not using surfaces, don't draw if outside the viewing range
        _canDraw = true;
        
        if (!_UsingSurface) {
            if ((_i-_offPos) * ItemListHeight > ItemListAreaHeight) {
                _canDraw = false;
            }
            else {
                
                if (_i-1 < _offPos) {
                    _canDraw = false;
                }
            }
        }
        
        //test only
        //draw_text(_cx + 100, _cy + (_i-1) * ItemListHeight + ItemListMidHeight, string((_i+1+_offPos) * ItemListHeight));
        
        // Draw the individual item depending on the provided parameters
        if (_canDraw) {
            // Draw background if defined
            _ibgc = ItemListBackgroundColor[_id];
            if (_ibgc == -1)
                _ibgc = ItemListBackgroundColor[0];
            
            if (_ibgc != -1) {
                if (ItemListHoverIndex == _i) {
                    if (ItemListBackgroundColorHover[_id] != -1)
                        draw_set_color(ItemListBackgroundColorHover[_id]);
                    else if (ItemListBackgroundColorHover[0] != -1)
                        draw_set_color(ItemListBackgroundColorHover[0]);
                    if (ItemListBackgroundAlphaHover[_id] != -1)
                        draw_set_alpha(min(FadeAlpha,ItemListBackgroundAlphaHover[_id]));
                    else if (ItemListBackgroundAlphaHover[0] != -1)
                        draw_set_alpha(min(FadeAlpha,ItemListBackgroundAlphaHover[0]));
                }
                else {
                    if (ItemListBackgroundColor[_id] != -1)
                        draw_set_color(ItemListBackgroundColor[_id]);
                    else if (ItemListBackgroundColor[0] != -1)
                        draw_set_color(ItemListBackgroundColor[0]);
                    
                    if (ItemListBackgroundAlpha[_id] != -1)
                        draw_set_alpha(min(FadeAlpha,ItemListBackgroundAlpha[_id]));
                    else if (ItemListBackgroundAlpha[0] != -1)
                        draw_set_alpha(min(FadeAlpha,ItemListBackgroundAlpha[0]));
                }
                
                draw_rectangle(_cx,_cy + (_i-_offPos-1) * ItemListHeight,_cx + ItemListAreaWidth - _sbw,_cy + (_i-_offPos) * ItemListHeight - 1,false);
            }
            
            // Set font if defined
            if (ItemListFont[_id] != -1)
                draw_set_font(ItemListFont[_id]);
            else if (ItemListFont[0] != -1)
                draw_set_font(ItemListFont[0]);
                
            // Set font color if defined, and if hovering
            if (ItemListHoverIndex == _i) {
                if (ItemListFontColorHover[_id] != -1)
                    draw_set_color(ItemListFontColorHover[_id]);
                else if (ItemListFontColorHover[0] != -1)
                    draw_set_color(ItemListFontColorHover[0]);
            }
            else if (ItemListFontColor[_id] != -1)
                draw_set_color(ItemListFontColor[_id]);
            else if (ItemListFontColor[0] != -1)
                draw_set_color(ItemListFontColor[0]);
                
            // Set opacity
            draw_set_alpha(min(FadeAlpha,ItemListOpacity[_id]));
            
            // Draw text (temporary values for X)
            if (ItemListDescription[_id] == "") {
                draw_text(_cx + 10, _cy + (_i-_offPos-1) * ItemListHeight + ItemListMidHeight, ItemListName[_id]);
            }
            else {
                draw_text(_cx + 10, _cy + (_i-_offPos-1) * ItemListHeight + ItemListThirdHeight, ItemListName[_id]);
                draw_text(_cx + 10, _cy + (_i-_offPos-1) * ItemListHeight + ItemListThirdHeight * 2, ItemListDescription[_id]);
            }
            
            // Draw border if defined, for every item after the first (todo: needs revision...)
            if (_i > 0) {
                if (ItemListBorderColor[_id] >= 0) {
                    draw_set_color(ItemListBorderColor[_id]);
                    draw_line(_cx,_cy + (_i-_offPos) * ItemListHeight - 1, _cx + ItemListAreaWidth - _sbw,_cy + (_i-_offPos) * ItemListHeight - 1);
                }
            }
        }
        
    }

    //ItemListSprite[_id] = -1;
    //ItemListFadeTime
}

if (_UsingSurface)
    surface_reset_target();

return _Surface;



