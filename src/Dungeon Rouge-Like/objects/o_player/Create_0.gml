/// @description Initialize

x_speed = 0;
y_speed = 0;

max_speed = 2;
acceleration = 0.5;

x_speed_fraction = 0;
y_speed_fraction = 0;

current_HP = player_HP;

player_flash = 0;

// Creates camera
if(!instance_exists(o_camera))
{
	instance_create_layer(x,y, "Instances", o_camera);
}