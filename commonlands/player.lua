function event_enter_zone(e)
  local client = eq.get_entity_list():GetClientByID(e.self:GetID());
  client:MovePC(22, -144, -1543, 2, 244); -- Zone: ecommons
end
