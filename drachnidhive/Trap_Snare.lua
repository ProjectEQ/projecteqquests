function event_combat(e)
if (e.joined == true) then
e.self:CastSpell(7740,0); --confining web
eq.depop_with_timer();
end
end
