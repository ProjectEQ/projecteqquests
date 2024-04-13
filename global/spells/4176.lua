-- Teleport: East Commons
function event_spell_effect(e)
  local client = eq.get_entity_list():GetClientByID(e.target:GetID())

  if not client.valid then
    return 1
  end
  if eq.is_prophecy_of_ro_enabled() then
    client:MovePC(Zone.commonlands, -144, -1543, 2, 244)
    return 1
  end
  client:MovePC(Zone.ecommons, -144, -1543, 2, 244)
  return 1
end


