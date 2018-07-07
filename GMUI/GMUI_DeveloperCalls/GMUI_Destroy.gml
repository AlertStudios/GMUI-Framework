///GMUI_Destroy()
///Only call this when you want to remove all traces of this GMUI instance, including the object itself and all its controls

var gmuiid;

gmuiid = GMUIself();

if (gmuiid != -1) {
    GMUI_DestroyNumber(gmuiid);
}
else {
    GMUI_ThrowErrorDetailed("Unable to destroy grid. called from ID: " + string(gmuiid), GMUI_Destroy);
}

