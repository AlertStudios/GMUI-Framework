#define GMUI_CreateSetDefaultArea
///GMUI_CreateSetDefaultArea() Set the default area to use to set the grid size for layers called by GMUI_Create()
///This depends on views or room size to set the grid size

UIsnaptoview = true;
UIgridview = 0;

UIgridwidth = room_width;
UIgridheight = room_height;

if (view_enabled) {
    UIgridwidth = view_wport[UIgridview];
    UIgridheight = view_hport[UIgridview];
}

