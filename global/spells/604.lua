-- Evacuate: Ro
function event_spell_effect(e)
  local client = e.target:CastToClient();

  client:MovePC(35, 120, -1046, 8, 185);
  return 1;

end
