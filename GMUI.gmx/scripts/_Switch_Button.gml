//switch group positions

if (!global.Switched) {
    GMUI_GroupTransitionToCell(0, 1, 2, 3, easeElasticOut, 30);
    GMUI_GroupTransitionToCell(0, 2, 28, 3, easeElasticOut, 30);
    global.Switched = true;
}
else {
    GMUI_GroupTransitionToCell(0, 1, 19, 3, easeElasticOut, 30);
    GMUI_GroupTransitionToCell(0, 2, 2, 3, easeElasticOut, 30);
    global.Switched = false;
}
