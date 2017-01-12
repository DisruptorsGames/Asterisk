/// @function array_contains
/// @param array
/// @param value
var array = argument0, value = argument1;
for (var i = 0; i < array_length_1d(array); i++)
{
	if (array[i] == value)
		return true;
}
return false;