// Updated Player Movement

leftInput = keyboard_check(vk_left) or keyboard_check(ord("A"));
rightInput = keyboard_check(vk_right) or keyboard_check(ord("D"));
upInput = keyboard_check(vk_up) or keyboard_check(ord("W"));
downInput = keyboard_check(vk_down) or keyboard_check(ord("S"));

xSpeed = rightInput - leftInput;
ySpeed = downInput - upInput;

var _calculation = preDirection;
var _direction = "NOT_SET";

if (xSpeed > 0 and ySpeed > 0)
{
	if (decBool == false)
	{
		_direction = 315;
	}
	image_angle = 315;
	image_xscale = 1;
}
else if (xSpeed > 0 and ySpeed < 0)
{
	if (decBool == false)
	{
		_direction = 45;
	}
	image_angle = 45;
	image_xscale = 1;
}
else if (xSpeed < 0 and ySpeed > 0)
{
	if (decBool == false)
	{
		_direction = 225;
	}
	image_angle = 45;
	image_xscale = -1;
}
else if (xSpeed < 0 and ySpeed < 0)
{
	if (decBool == false)
	{
		_direction = 135;
	}
	image_angle = 315;
	image_xscale = -1
}
else if (ySpeed > 0)
{
	if (decBool == false)
	{
		_direction = 270;
	}
	image_angle = 270;
	image_xscale = 1;
}
else if (ySpeed < 0)
{
	if (decBool == false)
	{
		_direction = 90;
	}
	image_angle = 90;
	image_xscale = 1;

}
else if (xSpeed > 0)
{
	if (decBool == false)
	{
		_direction = 0;
	}
	image_angle = 0;
	image_xscale = 1;
}
else if (xSpeed < 0)
{
	if (decBool == false)
	{
		_direction = 180;
	}
	image_angle = 0;
	image_xscale = -1;
}


if (xSpeed != 0 or ySpeed != 0)
{
	if (decBool == false)
	{
		if (_direction != preDirection)
		{
			
			_calculation = angle_difference(_direction, _calculation);
			
			if (_calculation == -45)
			{
				direction = _direction;
				motion_add(direction, stepSpeed);
			}
			else if (_calculation == 45)
			{
				direction = _direction;
				motion_add(direction, stepSpeed);
			}
			else if (_calculation == 90)
			{
				direction = _direction;
				motion_add(direction, stepSpeed);
			}
			else if (_calculation == -90)
			{
				direction = _direction;
				motion_add(direction, stepSpeed);
			}
			else
			{
				if (speed == 0)
				{
					direction = _direction;
					motion_add(direction, stepSpeed);
				}
				else
				{
					decBool = true; // To tell the game to do deceleration
					if (speed < 0)
					{
						speed = 0;
					}
				}
			}
		}
		else if (_direction == preDirection)
		{
			direction = _direction;
			motion_add(direction, stepSpeed);
		}
	}
	else if (decBool == true)
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

if (y <= 300)
{
	var _surfaceMaxSpeed = 1;
	if (speed > _surfaceMaxSpeed)
	{
		speed = _surfaceMaxSpeed;
	}

}
else 
{
	if (speed > maxSpeed)
	{
		speed = maxSpeed;
	}
}
	
	
// Collision Code

if (place_meeting(x, y, obj_solid) == true)
{
	var _speed = speed;
	speed = 0;
	if (_speed == 0)
	{
		_speed = 1;
	}
	
	switch(xSpeed)
	{
		case(1):
			x -= _speed;
			break;
		case(-1):
			x += _speed;
			break;
	}
	switch (ySpeed)
	{
		case(1):
			y -= _speed;
			break;
		case(-1):
			y += _speed;
			break;
	}
}

if (place_meeting(x, y, obj_rockParent) == true)
{
	var _speed = speed;
	speed = 0;
	
	if (_speed == 0)
	{
		_speed = 1;
	}
	
	switch(xSpeed)
	{
		case(1):
			x -= _speed;
			break;
		case(-1):
			x += _speed;
			break;
	}
	switch (ySpeed)
	{
		case(1):
			y -= _speed;
			break;
		case(-1):
			y += _speed;
			break;
	}
}
	

// Particle Basic Code (will need to be updated once movement is updated)
// Uses all 8 directions

var _distance = sprite_width / 2.5;

#region Particle Direction

if (y > yParticleLimit)
{
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
				x - _distance, y + _distance, // Swapped due to Image_xScale
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
				x - _distance, y - _distance, // Swapped due to Image_xScale
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
				x - _distance, y, // Swapped due to image_xscale
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

if (y <= 250) // To get the Parallaxing to work
{
	camera_set_view_pos(view_camera[0], 
		cameraX, cameraY);
}
else if (y <= 350)
{
	parallaxYCamera = y - 250;
	cameraY = (y - halfCameraHeight) + parallaxYCamera;
	camera_set_view_pos(view_camera[0], 
		cameraX, cameraY);
	
}
else if (y <= 450)
{
	var _yThingy = y - 350;
	cameraY = (y - halfCameraHeight) + (parallaxYCamera - _yThingy);
	camera_set_view_pos(view_camera[0], 
		cameraX, cameraY);
}
else
{
	camera_set_view_pos(view_camera[0], 
		cameraX, cameraY);

}

// Outside of Room Code (Slow Down for Y when going above underwater)

playerWidthHalf = (sprite_width / 2) - 5;

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

if (y < ySurfaceLimit)
{
	y = ySurfaceLimit;
}