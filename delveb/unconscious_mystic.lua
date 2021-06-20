function event_spawn(e)
eq.set_timer("reset", 120 * 1000);
eq.set_timer("liedown", 1 * 1000);
end

function event_timer(e)
if (e.timer == "reset") then
eq.stop_timer("reset");
local el = eq.get_entity_list();
if ( el:IsMobSpawnedByNpcTypeID(342054) == false) then
eq.spawn2(342054,0,0,-161,2064,-11,149); -- NPC: #Mystic_Shiflor
end
    
local el = eq.get_entity_list();
if ( el:IsMobSpawnedByNpcTypeID(342053) == false) then
eq.spawn2(342053,0,0,23,2025,2,401); -- NPC: #Mystic_Braggle
end
    
local el = eq.get_entity_list();
if ( el:IsMobSpawnedByNpcTypeID(342055) == false) then
eq.spawn2(342055,0,0,-85,1961,-.23,35); -- NPC: #Mystic_Griknok
end


eq.signal(342052,2); --emoush goes back to sleep
eq.depop_all(342060); --depop unconscious mystics
elseif (e.timer == "liedown") then
e.self:SetAppearance(3);
eq.stop_timer("liedown");
end
end

function event_signal(e)
  if(e.signal == 1) then
    eq.stop_timer("reset");
    eq.depop_all(342060);
  end
end
