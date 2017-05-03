/// @description Hover & Click
var width = surface_get_width(surf) * scale,
    height = surface_get_height(surf) * scale;
hover = mouse_x > x && mouse_x < x + width && mouse_y > y && mouse_y < y + height;
if (hover)
{
    item_index = (mouse_x - x) div size;
    item = item_index < array_length_1d(menu) ? menu[item_index] : noone;
    if (mouse_check_button_pressed(mb_left))
    {
        var args = [], cost = 0;
        switch (item)
        {
            case action_type.attack:
                args = [owner.target, irandom(owner.damage)];
                cost = 1;
                break;
            case action_type.meditation:
                args = [owner.target, irandom_range(0, 3), irandom(10)];
                cost = 2;
                break;
            case action_type.move:
                args = [owner.target];
                cost = path_get_number(owner.path) - 1;
                break;
            case action_type.skip:
                cost = owner.steps;
                break;
        }
        if (cost > 0 && owner.steps >= cost)
        {
            ds_stack_push(owner.actions, [item, args]);
            owner.steps -= cost;
        }
    }
}