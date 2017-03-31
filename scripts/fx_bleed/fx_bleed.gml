/// @function fx_bleed
/// @param target
/// @param amount
var target = argument0, amount = argument1, game = o_controller.game;
var ef_blood = part_type_create();
part_type_sprite(ef_blood, s_blood, false, true, true);
part_type_size(ef_blood, 1, 2.25, -0.01, 0);
part_type_color_mix(ef_blood, c_red, target.hp_col);
part_type_scale(ef_blood, choose(1, -1), choose(-1, 1));
part_type_speed(ef_blood, 1, 3, 0, 0);
part_type_direction(ef_blood, 0, 180, 0, 0);
part_type_gravity(ef_blood, random_range(0.15, 0.3), 270);
part_type_life(ef_blood, 8, 18);
part_particles_create(game.particles, target.x + target.xoffset, target.y + target.yoffset, ef_blood, amount * 3);

if (target.hp <= 0)
{
	var ef_skull = part_type_create();
	part_type_sprite(ef_skull, s_blood, false, true, true);
	part_type_size(ef_skull, 1, 2.25, -0.01, 0);
	part_type_color_mix(ef_skull, c_red, target.chi_col);
	part_type_scale(ef_skull, choose(1, -1), choose(-1, 1));
	part_type_speed(ef_skull, 1, 3, 0, 0);
	//part_type_life(ef_skull, 8, 18);
	part_particles_create(game.particles, target.x + target.xoffset, target.y + target.yoffset, ef_blood, amount * 3);
}