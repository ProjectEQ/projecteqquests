function event_enter_zone(e)
  local client = eq.get_entity_list():GetClientByID(e.self:GetID());
  client:MovePC(34, 923, 2649, -24, 242);
end
