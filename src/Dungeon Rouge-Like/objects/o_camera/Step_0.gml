/// @description Insert description here

if (not instance_exists(target)) { exit; }

// Moves with player
x = lerp(x, target.x, 0.1);
y = lerp(y, target.y, 0.1);

// Clamped onto screen
x = clamp(x, width/2 + CELL_WIDTH, room_width-width/2 - CELL_WIDTH);
y = clamp(y, height/2 + CELL_HEIGHT, room_height-height/2 - CELL_HEIGHT);

// Set camera position
camera_set_view_pos(view_camera[0], x-width/2, y-height/2);