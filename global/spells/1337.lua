-- Translocate: Tox 
function event_spell_effect_translocate_complete(e) 
  local client = eq.get_entity_list():GetClientByID(e.target:GetID());
  -- If Rof2 client; move them to east commonland ldon camp.
  --if (bit.band(client:GetClientVersionBit(), 4294967264) ~= 0) then
  --  client:MovePC(414, -1657, -1508, 72, 247);
  --else
    client:MovePC(38, -921, -1523, -38, 33);
  --end

  return 1;
end

