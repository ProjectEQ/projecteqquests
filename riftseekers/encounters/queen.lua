--[[
--  #Queen_Pyrilonis (334049)
--  #Princess_Zulaqua (334048)
--  #Princess_Yelnia (334047)
--  #Princess_Quellon (334045)
--  #Princess_Puja (334043)
--  #Princess_Lana (334044)
--  #Princess_Kira (334046)
--  a_crystalline_portal (334042)
--  a_crystalline_portal (334116)
--  a_crystalline_portal (334117)
--  a_crystalline_portal (334118)
--  a_crystalline_portal (334119)
--  a_crystalline_portal (334120)
--  a_raging_chimera (334085)
--  a_fire_construct (334086)
--
--  First phase:
--      Kill all Princesses
--      Each Princess is linked to one portal
--      Every 40-60 seconds a portal with an active Princess has a chance to spawn
--      an add
--      a raging chimera can be mezzed or killed, spawns after 4 min 30 seconds
--      a fire construct can be rooted/snared and will path towards the Queen, once it
--      reaches the Queen it will run towards a player, if it reaches the player
--      it will cast Pyrilonis' Vegeance and die (or depop?)
--  Second phase: (killing all princes triggers)
--      Queen becomes active and aggros the raid
--      Every 40-60 seconds the Queen will cause a portal to activate
--      A bomb will always spawn when the Queen activates a portal
--
--  There is no resetting the event
--
--  Princesses and Queen leashed to room, adds are not
--]]

local portals = {} -- [Princess' NPC Type ID, Portal's mob]
local box = require("aa_box")
local leash_box = box(-250, -793, -160, 580)
local queen = nil
local bombstate = {} -- [Spawn ID, chase state]
local timerstate = {} -- [Spawn ID, state of timer for portal adds]
local princesscount = 0

-- various functions we use
function CheckLeash(e)
    if not leash_box:contains(e.self:GetX(), e.self:GetY()) then
        e.self:GotoBind()
        e.self:SetHP(e.self:GetMaxHP())
        e.self:WipeHateList()
    end
end

function PortalAdds(mob)
    local id = eq.ChooseRandom(334085, 334086, 0)
    if id > 0 then
        eq.spawn2(id, 0, 0, mob:GetX(), mob:GetY(), mob:GetZ(), mob:GetHeading())
    end
end

function DistanceToWaypoint(self)
    return self:CalculateDistance(self:GetWaypointX(), self:GetWaypointY(), self:GetWaypointZ())
end

function CheckPortals()
    portals[334048] = eq.unique_spawn(334042, 0, 0, -10.410000, -460.600006, 301.529999, 102.199997) -- Zulaqua
    portals[334047] = eq.unique_spawn(334116, 0, 0, 20.139999, -448.910004, 301.519989, 105.599998) -- Yelnia
    portals[334045] = eq.unique_spawn(334117, 0, 0, 360.079987, -437.690002, 301.519989, 146.600006) -- Quellon
    portals[334043] = eq.unique_spawn(334118, 0, 0, 433, -467, 301.437286, 152.750000) -- Puja
    portals[334044] = eq.unique_spawn(334119, 0, 0, 401.299988, -446.410004, 301.529999, 151.199997) -- Lana
    portals[334046] = eq.unique_spawn(334120, 0, 0, 46, -439, 305, 104) -- Kira
end

-- Queen hooks
function QueenSpawn(e)
    queen = e.self
    princesscount = 0
    eq.unique_spawn(334048, 0, 0, 25, -725, 308.750000, 0) -- Zulaqua
    eq.unique_spawn(334047, 0, 0, 64.239998, -725.890015, 301.559998, 255.600006) -- Yelnia
    eq.unique_spawn(334045, 0, 0, 310.910004, -726.130005, 301.464203, 0) -- Quellon
    eq.unique_spawn(334043, 0, 0, 387.399994, -727.260010, 301.464233, 0) -- Puja
    eq.unique_spawn(334044, 0, 0, 348.929993, -726.700012, 301.464233, 0) -- Lana
    eq.unique_spawn(334046, 0, 0, 101.529999, -725.630005, 301.464203, 0.75) -- Kira
    eq.set_timer("tether", 6000)
    CheckPortals() -- need to verify (#repop can break the encounter loading :P)
    timerstate[e.self:GetID()] = false
end

function QueenTimer(e)
    if e.timer == "tether" then
        CheckLeash(e)
    elseif e.timer == "portals" then
        if e.self:IsEngaged() then
            local portal = portals[eq.ChooseRandom(334048, 334047, 334045, 334043, 334044, 334046)]
            eq.spawn2(334086, 0, 0, portal:GetX(), portal:GetY(), portal:GetZ(), portal:GetHeading())
        else
            eq.stop_timer("portals")
            timerstate[e.self:GetID()] = false
        end
    end
end

function QueenCombat(e)
    if e.joined and timerstate[e.self:GetID()] == false then
        eq.set_timer("portals", 40000) -- 40 sec
        timerstate[e.self:GetID()] = true
        -- should we spawn adds?
    end
end

function QueenDeath(e)
    queen = nil
end

-- prince hooks
function PrincessSpawn(e)
    eq.set_timer("tether", 6000)
    timerstate[e.self:GetID()] = false
    princesscount = princesscount + 1
end

function PrincessTimer(e)
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

function PrincessCombat(e)
    if e.joined and timerstate[e.self:GetID()] == false then
        eq.set_timer("portals", 40000) -- 40 sec
        timerstate[e.self:GetID()] = true
        PortalAdds(portals[e.self:GetNPCTypeID()])
    end
end

function PrincessDeath(e)
    princesscount = princesscount - 1
    if princesscount == 0 then
        queen:SetSpecialAbility(SpecialAbility.immune_melee, 0)
        queen:SetSpecialAbility(SpecialAbility.immune_magic, 0)
        queen:SetSpecialAbility(SpecialAbility.immune_aggro, 0)
        queen:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0)
    end
end

-- other hooks
function ChimeraSpawn(e)
    eq.set_timer("depop", 270000) -- 4 min 30 sec
end

function BombSpawn(e)
    if queen ~= nil then
        e.self:MoveTo(queen:GetX(), queen:GetY(), queen:GetZ(), 0, true)
    end
    eq.set_timer("check_dist", 2000)
    bombstate[e.self:GetID()] = 0
end

-- All adds use this function, but they don't all have these timers :P
function AddTimer(e)
    if e.timer == "depop" then
        eq.depop()
    elseif e.timer == "check_dist" then
        -- still walqueen to queen
        if bombstate[e.self:GetID()] == 0 and queen ~= nil then
            -- if he is active, he might of moved, maybe better way to do this
            e.self:MoveTo(queen:GetX(), queen:GetY(), queen:GetZ(), 0, true)
            if DistanceToWaypoint(e.self) <= 10 then
                local client = eq.get_entity_list():GetRandomClient(197, -556, 296, 250000) -- TODO: fix range
                if client.valid then
                    bombstate[e.self:GetID()] = client:GetID()
                    e.self:SetRunning(true)
                    e.self:MoveTo(client:GetX(), client:GetY(), client:GetZ(), 0, true)
                else
                    e.self:CastSpell(5745, 0) -- Pyrilonis' Vengeance
                    eq.depop() -- ahh I guess so? something went wrong so lets just die :P
                end
            end
        else
            local target = eq.get_entity_list():GetMob(bombstate[e.self:GetID()])
            if target.valid then
                e.self:MoveTo(target:GetX(), target:GetY(), target:GetZ(), 0, true)
                if DistanceToWaypoint(e.self) <= 3 then
                    e.self:CastSpell(5745, 0) -- Pyrilonis' Vengeance
                    eq.depop()
                end
            else
                e.self:CastSpell(5745, 0) -- Pyrilonis' Vengeance
                eq.depop() -- ahh I guess so? something went wrong so lets just die :P
            end
        end
    end
end

function event_encounter_load(e)
    eq.register_npc_event("queen", Event.spawn, 334049, QueenSpawn)
    eq.register_npc_event("queen", Event.timer, 334049, QueenTimer)
    eq.register_npc_event("queen", Event.combat, 334049, QueenCombat)
    eq.register_npc_event("queen", Event.death_complete, 334049, QueenDeath)

    eq.register_npc_event("queen", Event.spawn, 334048, PrincessSpawn)
    eq.register_npc_event("queen", Event.spawn, 334047, PrincessSpawn)
    eq.register_npc_event("queen", Event.spawn, 334045, PrincessSpawn)
    eq.register_npc_event("queen", Event.spawn, 334043, PrincessSpawn)
    eq.register_npc_event("queen", Event.spawn, 334044, PrincessSpawn)
    eq.register_npc_event("queen", Event.spawn, 334046, PrincessSpawn)
    eq.register_npc_event("queen", Event.timer, 334048, PrincessTimer)
    eq.register_npc_event("queen", Event.timer, 334047, PrincessTimer)
    eq.register_npc_event("queen", Event.timer, 334045, PrincessTimer)
    eq.register_npc_event("queen", Event.timer, 334043, PrincessTimer)
    eq.register_npc_event("queen", Event.timer, 334044, PrincessTimer)
    eq.register_npc_event("queen", Event.timer, 334046, PrincessTimer)
    eq.register_npc_event("queen", Event.combat, 334048, PrincessCombat)
    eq.register_npc_event("queen", Event.combat, 334047, PrincessCombat)
    eq.register_npc_event("queen", Event.combat, 334045, PrincessCombat)
    eq.register_npc_event("queen", Event.combat, 334043, PrincessCombat)
    eq.register_npc_event("queen", Event.combat, 334044, PrincessCombat)
    eq.register_npc_event("queen", Event.combat, 334046, PrincessCombat)
    eq.register_npc_event("queen", Event.death_complete, 334048, PrincessDeath)
    eq.register_npc_event("queen", Event.death_complete, 334047, PrincessDeath)
    eq.register_npc_event("queen", Event.death_complete, 334045, PrincessDeath)
    eq.register_npc_event("queen", Event.death_complete, 334043, PrincessDeath)
    eq.register_npc_event("queen", Event.death_complete, 334044, PrincessDeath)
    eq.register_npc_event("queen", Event.death_complete, 334046, PrincessDeath)

    eq.register_npc_event("queen", Event.spawn, 334085, ChimeraSpawn)
    eq.register_npc_event("queen", Event.timer, 334085, AddTimer)

    eq.register_npc_event("queen", Event.spawn, 334086, BombSpawn)
    eq.register_npc_event("queen", Event.timer, 334086, AddTimer)

    -- spawn portals
    CheckPortals()
    local temp = eq.get_entity_list():GetMobByNpcTypeID(334049) -- incase he's up already for some reason
    if temp.valid then
        queen = temp:CastToNPC()
    else
        queen = nil
    end
end

function event_encounter_unload(e)
end

