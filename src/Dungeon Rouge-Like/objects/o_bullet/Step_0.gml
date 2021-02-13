/// @desc Draw the bullet before it gets destroyed

x += lengthdir_x(spd, direction);
y += lengthdir_y(spd, direction);

var _collision = GridPlaceMeeting(self, o_level.grid);

if (_collision && image_index != 0)
{
	show_debug_message("hi!")
	while (GridPlaceMeeting(self, o_level.grid))
	{
		x -= lengthdir_x(1, direction);
		y -= lengthdir_y(1, direction);
	}
	spd = 0;
	instance_change(o_hit_spark, true);	
}