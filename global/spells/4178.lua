-- Teleport: South Ro
function event_spell_effect(e)
  local client = eq.get_entity_list():GetClientByID(e.target:GetID());
  client:MovePC(35, 1053.41, -1461.16, -25.96, 0);

  return 1;
end
