function event_death_complete(e)
  eq.spawn2(392106,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading());
end

function event_spawn(e)
	e.self:Say("We understand your need, but you must not free him.");
end