///GMUI_DropdownSelect(control, isOpening)
/// Creates a select list around the dropdown region from the parent control
/// isOpening either creates the new select list, or removes it when closing
function GMUI_DropdownSelect(argument0,argument1) {

// 1. values from parent (control) to use to create new control

var _Control,_isOpening,_SLName,_checkSL,_newSL,_newCellY,_newCellHigh;

_Control = argument0;
_isOpening = argument1;
_SLName = "DDSL|" + _Control.valueName;

if (_isOpening) {

    // Default to minimum (overridable) or the cell height * 2, unless defined
    if (_Control.ControlDropdownCellHigh <= 0)
        _newCellHigh = max(_Control.ControlDropdownCellHighMin, _Control.CellHigh * 2);
    else
        _newCellHigh = _Control.ControlDropdownCellHigh;
        
    // Check clearance of placing select list below control
    if (_Control.RelativeCellY + _Control.CellHigh + _newCellHigh > GMUI_GridGetHeight(_Control.GMUIP,_Control.Layer))
        _newCellY = _Control.RelativeCellY - _newCellHigh;
    else
        _newCellY = _Control.RelativeCellY + _Control.CellHigh;
        
    _Control.Selected = true;
        
    // Use default, or use applied settings to select list object, creating it if it doesn't exist
    _checkSL = GMUI_GetControl(_SLName);
    
    if (!GMUI_StudioCheckDefined(_checkSL) || _checkSL == -1) {
    
        _newSL = GMUI_AddToLayer(_Control.Layer,_SLName, "selectlist", 
            _Control.RelativeCellX, _newCellY,
            _Control.CellWide, _newCellHigh,
            _Control.Anchor);
    }
    else {
    
        _newSL = _checkSL;
        GMUI_ControlHide(_SLName, false);
    }
        
    // Set parent to this control, apply settings
    _newSL.ControlDropdownParent = _Control;
    _newSL.depth = _Control.depth - 2;
    
    with (_newSL) {
        // Set settings using parent's settings (like above commands). And apply them (run) here:
        
        if (_Control.Group > 0)
            GMUI_ControlAddToGroup(_Control.Group);
        
        GMUI_ItemListSelectAction(GMUI_DropdownSelectItem);
        
        // Add all select list settings from parent
        GMUI_ItemListSettings(_Control.ItemListHeight, _Control.ItemListBorderColor[0],
            _Control.ItemListDrawScript, _Control.ItemListFadeTime);
            
        GMUI_ItemListBackground(_Control.ItemListBackgroundColor[0], _Control.ItemListBackgroundColorHover[0],
            _Control.ItemListBackgroundAlpha[0], _Control.ItemListBackgroundAlphaHover[0]);
        
        // Add all items from parent
        var i,_id;
        for (i=1;i<=_Control.ItemListSize;i+=1) {
            _id = _Control.ItemListId[i];
            GMUI_AddItem(_id,_Control.ItemListValue[_id],_Control.ItemListName[_id],_Control.ItemListDescription[_id],_Control.ItemListSprite[_id]);
        }
        
            
        // Set clickoff
        GMUIP.GMUI_controlClickOff = id;
    }
    
    GMUI_GridUpdateLayer(_Control.GMUIP,_Control.Layer);
    
    
}
else {

    // Remove the select list, and update the parent control with the new value
    GMUI_ControlHide(_SLName, true);
    
}
}

