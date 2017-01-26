/// @function do_damage
/// @param target
/// @param damage
/// @param crit
var target = argument0, damage = argument1, crit = argument2,
	game = o_controller.game/*, emitter = part_emitter_create(game.particles)*/,
	ef_blood = part_type_create();
target.hp -= damage;
target.shake = true;
if (target.hp <= 0)
	ds_stack_push(target.actions, [action_type.die, [target]]);
var gush = target.hp <= 0 || crit ? irandom(35) : (damage > 0 ? irandom(15) : 0);
// effect
part_type_sprite(ef_blood, s_blood, false, true, true);
part_type_size(ef_blood, 0.5, 1, -0.01, 1);
part_type_color_mix(ef_blood, c_red, target.hp_col);
part_type_scale(ef_blood, choose(1, -1), choose(-1, 1));
part_type_speed(ef_blood, 1, 3, 0, 0);
part_type_direction(ef_blood, 0, 180, 0, 0);
part_type_gravity(ef_blood, random_range(0.15, 0.3), 270);
part_type_life(ef_blood, 5, 15);
part_particles_create(game.particles, target.x + target.sprite_width / 2, target.y + target.sprite_height / 2, ef_blood, gush);