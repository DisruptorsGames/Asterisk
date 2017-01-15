// note: this is a re-implementation of util_format
//       couldn't get the variable arguments passing to work
var s = "";
for (var i=0; i<argument_count; i++) {
	s = s + string(argument[i]);
}

show_debug_message(s);