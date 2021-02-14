/// @desc HP bar
draw_sprite(spr_healthbar_bg,0,healthbar_x,healthbar_y);
draw_sprite_stretched(spr_healthbar,0,healthbar_x,healthbar_y,(current_HP/player_HP)*healthbar_width,healthbar_height);
draw_sprite(spr_healthbar_border,0,healthbar_x,healthbar_y)
