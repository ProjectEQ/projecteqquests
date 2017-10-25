function event_spawn(e)
eq.set_proximity(e.self:GetX() - 60, e.self:GetX() + 60, e.self:GetY() - 60, e.self:GetY() + 60);
end

function event_enter(e)
e.self:CastSpell(2076, 0);
end
