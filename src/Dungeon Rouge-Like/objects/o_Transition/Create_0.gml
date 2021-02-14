/// @desc Size variables and mod setup

audio_play_sound(snd_bg_music,2,true);

w = display_get_gui_width();
h = display_get_gui_height();

h_half = h * 0.5;

enum TRANS_MODE
{
	OFF,
	NEXT,
	END,
	RESTART,
	INTRO
}

mode = TRANS_MODE.INTRO;
percent = 1; // 1 - 0
target = room; // For GOTO