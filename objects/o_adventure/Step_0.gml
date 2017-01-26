/// @description Turns
if (ds_priority_size(turns) == 0)
{
	for (var i = 0; i < instance_count; i++)
	{
		var inst = instance_id[i];
		if (object_get_parent(inst.object_index) == o_entity 
			&& inst.initiative > 0 && inst.steps > 0 && !inst.dead)
				ds_priority_add(turns, inst, inst.initiative);
	}
	// ToDo update playfield
}

if (entity == noone)
{
	entity = ds_priority_find_max(turns);
	o_controller.target = entity;
	o_highlight.target = entity;
	entity.fog_update = true;
	entity.effect_update = true;
	playfield_update(entity);
}
else if (entity.steps == 0 || entity.dead)
{
	entity.steps = entity.moves;
	ds_priority_delete_value(turns, entity)
	entity = noone;
}