-- Teleport: North Ro
function event_spell_effect(e) 
  local client = eq.get_entity_list():GetClientByID(e.target:GetID());
  
  if (client.valid) then
    client:MovePC(34, 914, 2673, -25, 456); -- Zone: nro
  end

  return 1;
end



