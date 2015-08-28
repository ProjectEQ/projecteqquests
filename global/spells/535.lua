-- Ring of Ro
function event_spell_effect(e)
  local client = eq.get_entity_list():GetClientByID(e.caster_id);
  client:MovePC(35, 304, -2000, -25, 120);

  return 1;
end
