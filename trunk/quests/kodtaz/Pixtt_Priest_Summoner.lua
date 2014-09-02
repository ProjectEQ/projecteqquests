function event_combat(e)
	eq.spawn2(293219,0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading());
end

function event_death_complete(e)
	--signal Trigger_Kodtaz to tell him I'm dead
	eq.signal(293218, 0);
end
