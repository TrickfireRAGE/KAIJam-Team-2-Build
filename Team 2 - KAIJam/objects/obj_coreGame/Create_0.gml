/// @description ???

var _displaySize = display_get_height() / 4;
_displaySize *= 3;

window_set_size(_displaySize, _displaySize);
surface_resize(application_surface, _displaySize, _displaySize);

