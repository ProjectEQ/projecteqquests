-- Teleport: South Ro
function event_spell_effect(e)
  local client = eq.get_entity_list():GetClientByID(e.target:GetID());
  client:MovePC(35, 137.41, -1043.16, 10.34, 0);

  return 1;
end
