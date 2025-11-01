function event_say(e)
    local client = e.other
    local dz = client:GetExpedition()
    local here = eq.get_zone_short_name()

    if e.message:findi("hail") then
        if dz.valid and dz:GetZoneName() == here then
            e.self:Say("Tell me when you're [" .. eq.say_link("ready") .. "] to enter.")
        else
            e.self:Say("Would you like to [" .. eq.say_link("request") .. "] an expedition for this area?")
        end

    elseif e.message:findi("request") then
        -- Create the expedition WITHOUT using the player's current XYZH.
        -- We'll set the actual zone-in on "ready".
        local aoc_raid = {
            expedition = { name = here .. " Expedition", min_players = 1, max_players = 72 },
            instance   = { zone = here, version = 1, duration = eq.seconds("7d") },

            -- Use something harmless as a temporary default. NPC loc is fine.
            -- We'll overwrite on "ready".
            safereturn = { zone = here, x = e.self:GetX(), y = e.self:GetY(), z = e.self:GetZ(), h = e.self:GetHeading() },
            zonein     = { x = e.self:GetX(), y = e.self:GetY(), z = e.self:GetZ(), h = e.self:GetHeading() },
        }

        local new_dz = client:CreateExpedition(aoc_raid)
        new_dz:AddReplayLockout(eq.seconds("9h"))

        e.self:Say("Your expedition for this area has been created. Tell me when you're [" .. eq.say_link("ready") .. "] to enter.")

    elseif (dz.valid and dz:GetZoneName() == here and e.message:findi("ready")) then
        -- Capture the player's XYZH *now* (e.g., at the second AoC or wherever they landed).
        local x = client:GetX()
        local y = client:GetY()
        local z = client:GetZ()
        local h = client:GetHeading()

        -- If available, update the expedition's zone-in / safe return to these live coords.
        -- (Some EQEmu builds expose these; safe to guard-check.)
        if dz.SetZoneInLocation then
            dz:SetZoneInLocation(x, y, z, h)
        end
        if dz.SetSafeReturn then
            dz:SetSafeReturn(here, x, y, z, h)
        end

        -- Move them into the DZ. If your server supports coordinates in MovePCDynamicZone,
        -- you can use: client:MovePCDynamicZone(here, x, y, z, h)
        -- The no-args form respects the expedition's current zone-in (which we just set above).
        client:MovePCDynamicZone(here)
    end
end
