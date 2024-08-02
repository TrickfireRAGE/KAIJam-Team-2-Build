/// @description Not finished yet, basic code implemented.

if (x < preXLocation)
{
	image_xscale = 1;
	
	/*if (y > preYLocation)
	{
		image_angle = 45;
	}
	else if (y < preYLocation)
	{
		image_angle = 315;
	}
	else if (y == preYLocation)
	{
		image_angle = 0;
	}*/
}
else if (x > preXLocation)
{
	image_xscale = -1;
	
	/*if (y > preYLocation)
	{
		image_angle = 45;
	}
	else if (y < preYLocation)
	{
		image_angle = 315;
	}
	else if (y == preYLocation)
	{
		image_angle = 0;
	}*/
}


if (image_xscale != preImageScale) // To correct the angle if it switches (Doesn't work)
{
	//image_angle += 180;
}
else if (image_xscale == preImageScale)
{
	// Code below might be good for lighting in future as well as player visuals
	var _direction = point_direction(x, y, preXLocation, preYLocation);
	var _difference = angle_difference(_direction, image_angle);
	image_angle += _difference * 0.5; // Tweak to get smoother.
}

