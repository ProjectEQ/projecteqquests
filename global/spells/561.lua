-- Tox Portal
function event_spell_effect(e)
  local mob = e.target;
  if (mob.valid and mob:IsClient()) then 
    local client = mob:CastToClient();
    -- If Rof2 client; move them to east commonland ldon camp.
    --if (bit.band(client:GetClientVersionBit(), 4294967264) ~= 0) then
    --  client:MovePC(414, -1657, -1508, 72, 494);
    --else

    if (client.valid) then
      client:MovePC(38, -921, -1523, -38, 66); -- Zone: chambersb
    end

    --end
  end

  return 1;
end
