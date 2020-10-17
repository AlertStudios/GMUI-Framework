///GMUI_CenterY(Layer, Control Height Cells #, Anchor)
///Get X Cell of Anchor for centering on layer
function GMUI_CenterY(argument0,argument1,argument2) {

var _Layer, _CellsHigh, _Anchor, _CenterCell, _HalfHeight, _LayerHeight;
_Layer = argument0;
_CellsHigh = argument1;
_Anchor = argument2;

_LayerHeight = GMUI_GridGetHeight(GMUII(),_Layer);

// Find middle of layer
_CenterCell = GMUI_GetAnchoredCellY(_LayerHeight, 0 ,global.GMUIAnchorLeft)

// subtract half width from it and adjust relative if necessary
_HalfHeight = floor(_CellsHigh / 2 + 0.5);


// The Mid Y's else the Bottom Y's
if (_Anchor == global.GMUIAnchorLeft || _Anchor == global.GMUIAnchorRight) {
    // Half-height accounts for the cell 0 added to the height.
    // (On even height, 0 is top of the middle and 1 is bottom of the middle)
    return 0 - _HalfHeight;
}
else if (_Anchor == global.GMUIAnchorBottomLeft || _Anchor == global.GMUIAnchorBottom || _Anchor == global.GMUIAnchorBottomRight)
    return _LayerHeight - _CenterCell + _HalfHeight - 1;
else
    return _CenterCell - _HalfHeight;
    
}

