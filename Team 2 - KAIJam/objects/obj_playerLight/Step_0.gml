// Point the light sprite towards the mouse

var pd = point_direction(x, y, mouse_x, mouse_y);
var dd = angle_difference(image_angle, pd);
image_angle -= min(abs(dd), 10) * sign(dd);

//set torch opacity
image_alpha = 0;

if(obj_player.y > 1000) and (obj_player.y < 4000){
	var lightDepth = obj_player.y/5000;
	image_alpha = clamp(lightDepth, 0, 0.8);
}
else if (obj_player.y >= 4000)
{
	image_alpha = 0.8;
}

obj_playerLight.x = obj_player.x;
obj_playerLight.y = obj_player.y;