-- Translocate: Commons 
function event_spell_effect_translocate_complete(e) 
  local client = eq.get_entity_list():GetClientByID(e.target:GetID());
  -- If Rof2 client; move them to east commonland ldon camp.
  if (bit.band(client:GetClientVersionBit(), 4294967264) ~= 0) then
    client:MovePC(22, -144, -1543, 2, 122);
  else
    client:MovePC(21, 1839, 2, -15, 60);
  end

  return 1;
end
