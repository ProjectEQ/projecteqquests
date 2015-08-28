-- Ro Portal
function event_spell_effect(e)
  local mob = eq.get_entity_list():GetClientByID(e.caster_id):CastToMob(); 
  local client = eq.get_entity_list():GetClientByID(e.caster_id):CastToClient(); 
  local group = eq.get_entity_list():GetClientByID(e.caster_id):GetGroup();
  
  group:TeleportGroup( mob, 34, 0, 820, 1374, 10, 40);
  client:MovePC(34, 820, 1374, 10, 40);

  return 1;
end

