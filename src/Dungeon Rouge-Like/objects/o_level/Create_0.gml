/// @desc 
randomize()

// Get the tile layer map id
var _wall_map_id = layer_tilemap_get_id("WallTiles");

// Set up the grid
width = room_width div CELL_WIDTH;
height = room_height div CELL_HEIGHT;
grid = ds_grid_create(width, height);
ds_grid_set_region(grid, 0, 0, width, height, VOID);

// Create the controller
var _controller_x = width div 2;
var _controller_y = height div 2;
var _controller_direction = irandom(3);
var _steps = 400;

var _direction_change_odds = 1;

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

// Placing tiles

for(var _y = 1; _y < height - 1; _y++) 
{
	for(var _x = 1; _x < width - 1; _x++)
	{
		if (grid[# _x, _y] == FLOOR) 
		{
			tilemap_set(_wall_map_id, 1, _x, _y)
		}
	}
}

