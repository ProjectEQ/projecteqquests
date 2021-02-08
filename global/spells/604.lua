-- Evacuate: Ro
function event_spell_effect(e)
  local mob = e.target;
  if (mob.valid and mob:IsClient()) then 
    local client = mob:CastToClient();
    if (client.valid) then 
      client:MovePC(35, 120, -1046, 8, 370); -- Zone: sro
    end
  end

  return 1;
end
