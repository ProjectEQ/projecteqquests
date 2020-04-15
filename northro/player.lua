function event_enter_zone(e)
  local client = eq.get_entity_list():GetClientByID(e.self:GetID());
  
  if (client.valid) then
    client:MovePC(34, 923, 2649, -24, 484); -- Zone: nro
  end
end
