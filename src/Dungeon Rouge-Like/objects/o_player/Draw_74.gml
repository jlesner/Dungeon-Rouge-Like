/// @desc HP bar

//Progress
if(instance_exists(o_level))
{
	var _message = "";
	if(o_level.total_enemies <= 0) {_message = "Level Defeated! Proceed to EXIT"}
	else {_message = "Monsters Remaining: " + string(o_level.total_enemies)}
	draw_text_color(50,50,_message,c_white,c_white,c_white,c_white,1);
	//draw_text_color(50+text_offset,50+text_offset,_message,c_blue,c_blue,c_blue,c_blue,1);
}
//HP bar
draw_sprite_ext(spr_healthbar_bg,0,healthbar_x,healthbar_y,3,2,0,c_white,1);
draw_sprite_stretched(spr_healthbar,0,healthbar_x,healthbar_y,(current_HP/player_HP)*healthbar_width*3,healthbar_height*2);
draw_sprite_ext(spr_healthbar_border,0,healthbar_x,healthbar_y,3,2,0,c_white,1);