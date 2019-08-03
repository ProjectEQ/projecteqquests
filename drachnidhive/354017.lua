function event_combat(e)
if (e.joined == true) then
eq.set_timer("cast", 500);
end
end

function event_timer(e)
e.self:CastSpell(eq.ChooseRandom(7741,7743),e.self:GetTarget():GetID());
eq.depop_with_timer();
end
