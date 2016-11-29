#define GMUI_GetAnchoredCellY
///GMUI_GetAnchoredCellY(GMUII, Layer, Cell Y given, Anchor Type)
/// Returns the new X cell position in the grid based on the anchoring


// Height of a GMUI grid is usually: ds_grid_height((GMUII()).GMUI_grid[Layer]);

var __GridH, __CellY, __Anchor;
__GridH = argument0;
__CellY = argument1;
__Anchor = argument2;

// Top anchors by default will not need to calculate the grid dimensions or any adjustments
if (__Anchor == global.GMUIAnchorTopLeft || __Anchor == global.GMUIAnchorTop || __Anchor == global.GMUIAnchorTopRight) {
    return __CellY;
}
else {  
    // The Mid Y's else the Bottom Y's
    if (__Anchor == global.GMUIAnchorLeft || __Anchor == global.GMUIAnchorRight) {
        // Half-height accounts for the cell 0 added to the height.
        // (On even height, 0 is top of the middle and 1 is bottom of the middle)
        return floor(__GridH / 2 - 0.5) + __CellY;
    }
    else if (__Anchor == global.GMUIAnchorBottomLeft || __Anchor == global.GMUIAnchorBottom || __Anchor == global.GMUIAnchorBottomRight)
        return __GridH - __CellY - 1;
    else
        return __CellY;
}

