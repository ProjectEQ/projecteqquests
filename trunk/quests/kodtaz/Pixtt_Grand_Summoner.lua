function event_spawn(e)
	e.self:SetHP(100000);
end

function event_death_complete(e)
	--signal Trigger_Kodtaz to tell him I'm dead
	eq.signal(293218, 1);
end
