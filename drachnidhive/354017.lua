function event_combat(e)
if (e.joined == true) then
e.self:CastSpell(eq.ChooseRandom(7741,7743),e.self:GetTarget():GetID());
eq.depop_with_timer();
end
end
