function event_enter_zone(e)
  local client = eq.get_entity_list():GetClientByID(e.self:GetID());
  
-- If not Rof2 client; move them to east commonland ldon camp. Commons not yet implemented
  if (bit.band(client:GetClientVersionBit(), 4294967264) == 0) then
    client.MovePC(22, -144, -1543, 2, 244); -- Zone: ecommons
  end
end
