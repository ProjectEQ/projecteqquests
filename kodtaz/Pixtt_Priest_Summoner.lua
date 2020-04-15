function event_combat(e)
	eq.spawn2(293219,0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC: #Rav_Priest_Guardian
end

function event_death_complete(e)
	--signal Trigger_Kodtaz to tell him I'm dead
	eq.signal(293218, 0); -- NPC: #Trigger_Kodtaz_1
end
