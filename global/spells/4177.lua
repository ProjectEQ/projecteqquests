-- Teleport: North Ro
function event_spell_effect(e)
  local client = eq.get_entity_list():GetClientByID(e.target:GetID())

  if not client.valid then
    return 1
  end

  if eq.is_prophecy_of_ro_enabled() then
    client:MovePC(Zone.northro, 914, 2673, -25, 456)
    return 1
  end

  client:MovePC(Zone.nro, 914, 2673, -25, 456)
  return 1
end



