/// @desc
current_HP -= other.enemy_damage;

with (other)
{
	x = x -lengthdir_x(o_player.pushback, _enemy_facing);
    y = y -lengthdir_y(o_player.pushback, _enemy_facing);
}

x = x +lengthdir_x(6, other._enemy_facing);
y = y +lengthdir_y(6, other._enemy_facing);

player_flash = 4;