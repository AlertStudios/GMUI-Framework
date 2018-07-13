/// @description Insert description here
// You can write your code in this editor

if (p < 100)
	p+= 1;
else {
	p = 0;
	if (pos < 3)
		pos += 1;
	else
		pos = 0;
}

switch (pos) {
	case 0:
		x += 1;
		break;
	case 1:
		y += 1;
		break;
	case 2:
		x -= 1;
		break;
	case 3:
		y -= 1;
		break;
}