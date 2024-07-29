/// @description Randomly Changes Sprite

var _spriteNumber;
var _imageNumber;

sprite_index = scr_scrap;

_spriteNumber = sprite_get_number(sprite_index);

_imageNumber = irandom_range(0, _spriteNumber);

image_index = _imageNumber;



