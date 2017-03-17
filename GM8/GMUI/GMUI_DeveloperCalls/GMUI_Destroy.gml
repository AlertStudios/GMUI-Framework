#define GMUI_Destroy
///GMUI_Destroy()
///Only call this when you want to remove all traces of this GMUI instance, including the object itself

var gmuiid;

gmuiid = GMUIself();

if (gmuiid != -1) {
    GMUI_DestroyNumber(gmuiid);
}

