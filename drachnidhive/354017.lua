function event_combat(e)
if (e.joined == true) then
e.self:CastSpell(eq.ChooseRandom(7741,7743), e.self:GetID());
eq.depop_with_timer();
end
end
