/// @description Insert description here
if (current_HP <= 0) 
{
	instance_change(o_player_dead,true);
	instance_destroy(o_wand);
	exit;
}
var _x_input = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _y_input = keyboard_check(ord("S")) - keyboard_check(ord("W"));

x_speed += _x_input * acceleration;
y_speed += _y_input * acceleration;

//reapply the fractions
x_speed += x_speed_fraction;
y_speed += y_speed_fraction;

//store and remove the fractions
x_speed_fraction = x_speed - (floor(abs(x_speed)) * sign(x_speed));
x_speed -= x_speed_fraction;
y_speed_fraction = y_speed - (floor(abs(y_speed)) * sign(y_speed));
y_speed -= y_speed_fraction;

// Cap the speed
var _speed = point_distance(0, 0, x_speed, y_speed);
var _direction = point_direction(0, 0, x_speed, y_speed);
if (_speed > max_speed)
{
	x_speed = lengthdir_x(max_speed, _direction);
	y_speed = lengthdir_y(max_speed, _direction);
}


// Add Friction
if (_x_input == 0)
{
	x_speed = lerp(x_speed, 0, 0.2);
}

if (_y_input == 0)
{
	y_speed = lerp(y_speed, 0, 0.2);
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
	image_xscale = 1;
	if (GridPlaceMeeting(self, o_level.grid))
	{
		x = bbox_right&~(CELL_WIDTH-1);
		x -= bbox_right-x;
		x_speed = 0;
	}
}
else if (x_speed < 0) // if we are colliding with the left
{
	image_xscale = -1;
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
