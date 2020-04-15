-- Ro Portal
function event_spell_effect(e)
  local mob = e.target;
  if (mob.valid and mob:IsClient()) then 
    local client = mob:CastToClient();
    if (client.valid) then
      client:MovePC(34, 820, 1374, 10, 80); -- Zone: nro
    end
  end

  return 1;
end

