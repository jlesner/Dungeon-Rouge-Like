/// @desc Draw shadow
draw_sprite_ext(spr_player_shadow, 0, x, y+1, 1, -0.75, 0, c_gray, 0.5);

draw_self();
if (flash > 0)
{
	flash--;
	shader_set(sh_white);
	draw_self();
	shader_reset();
}