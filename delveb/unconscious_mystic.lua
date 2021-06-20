function event_spawn(e)
    eq.set_timer("reset", 120 * 1000);
    eq.set_timer("liedown", 1 * 1000);
end

function event_timer(e)
    if (e.timer == "reset") then
        eq.stop_timer("reset");
        eq.signal(342052,2); --emoush goes back to sleep
        eq.depop_all(342060); --depop unconscious mystics
        local el = eq.get_entity_list();
        if ( el:IsMobSpawnedByNpcTypeID(342054) == false) then
           eq.unique_spawn(342054,0,0,-165,1946,-3,45); -- NPC: #Mystic_Shiflor
        elseif ( el:IsMobSpawnedByNpcTypeID(342053) == false) then
            eq.unique_spawn(342053,0,0,-68,1965,0,427); -- NPC: #Mystic_Braggle
        elseif ( el:IsMobSpawnedByNpcTypeID(342055) == false) then
            eq.unique_spawn(342055,0,0,-141,2040,-8.15,244); -- NPC: #Mystic_Griknok
        end

    elseif (e.timer == "liedown") then
        e.self:SetAppearance(3);
        eq.stop_timer("liedown");
    end
end
