function event_enter(e)
	e.self:CastSpell(8505,e.other:GetID());
end


function event_exit(e)

end

function event_spawn(e)
	eq.set_proximity(e.self:GetX() - 60, e.self:GetX() + 60, e.self:GetY() - 60, e.self:GetY() + 60);
end

function event_timer(e)
end