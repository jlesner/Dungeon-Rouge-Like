/// @description Insert description here

var _x_input = keyboard_check(vk_right) - keyboard_check(vk_left);
var _y_input = keyboard_check(vk_down) - keyboard_check(vk_up);

x_speed += _x_input * acceleration;
y_speed += _y_input * acceleration;

if (_x_input == 0)
{
	x_speed = lerp(x_speed, 0, 0.3);
}

if (_y_input == 0)
{
	y_speed = lerp(y_speed, 0, 0.3);
}

if (_x_input == 0 && _y_input == 0)
{
	image_speed = 0;
	image_index = 0;
}
else
{
	image_speed = 0.7;
}

x += x_speed;

if (x_speed > 0) // if we are colliding with the right
{
	if (GridPlaceMeeting(self, o_level.grid))
	{
		x = bbox_right&~(CELL_WIDTH-1);
		x -= bbox_right-x;
		x_speed = 0;
	}
}
else if (x_speed < 0) // if we are colliding with the left
{
	if (GridPlaceMeeting(self, o_level.grid))
	{
		x = bbox_left&~(CELL_WIDTH-1);
		x += CELL_WIDTH+x-bbox_left;
		x_speed = 0;
	}
}



y += y_speed;

if (y_speed > 0) // if we are colliding with the bottom/down
{
	if (GridPlaceMeeting(self, o_level.grid))
	{
		y = bbox_bottom&~(CELL_HEIGHT-1);
		y -= bbox_bottom-y;
		y_speed = 0;
	}
}
else if (y_speed < 0) // if we are colliding with the top/up
{
	if (GridPlaceMeeting(self, o_level.grid))
	{
		y = bbox_top&~(CELL_HEIGHT-1);
		y += CELL_HEIGHT+y-bbox_top;
		y_speed = 0;
	}
}