function event_enter_zone(e)
  if eq.is_prophecy_of_ro_enabled() then
    return
  end

  local client = eq.get_entity_list():GetClientByID(e.self:GetID());

	if not client.valid then
		return
	end

  client:MovePC(Zone.ecommons, -144, -1543, 2, 244)
end
