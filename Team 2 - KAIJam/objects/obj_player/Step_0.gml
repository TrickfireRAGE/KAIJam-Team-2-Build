// Handle player movement, including smoothing diagonals

hInput = keyboard_check(vk_right) - keyboard_check(vk_left);
vInput = keyboard_check(vk_down) - keyboard_check(vk_up);

// Temp due to spd not existing (Needed for Debugging)
spd = 4; // Original 0.5
spdFinal = 0;
spdMax = 5;
lastMoveX = 0;
lastMoveY = 0;
moveX = 0;
moveY = 0;

if(hInput != 0 or vInput != 0){
	
	if(lastMoveX != hInput){
		lastMoveX = hInput;
		spdFinal = 0;
	}
	
	if(lastMoveY != vInput){
		lastMoveY = vInput;
		spdFinal = 0;
	}
	
	if(spdFinal <= spdMax){
		spdFinal += spd;
	}
	
	
	//dir = point_direction(0,0,hInput,vInput);
	//moveX = lengthdir_x(spd, dir);
	//moveY = lengthdir_y(spd, dir);
	
}
else{
	
	if(spdFinal > 0){
		spdFinal -= spd;
	}
	
}

if(spdFinal < spd){
	
	spdFinal = 0;
	lastMoveX = 0;
	lastMoveY = 0;
	
}

moveX = spdFinal * lastMoveX;
moveY = spdFinal * lastMoveY;

x += moveX;
y += moveY;
	
// Particle Basic Code (will need to be updated once movement is updated)
// Uses all 8 directions

var _distance = sprite_width / 2;

#region Particle Direction

if (hInput > 0 and vInput > 0)
{
	if (particleTimer <= 0)
	{
		part_particles_create(obj_particleSystem.particleSystem, 
			x - _distance, y - _distance, 
			obj_particleSystem.particleTypeBubbles, 
			1);
		particleTimer = particleTime;
	}
	particleTimer--;
}
else if (hInput > 0 and vInput < 0)
{
	if (particleTimer <= 0)
	{
		part_particles_create(obj_particleSystem.particleSystem, 
			x - _distance, y + _distance, 
			obj_particleSystem.particleTypeBubbles, 
			1);
		particleTimer = particleTime;
	}
	particleTimer--;
}
else if (hInput < 0 and vInput > 0)
{
	if (particleTimer <= 0)
	{
		part_particles_create(obj_particleSystem.particleSystem, 
			x + _distance, y - _distance, 
			obj_particleSystem.particleTypeBubbles, 
			1);
		particleTimer = particleTime;
	}
	particleTimer--;
}
else if (hInput < 0 and vInput < 0)
{
	if (particleTimer <= 0)
	{
		part_particles_create(obj_particleSystem.particleSystem, 
			x + _distance, y + _distance, 
			obj_particleSystem.particleTypeBubbles, 
			1);
		particleTimer = particleTime;
	}
	particleTimer--;
}
else if (hInput > 0)
{
	if (particleTimer <= 0)
	{
		part_particles_create(obj_particleSystem.particleSystem, 
			x - _distance, y, 
			obj_particleSystem.particleTypeBubbles, 
			1);
		particleTimer = particleTime;
	}
	particleTimer--;
}
else if (hInput < 0)
{
	if (particleTimer <= 0)
	{
		part_particles_create(obj_particleSystem.particleSystem, 
			x + _distance, y, 
			obj_particleSystem.particleTypeBubbles, 
			1);
		particleTimer = particleTime;
	}
	particleTimer--;
}
else if (vInput < 0)
{
	if (particleTimer <= 0)
	{
		part_particles_create(obj_particleSystem.particleSystem, 
			x, y + _distance, 
			obj_particleSystem.particleTypeBubbles, 
			1);
		particleTimer = particleTime;
	}
	particleTimer--;
}
else if (vInput > 0)
{
	if (particleTimer <= 0)
	{
		part_particles_create(obj_particleSystem.particleSystem, 
			x, y - _distance, 
			obj_particleSystem.particleTypeBubbles, 
			1);
		particleTimer = particleTime;
	}
	particleTimer--;
}

#endregion

// Camera Code

halfCameraWidth = camera_get_view_width(view_camera[0]) / 2;
halfCameraHeight = camera_get_view_height(view_camera[0]) / 2;

minimumCameraX = 0;
minimumCameraY = 0;
maximumCameraX = room_width - camera_get_view_width(view_camera[0]);
maximumCameraY = room_height - camera_get_view_height(view_camera[0]);

cameraX = x - halfCameraWidth;
cameraY = y - halfCameraHeight;

cameraX = clamp(cameraX, minimumCameraX, maximumCameraX);
cameraY = clamp(cameraY, minimumCameraY, maximumCameraY);

camera_set_view_pos(view_camera[0], 
	cameraX, cameraY);


// Outside of Room Code (Slow Down for Y when going above underwater)

playerWidthHalf = (sprite_width / 2) - 5;

var _ySurfaceLimit = 290; // See if we can do a physics based thing. 

// X
if (x > (room_width - playerWidthHalf))
{
	x = room_width - playerWidthHalf;
}
else if (x < playerWidthHalf)
{
	x = playerWidthHalf;
}

// Y

if (y < _ySurfaceLimit)
{
	y = _ySurfaceLimit;
}