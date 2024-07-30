/// @description Randomly Changes Sprite

var _spriteNumber;
var _imageNumber;

sprite_index = spr_relic;

_spriteNumber = sprite_get_number(sprite_index);

_imageNumber = irandom_range(0, _spriteNumber);

image_index = _imageNumber;

relicValue = "NOT_SET";
collisionPlayer = false; // Used to see if the player has collided with them.
timerRegen = false; // Stays at false unless player dies.
counter = 0; // here to give enough frames to destory relic

var _yBeginning = 380;
var _yScoring = y - _yBeginning;
var _roomHeight = room_height - _yBeginning;

if (_yScoring <= (_roomHeight * 0.1))
{
	relicValue = 5;
}
else if (_yScoring <= (_roomHeight * 0.2))
{
	relicValue = 10;
}
else if (_yScoring <= (_roomHeight * 0.3))
{
	relicValue = 15;
}
else if (_yScoring <= (_roomHeight * 0.4))
{
	relicValue = 20;
}
else if (_yScoring <= (_roomHeight * 0.5))
{
	relicValue = 25;
}
else if (_yScoring <= (_roomHeight * 0.6))
{
	relicValue = 30;
}
else if (_yScoring <= (_roomHeight * 0.7))
{
	relicValue = 35;
}
else if (_yScoring <= (_roomHeight * 0.8))
{
	relicValue = 40;
}
else if (_yScoring <= (_roomHeight * 0.9))
{
	relicValue = 45;
}
else
{
	relicValue = 50;
}

