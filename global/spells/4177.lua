-- Teleport: North Ro
function event_spell_effect(e) 
  local client = eq.get_entity_list():GetClientByID(e.target:GetID());
  client:MovePC(34, 914, 2673, -25, 228);

  return 1;
end



