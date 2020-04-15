-- Circle of Ro
function event_spell_effect(e)
  local mob = e.target;
  if (mob.valid and mob:IsClient()) then
    local client = mob:CastToClient();
    if (client.valid) then
      client:MovePC(35, 304, -2000, -25, 240); -- Zone: sro
    end
  end

  return 1;
end
