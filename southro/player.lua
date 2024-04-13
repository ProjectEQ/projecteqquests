function event_enter_zone(e)
  local client = eq.get_entity_list():GetClientByID(e.self:GetID());

  if eq.is_prophecy_of_ro_enabled() then
    return
  end

  if (client.valid) then
    client:MovePC(Zone.sro, 1033, -1447, -25, 152)
  end
end
