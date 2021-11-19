--Ikkinz Group Trial #2: Twin Struggles 

function event_death_complete(e)
eq.zone_emote(0,"The constrained servitor is allowed to rest at last. The priests he was serving have been weakened by his death.");
eq.signal(294138,1); --signal #Malevolent_Priest (294138) to reduce hp
eq.signal(294629,1); --signal #Malevolent_Priest_ (294629) to reduce hp
end
