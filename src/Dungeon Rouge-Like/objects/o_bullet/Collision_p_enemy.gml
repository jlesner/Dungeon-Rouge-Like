/// @desc Collision w/ Enemy
with(other)
{
	total_HP -= o_player.player_damage;
	flash = 4;
}

instance_destroy();