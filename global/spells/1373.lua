-- Translocate: Ro
function event_spell_effect_translocate_complete(e)
  local client = eq.get_entity_list():GetClientByID(e.target:GetID())

  if not client.valid then
    return 1
  end

  if eq.is_prophecy_of_ro_enabled() then
    client:MovePC(Zone.northro, 820, 1374, 10, 80)
    return 1
  end

  client:MovePC(Zone.nro, 820, 1374, 10, 80)

  return 1
end
