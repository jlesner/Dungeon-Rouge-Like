/// @description First step every frame

// places wand in player's arm
x = o_player.x -2;
y = o_player.y - 4;

// points wand towards mouse
image_angle = point_direction(x, y, mouse_x, mouse_y);

firing_delay -= 1;
recoil = max(0, recoil -1); // returns the biggest value (no negative numbers)
if (mouse_check_button(mb_left) && (firing_delay < 0))
{
	recoil = 2.5;
	firing_delay = 20;
	ScreenShake(0.75, 5);
	with (instance_create_layer(x,y,"Bullets", o_bullet)) // create a bullet
	{
		spd = 3; // constant speed
		direction = other.image_angle + random_range(-2.5,2.5); // other --> properties of the gun
		image_angle = direction;
	}
}

x = x -lengthdir_x(recoil, image_angle);
y = y -lengthdir_y(recoil, image_angle);

//image flip
if (image_angle > 90 && image_angle < 270)
{
	image_yscale = -1;
}
else
{
	image_yscale = 1;
}