/// @description ???

// Need to put an if statement here for if the monster gets too close to the surface

switch (global.scoreRelic) // To see how many relics have been collected
{
	case(1):
	case(2):
		// Put code here if the monster is going to be doing anything
		break;
	case(3):
		// This begins the slow movement of the monster
		break;
	// here would be more of the cases once the system works to have a gradual increase in speed.
	default:
		// Default will have the max speed as it would have been after enough Relics are collected
}

// ONLY HERE TO TEST VISUAL SIDE!
/*hInput = keyboard_check(vk_right) - keyboard_check(vk_left);
vInput = keyboard_check(vk_down) - keyboard_check(vk_up);

// Temp due to spd not existing (Needed for Debugging)
spd = 5;

if(hInput != 0 or vInput != 0){
	dir = point_direction(0,0,hInput,vInput);
	moveX = lengthdir_x(spd, dir);
	moveY = lengthdir_y(spd, dir);
	
	x += moveX;
	y += moveY;
}


