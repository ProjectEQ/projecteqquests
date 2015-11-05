-- Evacuate: Ro
function event_spell_effect(e)
  local mob = e.target;
  if ( mob:IsClient() ) then 
    local client = e.target:CastToClient();
    if (client.valid) then 
      client:MovePC(35, 120, -1046, 8, 185);
    end
  end

  return 1;
end
