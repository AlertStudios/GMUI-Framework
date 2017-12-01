///GMUI_ControlDrawToggle(id of toggle control object)
/// Draw the control as a toggle

var _tt_id, _SCRIPT;
_tt_id = argument0;
_SCRIPT = GMUI_ControlDrawToggle;

with (_tt_id) {
    // If this happens, GMUI has a bug
    if (ControlType == "toggle") {
        // Draw toggle control
        //var cpx,cpx2,cpy,cpy2,chh,cx2,cw2,cy2,ch2,chw2,chy2,
        var chh, cx1, cy1, cx2, cy2, cxrp, cyrp, _tt, _tp, TSC,TSA,deg,degp,d;
        if (ToggleOrientation == global.GMUIDirectionTypeHorizontal) {
            
            // new:
            chh = ceil((RoomH - RoomY) / 2); // half height
            cx1 = RoomX + TogglePadding;
            cy1 = RoomY;
            cx2 = RoomW - TogglePadding;
            cy2 = RoomH;
            // for full rounded:
            cxrp = chh;
            cyrp = 1;
            
            deg = 90;
        }
        else {
            
            chh = ceil((RoomW - RoomX) / 2); // half height
            cx1 = RoomX;
            cy1 = RoomY + TogglePadding;
            cx2 = RoomW;
            cy2 = RoomH - TogglePadding;
            // for full rounded:
            cxrp = 1;
            cyrp = chh;
            
            deg = 0;
        }
        
        degp = 2; // degree precision for half circle
        _tp = ToggleThumbPad; // padding between 'thumb' and slide edge
        _tt = ToggleThumbSize; // width/height of the 'thumb'
        
        if (Toggle_t < Toggle_d)
            TSC = merge_color(ToggleSlideColorOff,ToggleSlideColorOn,ToggleRelativeXorY/(ToggleFinalXorY-ToggleInitialXorY));
        else if (value)
            TSC = ToggleSlideColorOn;
        else
            TSC = ToggleSlideColorOff;
            
        TSA = ToggleSlideAlpha;
        
        // Draw slide region
        draw_set_color(TSC);
        draw_set_alpha(TSA);
        switch (ToggleSlideShape) {
            case global.GMUISlideNone: // -1 Custom (No slide)
                break;
            case global.GMUISlideLine: // -2 Single (Horizontal line)
                draw_line(cx1+chh,cy1+chh,cx2-chh,cy2-chh);
                break;
            case global.GMUISlideRect: // -3
                draw_rectangle(cx1,cy1,cx2,cy2,0);
                break;
            case global.GMUISlideRoundRect: // -4
                draw_roundrect(cx1,cy1,cx2,cy2,0);
                break;
            case global.GMUISlideFullRoundRect: // -5
                draw_rectangle(cx1+cxrp,cy1+cyrp-(global.GMUIGameMaker8 <= 0),cx2-cxrp,cy2-cyrp,0);
                
                draw_primitive_begin(pr_trianglefan);
                draw_vertex_color(cx1+chh,cy1+chh,TSC,TSA);
                for (d=deg; d <= deg+180; d+=degp) {
                    draw_vertex_color(cx1+chh+lengthdir_x(chh,d),cy1+chh+lengthdir_y(chh,d),TSC,TSA);
                }
                draw_primitive_end();
                
                draw_primitive_begin(pr_trianglefan);
                draw_vertex_color(cx2-chh,cy2-chh,TSC,TSA);
                for (d=deg; d <= deg+180; d+=degp) {
                    draw_vertex_color(cx2-chh+lengthdir_x(chh,d+180),cy2-chh+lengthdir_y(chh,d+180),TSC,TSA);
                }
                draw_primitive_end();
                
                break;
            case 0: // none (slider only), or sprite
            default:
                break;
        }
        
        // Draw toggle thumb
        if (Toggle_t < Toggle_d)
            draw_set_color(merge_color(ToggleColorOff,ToggleColorOn,ToggleRelativeXorY/(ToggleFinalXorY-ToggleInitialXorY)));
        else if (value)
            draw_set_color(ToggleColorOn);
        else
            draw_set_color(ToggleColorOff);
        draw_set_alpha(ToggleAlpha);
        
        if (ToggleOrientation == global.GMUIDirectionTypeHorizontal)
            cx1 += ToggleRelativeXorY;
        else
            cy1 += ToggleRelativeXorY;
        
        // For now, just draw the shape that corresponds to the slide shape
        if (ToggleSlideShape >= global.GMUISlideRect) {
            draw_rectangle(cx1+_tp, cy1+_tp, cx1+_tt-_tp, cy1+_tt-_tp, 0);
        }
        else if (ToggleSlideShape == global.GMUISlideRoundRect) {
            draw_roundrect(cx1+_tp, cy1+_tp, cx1+_tt-_tp, cy1+_tt-_tp, 0);
        }
        else if (ToggleSlideShape == global.GMUISlideFullRoundRect) {
            draw_circle(cx1+chh,cy1+chh-(global.GMUIGameMaker8 <= 0),chh-_tp,0);
        }
        else {
            if (ToggleOrientation == global.GMUIDirectionTypeHorizontal)
                draw_roundrect(cpx+tp+chh/2, cpy+tp+chh, cpx-tp+chh, cpy-tp+chh, 0);
            else
                draw_roundrect(cpx+tp+chh, cpy+tp+chh/2, cpx-tp+chh*1.5, cpy-tp+chh*1.5, 0);
        }
        
    }
    else if (ControlType == "checkbox") {
        // Draw checkbox control
        var TSC,TA,TC,SII;
        TC = ToggleColorOff;
        if (Toggle_t < Toggle_d)
            TSC = merge_color(ToggleSlideColorOff,ToggleSlideColorOn,ToggleRelativeXorY);
        else if (value)
            TSC = ToggleSlideColorOn;
        else
            TSC = ToggleSlideColorOff;
        TA = ToggleAlpha;
        // Draw box
        if (ToggleSlideShape >= 0) {
            draw_sprite(ToggleSlideShape,0, RoomX + TogglePadding, RoomY + TogglePadding);
        }
        else {
            draw_set_color(TSC);
            draw_set_alpha(TA);
            draw_rectangle(RoomX + TogglePadding, RoomY + TogglePadding, RoomW - TogglePadding, RoomH - TogglePadding, 0);
            draw_set_color(TC);
            draw_rectangle(RoomX + TogglePadding, RoomY + TogglePadding, RoomW - TogglePadding, RoomH - TogglePadding, 1);
        }
        
        // Draw check
        if (ControlGraphic > -1) {
            if (value) {
                if (Hovering)
                    SII = ControlGraphicHoveringIndex;
                else if (Selected)
                    SII = ControlGraphicSelectedIndex;
                else
                    SII = ControlGraphicIndex;
                draw_sprite_ext(ControlGraphic, SII, RoomX + TogglePadding, RoomY + TogglePadding, 1,1,0,c_white, ToggleRelativeXorY);
            }
        }
        else {
            draw_set_color(ToggleColorOn);
            draw_set_alpha(ToggleRelativeXorY);
            draw_rectangle(RoomX+TogglePadding+3, RoomY+TogglePadding+3, RoomW-TogglePadding-3, RoomH-TogglePadding-3, 0);
        }
    }
    else {
        GMUI_ThrowErrorDetailed("Control Type is not toggle/checkbox!",_SCRIPT);
        return false;
    }
    
    return true;
    
    
}

