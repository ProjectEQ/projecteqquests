-- Circle of Toxxulia
function event_spell_effect(e)
  local mob = e.target;
  if ( mob:IsClient() ) then
    local client = e.target:CastToClient();
    -- If Rof2 client; move them to east commonland ldon camp.
    --if (bit.band(client:GetClientVersionBit(), 4294967264) ~= 0) then
    --  client:MovePC(414, -1172, 1060, 27, 120);
    --else
      client:MovePC(38, -453, 1059, -58, 37);
    --end
  end

  return 1;
end
