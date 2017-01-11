/// @description Controls
event_inherited();

if (keyboard_check(vk_enter) && !keyboard_check(vk_alt))
{
    var value = ds_list_find_value(menu, selection);
    switch (value)
    {
        case "Play":
            room_goto(r_outside);
            break;
        case "Quit":
            game_end();
            break;
    }
}