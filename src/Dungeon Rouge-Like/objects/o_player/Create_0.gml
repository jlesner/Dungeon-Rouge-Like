/// @description Initialize

x_speed = 0;
y_speed = 0;

max_speed = 2;
acceleration = 0.5;

x_speed_fraction = 0;
y_speed_fraction = 0;

current_HP = player_HP;

player_flash = 0;

healthbar_width = 100;
healthbar_height = 24;
healthbar_x = (display_get_gui_width()/2) - (healthbar_width/2); 
healthbar_y = display_get_gui_height() - (2*healthbar_height)

// Creates camera
if(!instance_exists(o_camera))
{
	instance_create_layer(x,y, "Instances", o_camera);
}