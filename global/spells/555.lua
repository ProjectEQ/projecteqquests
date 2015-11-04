-- Circle of Ro
function event_spell_effect(e)
  local client = e.target:CastToClient();
  client:MovePC(35, 304, -2000, -25, 120);

  return 1;
end
