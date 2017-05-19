/// @description Hover & Click
var width = surface_get_width(surf) * scale,
    height = surface_get_height(surf) * scale;
hover = point_in_rectangle(mouse_x, mouse_y, x, y, x + width, y + height);
if (hover)
{
    item_index = (mouse_x - x) div (size + offset);
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
                args = [id];
                cost = owner.steps;
                break;
        }
        // use action points
        if (cost > 0 && owner.steps >= cost)
        {
            ds_stack_push(owner.actions, [item, args]);
            owner.steps -= cost;
        }
    }
}