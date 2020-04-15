-- Circle of Toxxulia
function event_spell_effect(e)
  local mob = e.target;
  if (mob.valid and mob:IsClient()) then
    local client = mob:CastToClient();
    -- If Rof2 client; move them to east commonland ldon camp.
    --if (bit.band(client:GetClientVersionBit(), 4294967264) ~= 0) then
    --  client:MovePC(414, -1172, 1060, 27, 240);
    --else

    if (client.valid) then
      client:MovePC(38, -453, 1059, -58, 74); -- Zone: tox
    end

    --end
  end

  return 1;
end
