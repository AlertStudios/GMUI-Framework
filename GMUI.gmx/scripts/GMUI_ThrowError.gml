///GMUI_ThrowError(Error Message)
///GMUI can store errors and can choose to save/report them if needed

(GMUII()).GMUI_ErrorNumber += 1;
(GMUII()).GMUI_Error[(GMUII()).GMUI_ErrorNumber] = string(argument0);

if ((GMUII()).PopUpGMUIError) {
    show_message(GMUI_LastError());
}
