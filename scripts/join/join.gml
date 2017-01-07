/// @function join
/// @param list
var list = argument0;

// only work with lists
if (!ds_exists(list, ds_type_list))
	return;

// combine all values into a string
var text = "";
for (var i = 0; i < ds_list_size(list); i++)
{
	text += i > 0 ? ";" : "" + string(list[| i]);
}
return "[" + text + "]";