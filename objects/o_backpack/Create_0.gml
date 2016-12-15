/// @description Init
event_inherited();

steps = 0;
xoffset = 4;
yoffset = 4;

ds_grid_resize(inventory, 2, 3);

// randomly add items (DEBUG)
for (var i = 0; i < ds_grid_width(inventory); i++)
{
	for (var j = 0; j < ds_grid_height(inventory); j++)
	{
		if (irandom(100) < 25)
		{
			var icon = choose(s_apple, s_backpack);
			inventory[# i, j] = icon_create(icon, 0, make_color_elm(), random(360) div 90);
		}
	}
}