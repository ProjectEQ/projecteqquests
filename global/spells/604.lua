-- Evacuate: Ro
function event_spell_effect(e)
  local mob = e.target
	if not mob.valid then
		return 1
	end

	if not mob:IsClient() then
		return 1
	end

	local client = mob:CastToClient()
	if not client.valid then
		return 1
	end

	if eq.is_prophecy_of_ro_enabled() then
		client:MovePC(Zone.southro, 120, -1046, 8, 370)
		return 1
	end

	client:MovePC(Zone.sro, 120, -1046, 8, 370)
	return 1
end
