/// @function array_to_string
/// @description Turns an array into a string
/// @param array
/// @param delimiter
var array = argument0, delimiter = string(argument1), result = "";
for (var i = 0; i < array_length_1d(array); i++)
{
    result += (i > 0 ? delimiter : "") + string(array[i]);
}
return result;