/// @function animation_set
/// @param obj
/// @param animation type
var obj = argument0;
obj.animation = argument1;
var frames = obj.ani_map[? animation],
    index = irandom(array_length_1d(frames) - 1);
obj.image_index = frames[index];
obj.image_speed = obj.animation == anim_type.run ? 0.5 : 0.25;
return frames;