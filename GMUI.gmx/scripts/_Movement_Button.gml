var _move;

switch (argument0) {
    case 1: 
        _move = -1;
        break
    case 2:
        _move = easeExpOut;
        break;
    case 3:
        _move = easeOutBack;
        break;
    case 4:
        _move = easeElasticOut;
        break;
    case 5:
        _move = easeBounceOut;
        break;
}


GMUI_ControlPosition("MovementBox", 2,2, 0,0, -1); // Use current anchor (-1)
GMUI_ControlPosition("MovementBox2", 2,2, 0,0, -1); // Use current anchor (-1)//testing
GMUI_ControlTransitionToCell("MovementBox", 10,2, _move, room_speed);
GMUI_ControlTransitionToCell("MovementBox2", 10,2, _move, room_speed);//testing
