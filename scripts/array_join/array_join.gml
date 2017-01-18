/// @function array_join
/// @param array
var array = argument0;

// only work with lists
if (!is_array(array))
	return;

// combine all values into a string
var text = "";
for (var i = 0; i < array_length_1d(array); i++)
{
	text += (i > 0 ? ";" : "") + string(array[i]);
}
return "[" + text + "]";