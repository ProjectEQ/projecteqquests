function event_spawn(e)
eq.set_proximity(e.self:GetX() - 60, e.self:GetX() + 60, e.self:GetY() - 60, e.self:GetY() + 60, e.self:GetZ() - 20, e.self:GetZ() + 40);
eq.set_timer('depop', 3600 * 1000);
end

function event_enter(e)
e.self:CastSpell(2076,e.other:GetID(),0,1); -- Spell: Presence of Ssraeshza
end

function event_timer(e)
if (e.timer == 'depop') then
eq.depop();
end
end
