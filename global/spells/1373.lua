-- Translocate: Ro 
function event_spell_effect_translocate_complete(e) 
  local client = eq.get_entity_list():GetClientByID(e.target:GetID());
  
  if (client.valid) then
    client:MovePC(34, 820, 1374, 10, 80); -- Zone: nro
  end

  return 1;
end
