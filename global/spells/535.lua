-- Ring of Ro
function event_spell_effect(e)
	local client = eq.get_entity_list():GetClientByID(e.caster_id)

	if not client.valid then
		return 1
	end

	if eq.is_prophecy_of_ro_enabled() then
		client:MovePC(Zone.southro, 304, -2000, -25, 240)
		return 1
	end

	client:MovePC(Zone.sro, 304, -2000, -25, 240)
	return 1
end
