/// @description Visual Code

// Body Variables


// Body Animation


var _playerProximity = point_distance(x, y, obj_player.x, obj_player.y);

if (_playerProximity < 100)
{
	image_speed = animationSpeed * 3;
}
else if (_playerProximity < 300)
{
	image_speed = animationSpeed * 2;
}
else if (_playerProximity >= 500)
{
	image_speed = animationSpeed;
}


draw_sprite_ext(spr_monsterBody, image_index, 
	x, y, 
	image_xscale, image_yscale, 
	image_angle, c_white, 
	1);
	


// Main Body Code

draw_self(); // To ensure the monster is visible
