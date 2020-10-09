///GMUI_AddItemDefaults(Control ID, id)
///Initialize item with all default values

if (instance_exists(argument0)) {
    with (argument0) {
        if (ControlItemList || ControlType == "dropdown") {
            // Check if ID exists first, if not, add a default item
            var _m, _i, _id;
            _id = argument1;
            _m = false;
            // Check list for ID. Starts at 1
            for (_i=1;_i<=ItemListSize;_i+=1) {
                if (ItemListId[_i] == _id) {
                    _m = true; break;
                }
            }
            // If not matched, add the new id to the list
            if (!_m) {
                ItemListSize += 1;
                ItemListId[ItemListSize] = _id;
            }
            
            ItemListHoverIndex = -1;
            ItemListOffsetY = 0;
            
            // Defaults
            ItemListValue[_id] = 0;
            ItemListName[_id] = "";
            ItemListDescription[_id] = "";
            ItemListSprite[_id] = -1;
            ItemListBackgroundColor[_id] = -1;
            ItemListBackgroundColorHover[_id] = -1;
            ItemListBackgroundAlpha[_id] = 1;
            ItemListBackgroundAlphaHover[_id] = -1;
            ItemListFont[_id] = -1;
            ItemListFontColor[_id] = -1;
            ItemListFontColorHover[_id] = -1;
            ItemListBorderColor[_id] = -1;
            ItemListOpacity[_id] = 1;
            
            return true;
        }
    }
}

return false;

