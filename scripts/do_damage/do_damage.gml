/// @function do_damage
/// @param target
/// @param damage
/// @param crit
var target = argument0, damage = argument1, crit = argument2, game = o_controller.game, 
	tx = target.x + target.xoffset, ty = target.y + target.yoffset;
//
target.hp -= damage;
target.shake = damage > 0;
if (target.hp <= 0)
	ds_stack_push(target.actions, [action_type.die, [target]]);
//
var hit = instance_create_depth(tx, ty, target.depth - 1, o_float);
hit.image_blend = target.hp_col;
hit.image_xscale = crit ? 2 : 1;
hit.image_yscale = crit ? 2 : 1;
hit.text = damage == 0 ? choose("MISS", "WIFF", "DOH!", "?!?") : string(damage);
// effect
var ef_blood = part_type_create();
part_type_sprite(ef_blood, s_blood, false, true, true);
part_type_size(ef_blood, 1, 2.25, -0.01, 0);
part_type_color_mix(ef_blood, c_red, target.hp_col);
part_type_scale(ef_blood, choose(1, -1), choose(-1, 1));
part_type_speed(ef_blood, 1, 3, 0, 0);
part_type_direction(ef_blood, 0, 180, 0, 0);
part_type_gravity(ef_blood, random_range(0.15, 0.3), 270);
part_type_life(ef_blood, 8, 18);
var gush = target.hp <= 0 || crit ? 6 : 3;
part_particles_create(game.particles, tx, ty, ef_blood, irandom(damage) * gush);
//
if (target.hp <= 0)
{
	var ef_skull = part_type_create();
	part_type_sprite(ef_skull, s_actions, false, true, true);
	part_type_size(ef_skull, 1, 1.5, 0, 0);
	part_type_scale(ef_skull, choose(1, -1), 1);
	part_type_speed(ef_skull, 0.25, 0.75, 0, 0);
	part_type_direction(ef_skull, 0, 180, 0, 0);
	part_type_alpha2(ef_skull, 1, 0);
	part_type_gravity(ef_skull, random_range(0.025, 0.075), 90);
	part_type_life(ef_skull, 20, 30);
	part_particles_create(game.particles, tx, ty, ef_skull, 1);
}