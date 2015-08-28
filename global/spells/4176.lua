-- Teleport: East Commons 
function event_spell_effect(e) 
  local client = eq.get_entity_list():GetClientByID(e.target:GetID());
  client:MovePC(22, -144, -1543, 2, 122);

  return 1;
end


