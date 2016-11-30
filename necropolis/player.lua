function event_loot(e)
    -- bard 1.5 Drac chest
    if e.self:GetClass() == 8 and e.item:GetID() == 77613 then
        local qglobals = eq.get_qglobals(e.self)
        if qglobals["bard15"] ~= nil and qglobals["bard15"] >= "3" and qglobals["bard15_dracchest"] == nil then
            eq.spawn2(283157, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading())
            eq.set_global("bard15_dracchest", "1", 5, "F")
        end
    end
end

function event_enter_zone(e)
    -- bard 1.5 flagged spawns
    -- #Hsagra`s_Shade (123172) Vesthon event 1
    -- #Vesthon_Marijakin (123173) Vesthon event 2
    -- #Hsagra`s_Relics (123174) Vesthon event 2
    if e.self:GetClass() == 8 then
        local qglobals = eq.get_qglobals(e.self)
        if qglobals["hsagra_cooldown"] == nil and qglobals["bard15"] == "2" then
            eq.unique_spawn(123172, 0, 0, -2716, -293, 12, 41)
        end
        -- we want to let them respawn the event if they deleted the orb so they can do 2.0
        -- Should probably add a 2.0 check here eventually
        if qglobals["drac_cooldown"] == nil and qglobals["bard15"] ~= nil and qglobals["bard15"] >= "3" and not e.self:HasItem(77613) then
            local entity_list = eq.get_entity_list()
            -- we can probably get away with just doing unique_spawn but lets just be safe
            if entity_list:IsMobSpawnedByNpcTypeID(123173) == false and entity_list:IsMobSpawnedByNpcTypeID(123174) == false then
                eq.unique_spawn(123173, 0, 0, -1050, 1388, 13, 255) -- he will spawn the rest
            end
        end
    end
end
