function event_combat(e)
if (e.joined == true) then
eq.set_timer("cast", 500);
end
end

function event_timer(e)
e.self:CastSpell(7740,e.self:GetTarget():GetID());
eq.depop_with_timer();
end
