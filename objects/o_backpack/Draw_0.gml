/// @description Draw What's Inside

/*
if (instance_exists(owner) && owner.inv_show)
{
	var xx = x + xoffset, yy = y + yoffset;
	draw_roundrect_color(xx, yy, xx + ds_grid_width(inventory) * inv_size, yy + ds_grid_height(inventory) * inv_size, $425469, $425469, false);
	draw_roundrect_color(xx, yy, xx + ds_grid_width(inventory) * inv_size, yy + ds_grid_height(inventory) * inv_size, $10151a, $10151a, true);
	for (var i = 0; i < ds_grid_width(inventory); i++)
	{
		for (var j = 0; j < ds_grid_height(inventory); j++)
		{
			var ix = x + xoffset + i * inv_size, 
				iy = y + yoffset + j * inv_size, 
				item = inventory[# i, j];
			draw_roundrect_color(ix, iy, ix + inv_size, iy + inv_size, $10151a, $10151a, true);
			if (item > 0)
			{
				item.x = ix + 4;
				item.y = iy + 4;
			}
		}
	}
}*/