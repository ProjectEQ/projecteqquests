-- Circle of Commons
function event_spell_effect(e)
  local mob = e.target;
  if ( mob:IsClient() ) then 
    local client = e.target:CastToClient();
    -- If Rof2 client; move them to east commonland ldon camp.
    --if (bit.band(client:GetClientVersionBit(), 4294967264) ~= 0) then
    --  client:MovePC(22, -144, -1543, 2, 244);
    --else
      client:MovePC(21, 1396, 345, -50, 490);
    --end
  end

  return 1;
end
