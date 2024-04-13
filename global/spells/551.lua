-- Circle of Commons
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
		client:MovePC(Zone.commonlands, 1396, 345, -50, 490)
		return 1
	end

	client:MovePC(Zone.commons, 1396, 345, -50, 490)
	return 1
end
