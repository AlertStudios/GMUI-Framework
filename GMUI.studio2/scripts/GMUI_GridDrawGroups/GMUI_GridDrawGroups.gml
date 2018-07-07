///GMUI_GridDrawGroups(GMUI instance)
///Draws the groups if set to do so
// CURRENTLY NOT USED!!!!! //

var _GMUII, _layer, l, g, gx, gy, gw, gh, xoffset, yoffset, spr_width, spr_height;
_GMUII = argument0;

xoffset = GMUI_GridViewOffsetX(_GMUII);
yoffset = GMUI_GridViewOffsetY(_GMUII);

for(l=0;l<ds_list_size((_GMUII).GMUI_gridlist);l+=1) {

    _layer = ds_list_find_value((_GMUII).GMUI_gridlist,l);
    
    if (_layer >= 0) {
        // Draw grids for this layer
        for (g=0;g<ds_list_size((_GMUII).GMUI_groupList[_layer]);g+=1) {
            // Draw the selected group if set from the form
            if ((_GMUII).GMUI_groupGraphicMapIsUsed[_layer,g]) {
                // group dimensions
                gx = GMUI_groupActualX[_layer,g] + (GMUII()).GMUI_grid_x[_layer] + xoffset;
                gy = GMUI_groupActualY[_layer,g] + (GMUII()).GMUI_grid_y[_layer] + yoffset;
                gw = GMUI_groupCellsW[_layer,g]*cellsize + (_GMUII).GMUI_grid_x[_layer,g] + xoffset;
                gh = GMUI_groupCellsH[_layer,g]*cellsize_h + (_GMUII).GMUI_grid_y[_layer,g] + yoffset;
                
                spr_width = sprite_get_width((_GMUII).GMUI_groupGraphicTopLeft);
                spr_height = sprite_get_height((_GMUII).GMUI_groupGraphicTopLeft);
                    
                // top left
                draw_sprite((_GMUII).GMUI_groupGraphicTopLeft[_layer,g],-1,gx,gy);
                
                // top
                draw_sprite_stretched((_GMUII).GMUI_groupGraphicTop[_layer,g],-1,gx+spr_width,gy,gw-spr_width,spr_height);
                
                // top right
                draw_sprite((_GMUII).GMUI_groupGraphicTopRight[_layer,g],-1,gx+gw-spr_width,gy);
                
                // right
                draw_sprite_stretched((_GMUII).GMUI_groupGraphicRight[_layer,g],-1,gx+gw-spr_width,gy+spr_height,spr_width,gh-spr_height);
                
                // bottom right
                draw_sprite((_GMUII).GMUI_groupGraphicBottomRight[_layer,g],-1,gx+gw-spr_width,gy+gh-spr_height);
                
                // bottom
                draw_sprite_stretched((_GMUII).GMUI_groupGraphicBottom[_layer,g],-1,gx+spr_width,gy+gh-spr_height,gw-spr_width,spr_height);
                
                // bottom left
                draw_sprite((_GMUII).GMUI_groupGraphicBottomLeft[_layer,g],-1,gx,gy+gh-spr_height);
                
                // left
                draw_sprite_stretched((_GMUII).GMUI_groupGraphicLeft[_layer,g],-1,gx,gy+spr_height,spr_width,gh-spr_height);
            
                // center (either partial or stretched to fit)
                if ((_GMUII).GMUI_groupGraphicCenterIsFixed[layer,g]) {
                    draw_sprite_part((_GMUII).GMUI_groupGraphicCenter[_layer,g],-1,0,0,gw-spr_width*2,gh-spr_height*2,gx+spr_width,gy+spr_height);
                }
                else {
                    draw_sprite_stretched((_GMUII).GMUI_groupGraphicCenter[_layer,g],-1,gx+spr_width,gy+spr_height,gw-spr_width*2,gh-spr_height*2);
                }
            }            
        }
    
    }
}

