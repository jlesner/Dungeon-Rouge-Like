///// @description Insert description here

//if (not surface_exists(shadow_surface))
//{
//	// Create the shadows on the walls
//	shadow_surface = surface_create(room_width, room_height);
//	surface_set_target(shadow_surface);
//	draw_clear_alpha(c_black, 0);
	
//	for (var _y=1; y < height -1; _y++)
//	{
//		show_debug_message("1st for")
//		for (var _x=1; _x < width -1; _x++)
//		{
//			show_debug_message("2nd for")
//			var _isFloor = grid[# _x, _y] == FLOOR;
//			var _aboveWall = grid[# _x, _y-1] == VOID;
			
//			if (_isFloor && _aboveWall) 
//			{
//				show_debug_message("hi!")
//				draw_sprite_ext(spr_shadow, 0, _x*CELL_WIDTH, _y*CELL_HEIGHT, 1, 1, 0, c_white, 0.5);
//			}
//		}
//	}
	
//	surface_reset_target()
//	show_debug_message("Surface Created")
	
//}

//draw_surface(shadow_surface, 0, 0);
