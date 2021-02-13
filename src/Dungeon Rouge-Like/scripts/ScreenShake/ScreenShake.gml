/// @arg Magnitude sets the strength
/// @arg Frames sets the length

function ScreenShake(_manigtude, _frames)
{

with (o_camera)
{
	if (_manigtude > shake_remain)
	{
		shake_magnitude = _manigtude;
		shake_remain = _manigtude;
		shake_length = _frames;
	}
}
}