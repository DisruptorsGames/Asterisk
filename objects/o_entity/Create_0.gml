/// @description Init
event_inherited();

portrait = noone;
//
hp = 0;
hp_max = 0;
chi = 0;
chi_max = 10;
hp_col = merge_color(c_red, make_color_elm(), random_range(0.5, 0.75));
chi_col = merge_color(c_white, make_color_elm(), random_range(0.5, 0.75));
boss = false;
dead = false;
initiative = 0;
priority = 0;
damage = 0;
range = 1;
moves = 0;
steps = moves;
//
npc = true;
passive = false;
agro = false;
think = seconds(1);
target = noone;
//
path = path_add();
inventory_item = -1;
//
actions = ds_stack_create();
effects = ds_map_create();
effect_update = false;
sight_update = false;
//
hit = 0;
shake = false;
animation = anim_type.idle;
ani_map = ds_map_create();
//
image_speed = 0.25;

// default animations
ds_map_add(ani_map, anim_type.idle, [0]);
ds_map_add(ani_map, anim_type.run, [0]);
ds_map_add(ani_map, anim_type.fight, [0]);
ds_map_add(ani_map, anim_type.lean, [0]);
ds_map_add(ani_map, anim_type.crouch, [0]);
ds_map_add(ani_map, anim_type.death, [0]);
ds_map_add(ani_map, anim_type.meditation, [0]);