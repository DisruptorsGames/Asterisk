/// @function animation_set
/// @param animation type
animation = argument0;
var frames = ani_map[? animation], 
	index = irandom(array_length_1d(frames) - 1);
image_index = frames[index];
image_speed = animation == anim_type.run ? 0.5 : 0.25;
return frames;