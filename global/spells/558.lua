-- Circle of Misty
function event_spell_effect(e)
  local mob = e.target;
  if (mob.valid and mob:IsClient()) then 
    local client = mob:CastToClient();
    if (client.valid) then
	  client:MovePC(33, -1818, -508.5, 124.3, 10); -- Zone: misty
    end
  end
return 1;
end
