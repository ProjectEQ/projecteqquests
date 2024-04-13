-- Translocate: Commons
function event_spell_effect_translocate_complete(e)
  local client = eq.get_entity_list():GetClientByID(e.caster_id)

	if not client.valid then
		return 1
	end

	if eq.is_prophecy_of_ro_enabled() then
		client:MovePC(Zone.southro, 1839, 2, -15, 120)
		return 1
	end

	client:MovePC(Zone.sro, 1839, 2, -15, 120)
	return 1
end
