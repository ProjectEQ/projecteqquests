-- Circle of Ro
function event_spell_effect(e)
  local mob = eq.get_entity_list():GetClientByID(e.caster_id):CastToMob(); 
  local client = eq.get_entity_list():GetClientByID(e.caster_id):CastToClient(); 
  local group = eq.get_entity_list():GetClientByID(e.caster_id):GetGroup();
  
  group:TeleportGroup( mob, 35, 0, 304, -2000, -25, 120 );
  client:MovePC(35, 304, -2000, -25, 120);

  return 1;
end
