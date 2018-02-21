///GMUI_CenterX(Layer, Control Width Cells #, Anchor)
///Get X Cell of Anchor for centering on layer

var _Layer, _CellsWide, _Anchor, _CenterCell, _HalfWidth, _LayerWidth;
_Layer = argument0;
_CellsWide = argument1;
_Anchor = argument2;

_LayerWidth = GMUI_GridGetWidth(GMUII(),_Layer);

// Find middle of layer
_CenterCell = GMUI_GetAnchoredCellX(_LayerWidth, 0 ,global.GMUIAnchorTop)

// subtract half width from it and adjust relative if necessary
_HalfWidth = floor(_CellsWide / 2 + 0.5);


if (_Anchor == global.GMUIAnchorTop || _Anchor == global.GMUIAnchorBottom) {
    // Half-width accounts for the cell 0 added to the width.
    // (On even widths, 0 is left of the middle and 1 is right of the middle)
    return 0 - _HalfWidth;
}
else if (_Anchor == global.GMUIAnchorTopRight || _Anchor == global.GMUIAnchorRight || _Anchor == global.GMUIAnchorBottomRight)
    return _LayerWidth - _CenterCell + _HalfWidth - 1;
else
    return _CenterCell - _HalfWidth;
