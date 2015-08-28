-- Commons Portal
function event_spell_effect(e)
  local group = eq.get_entity_list():GetClientByID(e.caster_id):GetGroup();
  local client;
  local count = group:GroupCount();

  if ( group.valid ) then 
    for i = 0, count - 1, 1 do
      client = group:GetMember(i):CastToClient();
      if (client.valid) then
        -- If Rof2 client; move them to east commonland ldon camp.
        if (bit.band(client:GetClientVersionBit(), 4294967264) ~= 0) then
          client:MovePC(22, -144, -1543, 2, 122);
        else
          client:MovePC(21, 1839, 2, -15, 60);
        end
      end
    end
  else
    client = eq.get_entity_list():GetClientByID(e.caster_id):CastToClient();
    -- If Rof2 client; move them to east commonland ldon camp.
    if (bit.band(client:GetClientVersionBit(), 4294967264) ~= 0) then
      client:MovePC(22, -144, -1543, 2, 122);
    else
      client:MovePC(21, 1839, 2, -15, 60);
    end
  end

  return 1;
end

