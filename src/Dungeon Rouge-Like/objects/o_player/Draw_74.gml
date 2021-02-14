/// @desc HP bar

//Progress
if(instance_exists(o_level))
{
	draw_text(50,50,"Monsters Remaining: " + string(o_level.total_enemies));
}
//HP bar
draw_sprite_ext(spr_healthbar_bg,0,healthbar_x,healthbar_y,3,2,0,c_white,1);
draw_sprite_stretched(spr_healthbar,0,healthbar_x,healthbar_y,(current_HP/player_HP)*healthbar_width*3,healthbar_height*2);
draw_sprite_ext(spr_healthbar_border,0,healthbar_x,healthbar_y,3,2,0,c_white,1);