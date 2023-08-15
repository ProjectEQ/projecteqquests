function event_killed_merit(e)
    if (e.self:GetSpawnPointY() > 250 and e.other:Class() == "Cleric") then
        local qglobals = eq.get_qglobals(e.other);
        -- we are flagged to spawn the event and we haven't already spawned one
        if (qglobals["cleric20_darkdisciples"] ~= nil and qglobals[e.self:GetID() .. "_darkdisciple"] == nil and qglobals["cleric20_robedropped"] == nil) then
            if (math.random(10) == 1) then
                e.other:Message(MT.Red, "The medallion glows in your hand as the illusion hiding the disciple falters.");
                local mob = eq.spawn2(eq.ChooseRandom(300072, 300073, 300074, 300080), 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading()); -- NPC(s): Dark_Disciple (300072)
                if (mob.valid and math.random(4) == 1) then
                    mob:CastToNPC():AddItem(12433, 1);
                    eq.set_global("cleric20_robedropped", "1", 1, "H1"); -- cool down for this clr
                end
                eq.set_global(e.self:GetID() .. "_darkdisciple", "1", 3, "S30"); -- prevent multiple spawns
            end
        end
    end
end
