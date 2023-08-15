--Ikkinz Group Trial #2: Twin Struggles 

function event_combat(e)
if e.joined then
eq.set_timer("wipe", 10 * 1000);
e.self:ModifyNPCStat("hp_regen", "1");
end
end

function event_timer(e)
if(e.timer=="wipe") then
eq.stop_timer("wipe");
e.self:WipeHateList();
e.self:ModifyNPCStat("hp_regen", "3500");
end
end

function event_death_complete(e)
eq.zone_emote(MT.White,"The constrained servitor is allowed to rest at last. The priests he was serving have been weakened by his death.");
eq.signal(294138,1); --signal #Malevolent_Priest (294138) to reduce hp
eq.signal(294629,1); --signal #Malevolent_Priest_ (294629) to reduce hp
end
