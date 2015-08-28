-- Ro Gate
function event_spell_effect(e)
  local client = eq.get_entity_list():GetClientByID(e.caster_id);
  client:MovePC(34, 820, 1374, 10, 40);

  return 1;
end
