/// @description Create camera

target = o_player;
width = camera_get_view_width(view_camera[0]);
height = camera_get_view_height(view_camera[0]);

// Screen shake:

shake_length = 0; //how long
shake_magnitude = 0; //how strong 
shake_remain = 0; // how much we have left
buff = 16 // buffer