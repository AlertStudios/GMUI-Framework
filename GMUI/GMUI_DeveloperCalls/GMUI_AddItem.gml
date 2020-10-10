///GMUI_AddItem(id, value, name, description, sprite [or -1])
///Adds an item to a control with an item list
function GMUI_AddItem(argument0,argument1,argument2,argument3,argument4) {

if (!GMUI_IsControl() && id != GMUII())
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_AddItem);
    return false;
}

if (ControlItemList || ControlType == "dropdown") {
    var _id, _OF; _id = argument0;
    // Check if item exists, creating it if it doesnt
    if (!GMUI_AddItemDefaults(id,_id))
        GMUI_ThrowErrorDetailed("Could not create new item!", GMUI_AddItem);
    else {
        ItemListValue[_id] = argument1;
        ItemListName[_id] = string(argument2);
        ItemListDescription[_id] = string(argument3);
        
        if (sprite_exists(argument4))
            ItemListSprite[_id] = argument4;
        else
            ItemListSprite[_id] = -1;
            
        // Recalculate the height of the selectable scrollbar based on the number of items
        _OF = max(CellHigh,ItemListSize);
        if (ControlHasScrollbar) {
            Scrollbar_height = max(GMUIP.cellsize_h, CellHigh / _OF * Scrollbar_max) - Scrollbar_padding*2 + 2;
            Scrollbar_maxtop = Scrollbar_max - Scrollbar_height;
        }
        
        // Set style if default set
        if (ItemListBackgroundColor[0] != -1)
            ItemListBackgroundColor[_id] = ItemListBackgroundColor[0];
        if (ItemListBorderColor[0] != -1)
            ItemListBorderColor[_id] = ItemListBorderColor[0];
        if (ItemListBackgroundColorHover[0] != -1)
            ItemListBackgroundColorHover[_id] = ItemListBackgroundColorHover[0];
        if (ItemListBackgroundAlphaHover[0] != -1)
            ItemListBackgroundAlphaHover[_id] = ItemListBackgroundAlphaHover[0];
            
    }
}
else
    return false;
    
return true;

}

