/// @description ???

draw_self();

draw_sprite(spr_boatWaves, 0, x, y);

if (boatTimer > 200)
{
	boatTimer = 0;
}
else if (boatTimer > 100)
{
	draw_sprite(spr_boatForth1, 0, x, y);
}
else if (boatTimer >= 0)
{
	draw_sprite(spr_boatForth2, 0, x, y);
}

boatTimer++;