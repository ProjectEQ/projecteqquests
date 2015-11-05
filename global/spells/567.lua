-- Ro Portal
function event_spell_effect(e)
  local mob = e.target;
  if ( mob:IsClient() ) then 
    local client = e.target:CastToClient();
    client:MovePC(34, 820, 1374, 10, 40);
  end

  return 1;
end

