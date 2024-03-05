-- Succor: Lavastorm
function event_spell_effect(e)
  local mob = e.target;
  
  if (mob.valid and mob:IsClient()) then
    local client = mob:CastToClient();
    if (client.valid and eq.is_dragons_of_norrath_enabled()) then
      client:MovePC(27, 460, 460, -86, 454) -- Zone: Lavastorm v1
    else
      client:MovePC(27, 1389, 1014, 131, 301) -- Zone: Lavastorm v0
    end
  end

  return 1;
end
