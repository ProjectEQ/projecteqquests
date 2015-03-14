function event_spawn(e)
	eq.set_timer("1", 6000);
end

function event_timer(e)
	if (e.self:GetZ() > -437) then
		e.self:SetHP(e.self:GetMaxHP());
	end
end

function event_death_complete(e)
	--signal Trigger_Kodtaz to tell him I'm dead
	eq.signal(293218,3);
end
