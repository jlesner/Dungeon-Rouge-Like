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

// Create the controller
var _controller_x = width div 2;
var _controller_y = height div 2;
var _controller_direction = irandom(3);
var _steps = 400;

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
		else // IF this is floor
		{
			// What are possible exits?
			var _exit_x = _x * CELL_WIDTH;
			var _exit_y = _y * CELL_HEIGHT;
			var pos = [_player_start_x,_player_start_y];
			if (point_distance(_exit_x,_exit_y,_player_start_x,_player_start_y) > 200)
			{
				pos[0] = _exit_x;
				pos[1] = _exit_y;
				ds_list_add(_possible_exits,pos);
				show_debug_message(string(pos))
			}
		}
	}
}

ds_list_add(_possible_exits,[_player_start_x - CELL_WIDTH/2,_player_start_y - CELL_HEIGHT/2]);

show_debug_message("ALL POSSIBLE EXITS");
for(var i = 0; i < ds_list_size(_possible_exits); i++)
{
	show_debug_message(string(ds_list_find_value(_possible_exits,i)));
}

var _chosen_pos = ds_list_find_value(_possible_exits,irandom(ds_list_size(_possible_exits)));

while(_chosen_pos == undefined) 
{
	_chosen_pos = ds_list_find_value(_possible_exits,irandom(ds_list_size(_possible_exits)));
}

show_debug_message("Exit created at: " + string(_chosen_pos));
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
			

		}
	}
}

