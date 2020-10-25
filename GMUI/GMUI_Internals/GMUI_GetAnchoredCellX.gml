///GMUI_GetAnchoredCellX(Area Width, Cell X given, Anchor Type)
/// Returns the new X cell position in the grid based on the anchoring
function GMUI_GetAnchoredCellX(argument0,argument1,argument2) {

// Width of a GMUI grid is usually: ds_grid_width((GMUII()).GMUI_grid[Layer]);

var __GridW, __CellX, __Anchor;
__GridW = argument0;
__CellX = argument1;
__Anchor = argument2;

// Left anchors by default will not need to calculate the grid dimensions or any adjustments
if (__Anchor == global.GMUIAnchorTopLeft || __Anchor == global.GMUIAnchorLeft || __Anchor == global.GMUIAnchorBottomLeft) {
    return __CellX;
}
else {
    // The Mid X's, else the Right X's 
    if (__Anchor == global.GMUIAnchorTop || __Anchor == global.GMUIAnchorBottom || __Anchor == global.GMUIAnchorCenter) {
        // Half-width accounts for the cell 0 added to the width.
        // (On even widths, 0 is left of the middle and 1 is right of the middle)
        return floor(__GridW / 2 - 0.5) + __CellX;
    }
    else if (__Anchor == global.GMUIAnchorTopRight || __Anchor == global.GMUIAnchorRight || __Anchor == global.GMUIAnchorBottomRight)
        return __GridW - __CellX - 1;
    else
        return __CellX;
}
}

