/// @description Init
name = "Nobody";
portrait = noone;
hp = 0;
hp_max = 0;
chi = 0;
chi_max = 0;
hp_col = merge_color(c_red, make_color_elm(), random_range(0.5, 0.75));
chi_col = merge_color(c_white, make_color_elm(), random_range(0.5, 0.75));
dead = false;
initiative = 0;
priority = 0;
damage = 0;
range = 1;
npc = true;
passive = false;
think = seconds(1);
moves = 0;
steps = moves;
path = path_add();
locked = false;
inventory = ds_map_create();
inventory_item = -1;
actions = ds_stack_create();
effects = ds_map_create();
effect_update = false;
amenu = [];
amenu_x = x;
amenu_y = y;
amenu_item = -1;
amenu_target = noone;
inspect = noone;
shell = c_dkgray;
xoffset = sprite_xoffset;
yoffset = sprite_yoffset;
shake = false;
animation = anim_type.idle;
ani_map = ds_map_create();
fog_update = true;
image_speed = 0.25;

// default inventory
if (object_index != o_player && instance_exists(o_chest) && distance_to_object(o_chest) < 64)
	inventory[? s_key] = 1;

// default animations
ds_map_add(ani_map, anim_type.idle, [0]);
ds_map_add(ani_map, anim_type.run, [0]);
ds_map_add(ani_map, anim_type.fight, [0]);
ds_map_add(ani_map, anim_type.lean, [0]);
ds_map_add(ani_map, anim_type.crouch, [0]);
ds_map_add(ani_map, anim_type.death, [0]);
ds_map_add(ani_map, anim_type.meditation, [0]);





