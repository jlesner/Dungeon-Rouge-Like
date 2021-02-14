#macro CELL_WIDTH 32
#macro CELL_HEIGHT 32
#macro FLOOR -5
#macro WALL -6
#macro VOID -7

#macro NORTH 1
#macro WEST 2
#macro EAST 4
#macro SOUTH 8

enum ENEMYSTATE
{
	IDLE,
	WANDER,
	ATTACK,
	CHASE,
	HURT,
	DIE,
	WAIT
}
