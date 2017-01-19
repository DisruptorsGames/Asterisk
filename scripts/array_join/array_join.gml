/// @function array_join
/// @param delimiter
/// @param array
var delimiter = argument0, array = argument1;

// only work with lists
if (!ds_exists(array, ds_type_list))
	return;

// combine all values into a string
var text = "";
for (var i = 0; i < ds_list_size(array); i++)
{
	text += (i > 0 ? delimiter : "") + string(array[| i]);
}
return "[" + text + "]";