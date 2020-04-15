-- Commons Portal
function event_spell_effect(e)
  local mob = e.target;
  if (mob.valid and mob:IsClient()) then 
    local client = mob:CastToClient();

    -- If Rof2 client; move them to east commonland ldon camp.
    --if (bit.band(client:GetClientVersionBit(), 4294967264) ~= 0) then
    --  client:MovePC(22, -144, -1543, 2, 244);
    --else

    if (client.valid) then
      client:MovePC(21, 1839, 2, -15, 120); -- Zone: commons
    end

    --end
  end

  return 1;
end

