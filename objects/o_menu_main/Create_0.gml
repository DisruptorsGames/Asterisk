/// @description Init
event_inherited();

menu = ds_list_create();
ds_list_add(menu, "Play");
ds_list_add(menu, "Quit");

audio_stop_all();
