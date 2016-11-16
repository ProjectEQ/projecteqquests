-- Ring of Misty
function event_spell_effect(e)
  local client = eq.get_entity_list():GetClientByID(e.caster_id);
  client:MovePC(33, -1818, -508.5, 124.3, 5);
return 1;
end
