-- Circle of Misty
function event_spell_effect(e)
  local mob = e.target;
  if ( mob:IsClient() ) then 
    local client = e.target:CastToClient();
	client:MovePC(33, -1818, -508.5, 124.3, 5);
  end
return 1;
end
