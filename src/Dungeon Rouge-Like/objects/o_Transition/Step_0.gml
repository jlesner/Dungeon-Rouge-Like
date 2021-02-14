/// @desc Progress the transition

if (mode != TRANS_MODE.OFF)
{
	if (mode == TRANS_MODE.INTRO) // Opening
	{
		percent = max(0, percent - max((percent/10), 0.005)); // Fast to  slow
	}
	else // Closing
	{
		percent = min(1.5, percent + max(((1.5 - percent)/ 10), 0.005));
	}
	
	if (percent == 1.5 || percent == 0) 
	{
		switch (mode)
		{
		case TRANS_MODE.INTRO:
			{
				mode = TRANS_MODE.OFF;
				break;
			}
		case TRANS_MODE.NEXT:
			{
				room_restart();
				mode = TRANS_MODE.INTRO;
				break;
			}
		case TRANS_MODE.RESTART:
			{
				game_restart();
				break;
			}
		case TRANS_MODE.END:
			{
				mode = TRANS_MODE.INTRO;
				room_goto(rm_2);
				break;
			}
		case TRANS_MODE.START:
			{
				mode = TRANS_MODE.INTRO;
				show_debug_message(room_exists(rm_1));
				room_goto(rm_1);
				break;
			}
		}
	}
}
