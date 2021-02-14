/// @description Draws character sprite and shadow

//draws shadow
draw_sprite_ext(spr_player_shadow, 0, x, y+1, 1, -0.75, 0, c_gray, 0.5);

draw_self(); //draws character over shadow

if (player_flash > 0)
{
	player_flash--;
	shader_set(sh_white);
	draw_self();
	shader_reset();
}