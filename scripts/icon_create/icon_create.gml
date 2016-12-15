/// @function icon_create
/// @param icon
/// @param image_index
/// @param image_blend
/// @param image_angle
var obj = instance_create_depth(x, y, depth - 1, o_icon);
obj.owner = id;
obj.sprite_index = argument0;
obj.image_index = argument1;
obj.image_blend = argument2;
obj.image_angle = argument3;
obj.image_speed = 0;
return obj;
