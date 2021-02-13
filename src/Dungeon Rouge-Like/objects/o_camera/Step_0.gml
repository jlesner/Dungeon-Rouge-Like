/// @description Insert description here

if (not instance_exists(target)) { exit; }

// Moves with player
x = lerp(x, target.x, 0.1);
y = lerp(y, target.y, 0.1);

// Clamped onto screen
x = clamp(x, width/2 + CELL_WIDTH + buff, room_width-width/2 - CELL_WIDTH - buff);
y = clamp(y, height/2 + CELL_HEIGHT + buff, room_height-height/2 - CELL_HEIGHT - buff);

// Screen shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1/shake_length) * shake_magnitude)); // shake_remain can never below 0


// Set camera position
camera_set_view_pos(view_camera[0], x-width/2, y-height/2);