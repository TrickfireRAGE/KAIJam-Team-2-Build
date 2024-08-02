/// @description 

switch(room)
{
	case(rm_start):
		//
		break;
	case(rm_main):
		// Variables for all
		var _displaySize = window_get_height();
		var _displayScaling = (_displaySize / 1080) * 3;
		
		// Variables for Timer
		var _xPositionTimer = 0;
		var _yPositionTimer = 0;
		var _textColour = c_white; // Subject to change
		var _timerAlpha = 1;
		var _timerString = string_replace_all(string_format(global.gameTimerMinutes, 2, 0) + ":" + string_format(global.gameTimerSeconds, 2, 0)," ", 0);
		
		// Variables for Score
		var _minimumVisibleYPosition = 600;
		var _xPosition = _displaySize / 2;
		var _yPosition = 0;
		var _scoreString = "Score: " + string(score);
		
		// Variables for Relics
		var _xPositionRelic = _displaySize;
		var _yPositionRelicAmount = 0;
		var _yPositionRelicCollected = 60 * (_displaySize / 1080);
		var _relicString = string(global.scoreRelic) + " / " + string(global.totalRelics);
		var _notCollectedString = "EMPTY";
		var _collectedString = "FULL";
		
		// Visual Code
		// Alignment (Used to keep in top left of window)
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		
		// Timer UI
		draw_text_transformed_colour(_xPositionTimer, _yPositionTimer,
			_timerString, _displayScaling,
			_displayScaling, 0, _textColour,
			_textColour, _textColour, _textColour,
			_timerAlpha);
			
		if (obj_player.y <= _minimumVisibleYPosition)
		{
			draw_set_halign(fa_center);
			var _textAlpha = "NOT_SET"; // Will be set below
			
			// Alpha Code (There is probably a better way of doing this)
			if (obj_player.y <= 450)
			{
				var _textAlpha = 1;
			}
			else if (obj_player.y <= 500)
			{
				var _textAlpha = 0.8;
			}
			else if (obj_player.y <= 525)
			{
				var _textAlpha = 0.6;
			}
			else if (obj_player.y <= 550)
			{
				var _textAlpha = 0.4;
			}
			else if (obj_player.y <= 575)
			{
				var _textAlpha = 0.2;
			}
			else if (obj_player.y <= _minimumVisibleYPosition)
			{
				var _textAlpha = 0;
			}
			
			
			// Score Text UI (Recode this to work depending on what level they are at.
			draw_text_transformed_colour(_xPosition, _yPosition,
				_scoreString, _displayScaling,
				_displayScaling, 0, _textColour,
				_textColour, _textColour, _textColour,
				_textAlpha);
		}
		
		// Relic UI
		draw_set_halign(fa_right);
		
		draw_text_transformed_colour(_xPositionRelic, _yPositionRelicAmount,
			_relicString, _displayScaling,
			_displayScaling, 0, _textColour,
			_textColour, _textColour, _textColour,
			_timerAlpha);
		
		switch (global.playerRelicCollected)
		{
			case(true):
				draw_text_transformed_colour(_xPositionRelic, _yPositionRelicCollected,
					_collectedString, _displayScaling,
					_displayScaling, 0, _textColour,
					_textColour, _textColour, _textColour,
					_timerAlpha);
				break;
			case(false):
				draw_text_transformed_colour(_xPositionRelic, _yPositionRelicCollected,
					_notCollectedString, _displayScaling,
					_displayScaling, 0, _textColour,
					_textColour, _textColour, _textColour,
					_timerAlpha);
				break;
		}
		
		break;
	case(rm_end):
		//
		
		break;
}


