/// @function fx_float
/// @param target
/// @param text / sprite
var target = argument0, value = argument1;
var float = instance_create_depth(target.x + target.xoffset, target.y + target.yoffset, target.depth - 1, o_float);
float.image_blend = object_get_parent(target.object_index) == o_entity ? target.hp_col : target.shell;
if (is_string(value))
    float.text = value;
else
    float.sprite_index = value;