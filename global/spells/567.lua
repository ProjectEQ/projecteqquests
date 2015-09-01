-- Ro Portal
function event_spell_effect(e)
  --local mob = eq.get_entity_list():GetClientByID(e.caster_id):CastToMob(); 
  --local client = eq.get_entity_list():GetClientByID(e.caster_id):CastToClient(); 
  local group = eq.get_entity_list():GetClientByID(e.caster_id):GetGroup();
  local client;
  local count;
  
  if ( group.valid ) then
    count = group:GroupCount();
    for i = 0, count - 1, 1 do
      client = group:GetMember(i):CastToClient();
      client:MovePC(34, 820, 1374, 10, 40);
    end
  else
    client = eq.get_entity_list():GetClientByID(e.caster_id):CastToClient();
    client:MovePC(34, 820, 1374, 10, 40);
  end

  return 1;
end

