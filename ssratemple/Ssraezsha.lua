function event_spawn(e)
eq.set_proximity(e.self:GetX() - 60, e.self:GetX() + 60, e.self:GetY() - 60, e.self:GetY() + 60, e.self:GetZ() - 20, e.self:GetZ() + 40);
end

function event_enter(e)
e.self:CastSpell(2076,e.other:GetID(),0,1); -- Spell: Presence of Ssraeshza
end
