///GMUI_GroupSetOverflow(Group, Overflow Mode [GMUIOverflow.], scrollbar width [or -1 for default])
///Set the method for overflowing groups, and scrollbar with if necessary

var _GMUI, _Layer, _Group, _Direction, _DC;
_GMUI = GMUII();
_Layer = UIAddToLayer;
_Group = argument0;
_Overflow = argument1;


_GMUI.GMUI_groupOverflow[_Layer,_Group] = _Overflow;
if (argument2 > 0) {
    if (_Overflow == global.GMUIOverflowScroll) {
        _GMUI.GMUI_groupScrollWidth[_Layer,_Group] = argument2;
        
        if (_GMUI.GMUI_groupMasterControl[_Layer,_Group] != -1) {
            if ((_GMUI.GMUI_groupMasterControl[_Layer,_Group]).GroupHasScrollbar == false) {
                _GMUI.GMUI_groupMasterControl[_Layer,_Group].GroupHasScrollbar = true;
                
                if (_GMUI.UIInterfaceSet) {
                    GMUI_GroupSetScrollbar(_GMUI,_LayerNumber,_GroupNumber,-1);
                }
            }
        }
    }
}
//GMUIOverflowNone = 0;
//GMUIOverflowResize = 1;
//GMUIOverflowScroll = 2;



