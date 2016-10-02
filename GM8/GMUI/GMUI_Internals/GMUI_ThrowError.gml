#define GMUI_ThrowError
/// GMUI can store errors and can choose to save/report them if needed

//GMUI_ThrowError(Error Message)

(GMUII()).GMUI_ErrorNumber += 1;
(GMUII()).GMUI_Error[(GMUII()).GMUI_ErrorNumber] = string(argument0);

