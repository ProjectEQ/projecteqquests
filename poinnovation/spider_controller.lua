function event_spawn(e)
    eq.set_timer("spiders", 19000) -- Set the initial timer for spawning spiders with an 8-second delay
end

function event_timer(e)
    local npc_list = eq.get_entity_list():GetNPCList() -- Get the list of NPCs in the zone
    local spider_count = 0 -- Initialize spider count
    
    if npc_list ~= nil then
        for npc in npc_list.entries do
            local npc_type_id = npc:GetNPCTypeID()
            if npc_type_id == 206000 or npc_type_id == 206001 or npc_type_id == 206002 or npc_type_id == 206086 or npc_type_id == 206071 or npc_type_id == 206070 or npc_type_id == 206072 or npc_type_id == 206069 then
                spider_count = spider_count + 1 -- Increment spider count
            end
        end
    end
    
    if spider_count < 400 then -- Check if the number of spiders is less than 1,000,000
        -- Spawn additional spiders until reaching 1,000,000, staggering by 8 seconds
        if spider_count < 400 then
            eq.spawn2(206000, 28, 0, 803, -285, 4.63, 314) -- Spawn a spider
            eq.spawn2(206001, 29, 0, 804, 285, 4.63, 314) -- Spawn a spider
            eq.spawn2(206002, 30, 0, 1443, 285, 4.63, 314) -- Spawn a spider
            eq.spawn2(206086, 31, 0, 1443, -285, 4.63, 314) -- Spawn a spider
            eq.spawn2(eq.ChooseRandom(206071, 206070), 26, 0, 1155, 605, 4.63, 0) -- Spawn a spider
            eq.spawn2(eq.ChooseRandom(206072, 206069), 24, 0, 1155, -600, 4.63, 0) -- Spawn a spider
            eq.set_timer("spiders", 19000) -- Reset the timer for the next spider spawn after 8 seconds
        end
    else
        eq.stop_timer("spiders") -- Stop the timer if 1,000,000 spiders have been spawned
        eq.set_timer("spiders", 19000) -- Reset the timer to start over
    end
end
