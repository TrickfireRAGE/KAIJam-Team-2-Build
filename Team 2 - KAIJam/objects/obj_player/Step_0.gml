// Updated Player Movement

leftInput = keyboard_check(vk_left) or keyboard_check(ord("A"));
rightInput = keyboard_check(vk_right) or keyboard_check(ord("D"));
upInput = keyboard_check(vk_up) or keyboard_check(ord("W"));
downInput = keyboard_check(vk_down) or keyboard_check(ord("S"));

xSpeed = rightInput - leftInput;
ySpeed = downInput - upInput;

var _calculation = preDirection;

if (xSpeed > 0 and ySpeed > 0)
{
	direction = 315;
}
else if (xSpeed > 0 and ySpeed < 0)
{
	direction = 45;
}
else if (xSpeed < 0 and ySpeed > 0)
{
	direction = 225;
}
else if (xSpeed < 0 and ySpeed < 0)
{
	direction = 135;
}
else if (ySpeed > 0)
{
	direction = 270;
}
else if (ySpeed < 0)
{
	direction = 90;

}
else if (xSpeed > 0)
{
	direction = 0;
}
else if (xSpeed < 0)
{
	direction = 180;
}


if (xSpeed != 0 or ySpeed != 0)
{
	if (direction != preDirection)
	{
		_calculation -= direction;
		
		if (_calculation >= -45 or 45)
		{
			motion_add(direction, stepSpeed);
		}
		else
		{
			if (speed == 0)
			{
				motion_add(direction, stepSpeed);
			}
			else
			{
				if (speed >= 0)
				{
					speed -= decSpeed;
				}
				else if (speed < 0)
				{
					speed = 0;
				}
			}
		}
	}
	else if (direction == preDirection)
	{
		motion_add(direction, stepSpeed);
	}
}
else
{
	if (speed > 0)
	{
		speed -= decSpeed;
	}
	else if (speed < 0)
	{
		speed = 0;
	}
}

if (speed > maxSpeed)
{
	speed = maxSpeed;
}
	
// Particle Basic Code (will need to be updated once movement is updated)
// Uses all 8 directions

var _distance = sprite_width / 2;

#region Particle Direction

if (xSpeed > 0 and ySpeed > 0)
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
else if (xSpeed > 0 and ySpeed < 0)
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
else if (xSpeed < 0 and ySpeed > 0)
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
else if (xSpeed < 0 and ySpeed < 0)
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
else if (xSpeed > 0)
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
else if (xSpeed < 0)
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
else if (ySpeed < 0)
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
else if (ySpeed > 0)
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