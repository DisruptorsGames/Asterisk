/// @function animation_set
/// @param animation type
animation = argument0;
var frames = ani_map[? animation];
image_index = frames[0];
image_speed = animation == anim_type.run ? 0.5 : 0.25;
return frames;