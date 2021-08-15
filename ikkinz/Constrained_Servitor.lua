--Ikkinz Group Trial #2: Twin Struggles 

function event_death_complete(e)
eq.zone_emote(0,"The constrained servitor is allowed to rest at last. The priests he was serving have been weakened by his death.");
eq.signal(294085,1); -- NPC: Malevolent_Priest
end
