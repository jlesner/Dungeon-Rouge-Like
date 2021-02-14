function GetPathToPlayer(){
	if(instance_exists(o_player))
	{
		//var xx = (o_player.x div CELL_WIDTH)*CELL_WIDTH+CELL_WIDTH/2
		//var yy = (o_player.y div CELL_HEIGHT)*CELL_HEIGHT+CELL_HEIGHT/2
		
		var xx = o_player.x;
		var yy = o_player.y;
		
		if (mp_grid_path(o_level.grid_path, path, x, y, xx, yy, true)) 
		{
			path_start(path, 1, path_action_stop, false);
		}
	}
}