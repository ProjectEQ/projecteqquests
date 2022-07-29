-- Circle of Undershore
-- zone isn't available, but people have the spell and exploit it
-- remove this when it is
function event_spell_effect(e)
  local client = eq.get_entity_list():GetClientByID(e.target:GetID());
  if (client.valid) then
    client:BuffFadeByEffect(57); -- SE_Levitate
    client:MovePC(202, -285, -148, 2000, 0); -- Zone: poknowledge
  end
  return 1;
end
