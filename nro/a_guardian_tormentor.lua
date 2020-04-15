function event_death_complete(e)
  eq.spawn2(392107,0,0,e.self:GetX(),e.self:GetY(),e.self:GetZ(),e.self:GetHeading()); -- NPC: a_lamented_knight
end

function event_spawn(e)
	e.self:Say("He is a dangerous creature. Please do not prevent us from doing our work.");
end