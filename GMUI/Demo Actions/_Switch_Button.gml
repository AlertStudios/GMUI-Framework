//switch group positions

if (!global.Switched) {
    var anchoredRight; 
    anchoredRight = GMUI_GetAnchoredCellX(GMUI_GridGetWidth(GMUII(),0),11,global.GMUIAnchorTopRight);
    
    GMUI_GroupTransitionToCell(0, 1, 2, 3, easeElasticOut, 30);
    GMUI_GroupTransitionToCell(0, 2, anchoredRight, 3, easeElasticOut, 30);
    global.Switched = true;
}
else {
    var anchoredRight; 
    anchoredRight = GMUI_GetAnchoredCellX(GMUI_GridGetWidth(GMUII(),0),20,global.GMUIAnchorTopRight);
    
    GMUI_GroupTransitionToCell(0, 1, anchoredRight, 3, easeElasticOut, 30);
    GMUI_GroupTransitionToCell(0, 2, 2, 3, easeElasticOut, 30);
    global.Switched = false;
}

