/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(1);
draw_set_color(c_red);
draw_roundrect(x,y,x+w,y+h,1);

draw_set_font(fontNumeric);
align(fa_left,fa_top);
draw_text(2+view_xview[0],20+view_yview[0],string(fps)); //demo only
draw_text(x+4,y+4,string(string(value))); //demo only

// Test: On mouse click, if mouse in control show menu, move group and show it, otherwise if not in group region, hide it again
if (mouse_check_button_pressed(mb_left)) {
    if (GMUI_GetCurrentLayer() == 0) {
        if (mouse_x >= x && mouse_x <= x+w && mouse_y >= y && mouse_y <= y+h) {
            if (GMUIid(1)) {
                GMUI_SetValue("MenuInt",value,global.GMUIDataTypeInteger);
                GMUI_GroupSetPositionActual(1,3,x+w+2,y+2);
                GMUI_GroupHide(3, 1, false);
                GMUI_SwitchToLayer(1);
            }
        }
    }
    else if (GMUI_GetCurrentLayer() == 1) {
        if (!GMUI_MouseInGroupRegion(3, 1) && !(mouse_x >= x && mouse_x <= x+w && mouse_y >= y && mouse_y <= y+h)) {
            if (GMUIid(1)) {
                value = GMUI_GetValue("MenuInt");
                GMUI_GroupHide(3, 1, true);
                GMUI_SwitchToLayer(0);
            }
        }
    }
}

// Test: Deselect the menu if the view is moved, just for this demo.
if (keyboard_check(vk_left) || keyboard_check(vk_right) || keyboard_check(vk_up) || keyboard_check(vk_down)) {
    if (GMUIid(1)) {
        value = GMUI_GetValue("MenuInt");
        GMUI_GroupHide(3, 1, 1);
        GMUI_SwitchToLayer(0);
    }
}