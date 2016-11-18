--[[
--  #King_Gelaqua (334041)
--  #Prince_Ilsin (334040)
--  #Prince_Cynin (334039)
--  #Prince_Scyllus (334038)
--  #Prince_Britalic (334037)
--  #Prince_Allin (334036)
--  #Prince_Kiranus (334035)
--  a_crystalline_portal (334034)
--  ###a_crystalline_portal (334113)
--  ##a_crystalline_portal (334112)
--  #####a_crystalline_portal (334115)
--  ####a_crystalline_portal (334114)
--  #a_crystalline_portal (334111)
--  a_snarling_feran (334094)
--  an_icy_orb (334095)
--  a_gelidin_crystal (334110)
--
--  First phase:
--      Kill all Princes
--      Each Prince is linked to one portal
--      Every 40-60 seconds a portal with an active Prince has a chance to spawn
--      an add
--      a snarling feran can be mezzed or killed, spawns after 4 min 30 seconds
--      an icy orb can be rooted/snared and will path towards the king, once it
--      reaches the king it will run towrads a player, if it reaches the player
--      it will split into 4 a geldin crystals which AE and despawn after 7 mins
--  Second phase: (killing all princes triggers)
--      King becomes active and aggros the raid
--      Every 40-60 seconds the King will cause a portal to activate
--      Same adds as First phase
--
--  There is no resetting the event
--
--  Princes and King leashed to room, adds are not
--]]

local portals = {} -- [Prince's NPC Type ID, Portal's mob]
local box = require("aa_box")
local leash_box = box(-130, -680, -460, 360)
local king = nil
local orbstate = {} -- [Spawn ID, chase state]
local timerstate = {} -- [Spawn ID, state of timer for portal adds]
local princecount = 0

-- various functions we use
function CheckLeash(e)
    if not leash_box:contains(e.self:GetX(), e.self:GetY()) then
        e.self:GotoBind()
        e.self:SetHP(e.self:GetMaxHP())
        e.self:WipeHateList()
    end
end

function PortalAdds(mob)
    local id = eq.ChooseRandom(334094, 334095, 0)
    if id > 0 then
        eq.spawn2(id, 0, 0, mob:GetX(), mob:GetY(), mob:GetZ(), mob:GetHeading())
    end
end

function DistanceToWaypoint(self)
    return self:CalculateDistance(self:GetWaypointX(), self:GetWaypointY(), self:GetWaypointZ())
end

function ExploadOrb(mob)
    -- The crystals should be spread out a bit, but they shouldn't go into walls etc
    -- will just spawn here for now
    eq.spawn2(334110, 0, 0, mob:GetX(), mob:GetY(), mob:GetZ(), mob:GetHeading())
    eq.spawn2(334110, 0, 0, mob:GetX(), mob:GetY(), mob:GetZ(), mob:GetHeading())
    eq.spawn2(334110, 0, 0, mob:GetX(), mob:GetY(), mob:GetZ(), mob:GetHeading())
    eq.spawn2(334110, 0, 0, mob:GetX(), mob:GetY(), mob:GetZ(), mob:GetHeading())
    eq.depop()
end

function CheckPortals()
    portals[334040] = eq.unique_spawn(334034, 0, 0, -254.000000, -348.000000, -775.640015, 99.400002) -- Ilsin
    portals[334039] = eq.unique_spawn(334113, 0, 0, -227.350693, -330.371887, -775.744202, 100.375000) -- Cynin
    portals[334038] = eq.unique_spawn(334112, 0, 0, -201.000000, -315.000000, -771.000000, 104.000000) -- Scyllus
    portals[334037] = eq.unique_spawn(334115, 0, 0, 100.360001, -310.549988, -775.650024, 146.600006) -- Britalic
    portals[334036] = eq.unique_spawn(334114, 0, 0, 128.330002, -325.309998, -775.650024, 150.600006) -- Allin
    portals[334035] = eq.unique_spawn(334111, 0, 0, 153.787323, -343.277649, -775.744202, 155.500000) -- Kiranus
end

-- king hooks
function KingSpawn(e)
    king = e.self
    princecount = 0
    eq.unique_spawn(334040, 0, 0, -215.000000, -580.000000, -768.375000, 0.000000) -- Ilsin
    eq.unique_spawn(334039, 0, 0, -181.529999, -579.500000, -775.599976, 0.800000) -- Cynin
    eq.unique_spawn(334038, 0, 0, -148.000000, -580.000000, -768.375000, 0) -- Scyllus
    eq.unique_spawn(334037, 0, 0, 59.000000, -580.000000, -768.375000, 0) -- Britalic
    eq.unique_spawn(334036, 0, 0, 92.400002, -579.369995, -775.599976, 0) -- Allin
    eq.unique_spawn(334035, 0, 0, 127.000000, -580.000000, -768.375000, 0) -- Kiranus
    eq.set_timer("tether", 6000)
    CheckPortals() -- need to verify (#repop can break the encounter loading :P)
    timerstate[e.self:GetID()] = false
end

function KingTimer(e)
    if e.timer == "tether" then
        CheckLeash(e)
    elseif e.timer == "portals" then
        if e.self:IsEngaged() then
            PortalAdds(portals[eq.ChooseRandom(334040, 334039, 334038, 334037, 334036, 334035)])
        else
            eq.stop_timer("portals")
            timerstate[e.self:GetID()] = false
        end
    end
end

function KingCombat(e)
    if e.joined and timerstate[e.self:GetID()] == false then
        eq.set_timer("portals", 40000) -- 40 sec
        timerstate[e.self:GetID()] = true
        -- should we spawn adds?
    end
end

function KingDeath(e)
    king = nil
end

-- prince hooks
function PrinceSpawn(e)
    eq.set_timer("tether", 6000)
    timerstate[e.self:GetID()] = false
    princecount = princecount + 1
end

function PrinceTimer(e)
    if e.timer == "tether" then
        CheckLeash(e)
    elseif e.timer == "portals" then
        if e.self:IsEngaged() then
            PortalAdds(portals[e.self:GetNPCTypeID()])
        else
            eq.stop_timer("portals")
            timerstate[e.self:GetID()] = false
        end
    end
end

function PrinceCombat(e)
    if e.joined and timerstate[e.self:GetID()] == false then
        eq.set_timer("portals", 40000) -- 40 sec
        timerstate[e.self:GetID()] = true
        PortalAdds(portals[e.self:GetNPCTypeID()])
    end
end

function PrinceDeath(e)
    princecount = princecount - 1
    if princecount == 0 then
        king:SetSpecialAbility(SpecialAbility.immune_melee, 0)
        king:SetSpecialAbility(SpecialAbility.immune_magic, 0)
        king:SetSpecialAbility(SpecialAbility.immune_aggro, 0)
    end
end

-- other hooks
function FeranSpawn(e)
    eq.set_timer("depop", 270000) -- 4 min 30 sec
end

function OrbSpawn(e)
    if king ~= nil then
        e.self:MoveTo(king:GetX(), king:GetY(), king:GetZ(), 0, true)
    end
    eq.set_timer("check_dist", 2000)
    orbstate[e.self:GetID()] = 0
end

--[[
-- Using waypoints isn't working for some reason :(
function OrbWaypoint(e)
    if orbstate[e.self:GetID()] == 0 and king ~= nil then
        if e.self:CalculateDistance(king:GetX(), king:GetY(), king:GetZ()) <= 10 then
            local client = eq.get_entity_list():GetRandomClient(-41, -431, -780, 250000)
            if client.valid then
                orbstate[e.self:GetID()] = client:GetID()
                e.self:MoveTo(client:GetX(), client:GetY(), client:GetZ(), 0, true)
            else
                ExploadOrb(e.self) -- ahh I guess so? something went wrong so lets just die :P
            end
        else
            -- okay, king is probably active and moved, so lets mvoe to him again!
            e.self:MoveTo(king:GetX(), king:GetY(), king:GetZ(), 0, true)
        end
    else
        local target = eq.get_entity_list():GetMob(orbstate[e.self:GetID()])
        if target.valid then
            if e.self:CalculateDistance(target:GetX(), target:GetY(), target:GetZ()) <= 3 then
                ExploadOrb(e.self)
            else
                -- must of moved!
                e.self:MoveTo(target:GetX(), target:GetY(), target:GetZ(), 0, true)
            end
        else
            ExploadOrb(e.self)
        end
    end
end
--]]

function CrystalSpawn(e)
    -- need to enable butterfly effect?
    eq.set_timer("depop", 420000) -- 7 min
    e.self:CastSpell(5760, 0) -- Gelaqua's Embrace
    eq.set_timer("ae", 4000) -- 4 sec
end

-- All adds use this function, but they don't all have these timers :P
function AddTimer(e)
    if e.timer == "depop" then
        eq.depop()
    elseif e.timer == "ae" then
        e.self:CastSpell(5760, 0) -- Gelaqua's Embrace
    elseif e.timer == "check_dist" then
        -- still walking to king
        if orbstate[e.self:GetID()] == 0 and king ~= nil then
            -- if he is active, he might of moved, maybe better way to do this
            e.self:MoveTo(king:GetX(), king:GetY(), king:GetZ(), 0, true)
            if DistanceToWaypoint(e.self) <= 10 then
                local client = eq.get_entity_list():GetRandomClient(-41, -431, -780, 250000) -- TODO: fix range
                if client.valid then
                    orbstate[e.self:GetID()] = client:GetID()
                    e.self:MoveTo(client:GetX(), client:GetY(), client:GetZ(), 0, true)
                else
                    ExploadOrb(e.self) -- ahh I guess so? something went wrong so lets just die :P
                end
            end
        else
            local target = eq.get_entity_list():GetMob(orbstate[e.self:GetID()])
            if target.valid then
                e.self:MoveTo(target:GetX(), target:GetY(), target:GetZ(), 0, true)
                if DistanceToWaypoint(e.self) <= 3 then
                    ExploadOrb(e.self)
                end
            else
                ExploadOrb(e.self)
            end
        end
    end
end

function event_encounter_load(e)
    eq.register_npc_event("king", Event.spawn, 334041, KingSpawn)
    eq.register_npc_event("king", Event.timer, 334041, KingTimer)
    eq.register_npc_event("king", Event.combat, 334041, KingCombat)
    eq.register_npc_event("king", Event.death_complete, 334041, KingDeath)

    eq.register_npc_event("king", Event.spawn, 334040, PrinceSpawn)
    eq.register_npc_event("king", Event.spawn, 334039, PrinceSpawn)
    eq.register_npc_event("king", Event.spawn, 334038, PrinceSpawn)
    eq.register_npc_event("king", Event.spawn, 334037, PrinceSpawn)
    eq.register_npc_event("king", Event.spawn, 334036, PrinceSpawn)
    eq.register_npc_event("king", Event.spawn, 334035, PrinceSpawn)
    eq.register_npc_event("king", Event.timer, 334040, PrinceTimer)
    eq.register_npc_event("king", Event.timer, 334039, PrinceTimer)
    eq.register_npc_event("king", Event.timer, 334038, PrinceTimer)
    eq.register_npc_event("king", Event.timer, 334037, PrinceTimer)
    eq.register_npc_event("king", Event.timer, 334036, PrinceTimer)
    eq.register_npc_event("king", Event.timer, 334035, PrinceTimer)
    eq.register_npc_event("king", Event.combat, 334040, PrinceCombat)
    eq.register_npc_event("king", Event.combat, 334039, PrinceCombat)
    eq.register_npc_event("king", Event.combat, 334038, PrinceCombat)
    eq.register_npc_event("king", Event.combat, 334037, PrinceCombat)
    eq.register_npc_event("king", Event.combat, 334036, PrinceCombat)
    eq.register_npc_event("king", Event.combat, 334035, PrinceCombat)
    eq.register_npc_event("king", Event.death_complete, 334040, PrinceDeath)
    eq.register_npc_event("king", Event.death_complete, 334039, PrinceDeath)
    eq.register_npc_event("king", Event.death_complete, 334038, PrinceDeath)
    eq.register_npc_event("king", Event.death_complete, 334037, PrinceDeath)
    eq.register_npc_event("king", Event.death_complete, 334036, PrinceDeath)
    eq.register_npc_event("king", Event.death_complete, 334035, PrinceDeath)

    eq.register_npc_event("king", Event.spawn, 334094, FeranSpawn)
    eq.register_npc_event("king", Event.timer, 334094, AddTimer)

    eq.register_npc_event("king", Event.spawn, 334095, OrbSpawn)
    eq.register_npc_event("king", Event.timer, 334095, AddTimer)
    --eq.register_npc_event("king", Event.waypoint_arrive, 334095, OrbWaypoint)

    eq.register_npc_event("king", Event.spawn, 334110, CrystalSpawn)
    eq.register_npc_event("king", Event.timer, 334110, AddTimer)

    -- spawn portals
    CheckPortals()
    king = eq.get_entity_list():GetMob(334041) -- incase he's up already for some reason
end

function event_encounter_unload(e)
end

