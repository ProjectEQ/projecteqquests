-- Ro Portal
function event_spell_effect(e)
  local client = e.target:CastToClient();
  client:MovePC(34, 820, 1374, 10, 40);

  return 1;
end

