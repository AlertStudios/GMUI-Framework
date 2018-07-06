#define GMUI_ControlSetDefaultItemList
///GMUI_ControlSetDefaultItemList(id)

if (!instance_exists(argument0))
{
    GMUI_ThrowErrorDetailed("Invalid control", GMUI_ControlSetDefaultItemList);
    return false;
}

with (argument0)
{
    NeedsItemListUpdate = true; // for surfaces
    ItemListSize = 0;
    ItemListSelectedId = -1;
    ItemListActionScript = -1;
    ItemListHeight = GMUIP.cellsize_h; // temporary height of list item
    ItemListMidHeight = ItemListHeight / 2;
    ItemListThirdHeight = floor(ItemListHeight / 3);
    ItemListAreaHeight = CellHigh*GMUIP.cellsize_h;
    ItemListAreaWidth = CellWide*GMUIP.cellsize;
    ItemListBackgroundColor = -1;
    ItemListBorderColor = -1;
    ItemListHoverColor = -1;
    ItemListDrawScript = -1;
    ItemListFadeTime = 0;
    ControlHasScrollbar = true;
    Scrollbar_hover = false;
}

return true;

