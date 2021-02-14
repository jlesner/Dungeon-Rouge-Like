/// @desc
if instance_exists(o_player)
{
	_enemy_facing = point_direction(x,y,o_player.x,o_player.y)
	if (_enemy_facing > 90 && _enemy_facing < 270)
	{
		image_xscale = -1;
	}
	else
	{
		image_xscale = 1;
	}
	
	if (point_distance(x,y,o_player.x,o_player.y) < enemy_aggro_radius)
	{
		GetPathToPlayer(enemy_speed);
	}
	
}

if(total_HP <= 0)
{
	instance_change(o_dead,true);
	exit;
}

