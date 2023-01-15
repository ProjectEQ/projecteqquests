--Ikkinz Raid #4: Chambers of Destruction
-- 294610

function event_death_complete(e)
	eq.signal(294614,1); -- NPC: #Trigger_Ikkinz_4
	eq.zone_emote(0, "Phantasmal Priest Guardian's corpse cannot sustain itself anymore and crashes to the ground");
end
