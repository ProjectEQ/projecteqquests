-- Teleport: South Ro
function event_spell_effect(e)
  local client = eq.get_entity_list():GetClientByID(e.target:GetID())

  if not client.valid then
    return 1
  end

  if eq.is_prophecy_of_ro_enabled() then
    client:MovePC(Zone.southro, 1053.41, -1461.16, -25.96, 0)
    return 1
  end

  client:MovePC(Zone.sro, 1053.41, -1461.16, -25.96, 0)
  return 1
end
