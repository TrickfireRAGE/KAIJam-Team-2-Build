// handle player movement, including smoothing diagonals

hInput = keyboard_check(vk_right) - keyboard_check(vk_left);
vInput = keyboard_check(vk_down) - keyboard_check(vk_up);

// Temp due to spd not existing?
spd = 5;

if(hInput != 0 or vInput != 0){
	dir = point_direction(0,0,hInput,vInput);
	moveX = lengthdir_x(spd, dir);
	moveY = lengthdir_y(spd, dir);
	
	x += moveX;
	y += moveY;
}



// Camera Code

// This section needs to be using either a coded viewport
// or a pre-baked one, but it MUST have the player in the centre
// Current built in one doesn't follow the player with it in the centre
// Only moves when he hit the edge of the viewport.