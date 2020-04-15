-- Teleport: East Commons 
function event_spell_effect(e) 
  local client = eq.get_entity_list():GetClientByID(e.target:GetID());
  
  if (client.valid) then
    client:MovePC(22, -144, -1543, 2, 244); -- Zone: ecommons
  end

  return 1;
end


