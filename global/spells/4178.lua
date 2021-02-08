-- Teleport: South Ro
function event_spell_effect(e)
  local client = eq.get_entity_list():GetClientByID(e.target:GetID());
  
  if (client.valid) then
    client:MovePC(35, 1053.41, -1461.16, -25.96, 0); -- Zone: sro
  end

  return 1;
end
