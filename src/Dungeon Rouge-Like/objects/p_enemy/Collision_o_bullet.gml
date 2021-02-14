/// @desc
total_HP -= o_player.player_damage;
flash = 4;

x = x -lengthdir_x(o_player.pushback, _enemy_facing);
y = y -lengthdir_y(o_player.pushback, _enemy_facing);

//speed = -2;
//show_debug_message("pushback")
//alarm[0] = 5;
with(other) {instance_destroy();}