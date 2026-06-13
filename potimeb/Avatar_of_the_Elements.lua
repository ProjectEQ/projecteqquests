--Avatar_of_the_Elements (223073)
--Phase 3 Final Boss 
--potimeb

local TOKEN_ID = 90100;

function event_spawn(e)
	e.self:AddItem(TOKEN_ID, 1);
end

function event_death_complete(e)
	eq.signal(223097,223073); -- Add Loot Lockout
	eq.signal(223097,4); -- send a signal to the zone_status that I died
end