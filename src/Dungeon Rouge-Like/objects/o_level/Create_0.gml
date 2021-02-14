/// @desc Initialize level

randomize()

shadow_surface = noone;

// Get the tile layer map id
var _wall_map_id = layer_tilemap_get_id("WallTiles");

// Set up the grid
width = room_width div CELL_WIDTH;
height = room_height div CELL_HEIGHT;
grid = ds_grid_create(width, height);
ds_grid_set_region(grid, 0, 0, width -1, height -1, VOID);

// Create the pathfinding grid
grid_path = mp_grid_create(0, 0, width, height, CELL_WIDTH, CELL_HEIGHT);


// Create the controller
var _controller_x = width div 2;
var _controller_y = height div 2;
var _controller_direction = irandom(3);
var _steps = 400 * level_size_multiplier;

// Create Player
var _player_start_x = _controller_x * CELL_WIDTH + CELL_WIDTH/2;
var _player_start_y  = _controller_y * CELL_HEIGHT + CELL_HEIGHT/2;
//instance_create_layer(_player_start_x, _player_start_y, "Instances", o_player);
with(o_player)
{
	x = _player_start_x;
	y = _player_start_y;
}

// Exit variables

var _possible_exits = ds_list_create();

// Enemy variable 

var _total_enemies = 0;

var _direction_change_odds = 1;

// Generating map -- determining what is floor
repeat (_steps) 
{
	grid[# _controller_x, _controller_y] = FLOOR;
	// Randomize direction
	if (irandom(_direction_change_odds) == _direction_change_odds)
	{
		_controller_direction = irandom(3);
	}
	
	// Move the controller
	var _x_direction = lengthdir_x(1, _controller_direction * 90);
	var _y_direction = lengthdir_y(1, _controller_direction * 90);
	_controller_x += _x_direction;
	_controller_y += _y_direction;
	
	// Make sure we don't go out-of-bounds of grid
	if (_controller_x < 2 || _controller_x >= width - 2) 
	{
		_controller_x += -_x_direction * 2;
	}
	
	if (_controller_y < 2 || _controller_y >= height - 2) 
	{
		_controller_y += -_y_direction * 2;
	}
}

// Removing single walls
for(var _y = 1; _y < height - 1; _y++) 
{
	for(var _x = 1; _x < width - 1; _x++)
	{
		if (grid[# _x, _y] != FLOOR) 
		{
			var _north_tile = grid[# _x, _y - 1] == VOID;
			var _west_tile = grid[# _x - 1, _y] == VOID;
			var _south_tile = grid[# _x, _y + 1] == VOID;
			var _east_tile = grid[# _x + 1, _y] == VOID;
			
			var _tile_index = NORTH*_north_tile + WEST*_west_tile + EAST*_east_tile + SOUTH*_south_tile + 1;
			if (_tile_index == 1) // Walls that are completly surrounded by floor are turned into floor
			{
				grid[# _x, _y] = FLOOR
			}
		}
	}
}

// Spawing entities
for(var _y = 1; _y < height - 1; _y++) 
{
	for(var _x = 1; _x < width - 1; _x++)
	{
		if(grid[# _x, _y] == FLOOR) // IF this is floor
		{
			// What are possible exits?
			var xx = _x * CELL_WIDTH;
			var yy = _y * CELL_HEIGHT;
			var pos = [_player_start_x,_player_start_y];
			if (point_distance(xx,yy,_player_start_x,_player_start_y) > 200)
			{
				pos[0] = xx;
				pos[1] = yy;
				ds_list_add(_possible_exits,pos);
				//show_debug_message(string(pos))
			}
			
			// Spawing Enemies
			xx = _x * CELL_WIDTH + CELL_WIDTH/2;
			yy = _y * CELL_HEIGHT + CELL_HEIGHT/2;
			if (point_distance(xx,yy,_player_start_x,_player_start_y) > 80) 
			   && (irandom(enemy_spawn_odds) == enemy_spawn_odds)
			   && (_total_enemies < enemy_spawn_cap)
			{
				instance_create_layer(xx, yy, "Enemies", o_slime);
				_total_enemies++;
			}
		}
	}
}

// Adding player position as a possible exit position 
ds_list_add(_possible_exits,[_player_start_x - CELL_WIDTH/2,_player_start_y - CELL_HEIGHT/2]);
var _chosen_pos = ds_list_find_value(_possible_exits,irandom(ds_list_size(_possible_exits)));
while(_chosen_pos == undefined) // If position is undefined then choose a different one until not 
{
	_chosen_pos = ds_list_find_value(_possible_exits,irandom(ds_list_size(_possible_exits)));
}
instance_create_layer(_chosen_pos[0], _chosen_pos[1], "Instances", o_levelexit)


// Placing tiles
for(var _y = 1; _y < height - 1; _y++) 
{
	for(var _x = 1; _x < width - 1; _x++)
	{
		if (grid[# _x, _y] != FLOOR) 
		{
			var _north_tile = grid[# _x, _y - 1] == VOID;
			var _west_tile = grid[# _x - 1, _y] == VOID;
			var _south_tile = grid[# _x, _y + 1] == VOID;
			var _east_tile = grid[# _x + 1, _y] == VOID;
			
			var _tile_index = NORTH*_north_tile + WEST*_west_tile + EAST*_east_tile + SOUTH*_south_tile + 1;
			tilemap_set(_wall_map_id, _tile_index, _x, _y)
			
			mp_grid_add_cell(grid_path, _x, _y);
		}
	}
}

