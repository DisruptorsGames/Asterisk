/// @function music_set
/// @param sound
var sfx = argument0;
if (!audio_is_playing(sfx))
	audio_play_sound(sfx, 10, true);
else
	audio_stop_sound(sfx);
