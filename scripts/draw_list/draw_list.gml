/// @function draw_list
/// @param delimiter
/// @param list
/// @param count
var delimiter = argument0, list = argument1, count = argument2;

// only work with lists
if (!ds_exists(list, ds_type_list))
	return;

// combine all values into a string
var text = "", start = ds_list_size(list) - count;
for (var i = start < 0 ? 0 : start; i < ds_list_size(list); i++)
{
	text += (i > 0 ? delimiter : "") + string(list[| i]);
}
return "[" + text + "]";