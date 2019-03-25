function event_spawn(e)
	eq.set_timer("1", 6000);
end

function event_timer(e)
	if (e.self:GetZ() > -437) then
		e.self:SetHP(e.self:GetMaxHP());
	end
end

function event_death_complete(e)
	-- Signal the #Pixtt Grand Summoner to reduce its hit points each time a Deranged Greater Stoneservant
	eq.signal( 293212, 1 ); -- NPC: #Pixtt_Grand_Summoner

	-- Signal the Trigger Kodtaz 1 (Controller) 
	eq.signal( 293218, 2 ); -- NPC: #Trigger_Kodtaz_1
end
