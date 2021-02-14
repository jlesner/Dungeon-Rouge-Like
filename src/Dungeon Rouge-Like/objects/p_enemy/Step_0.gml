/// @desc
if(total_HP <= 0)
{
	instance_destroy();
	exit;
}

if (point_distance(x,y,o_player.x,o_player.y) < enemy_aggro_radius)
{
	GetPathToPlayer(enemy_speed);
}