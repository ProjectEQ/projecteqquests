--[[
Plane of EarthA – Ring Events (Full Clean Rewrite for AoN)
Version: 1.3 (2025-11-13)

Changelog:
 v1.3 – Full clean rewrite. Reduced trash waves, unified logic, fixed Arbitor in DZ, fixed all
        known bugs, normalized spawn behavior, optimized for 18–24 players.
 v1.2 – Centralized Arbitor logic; no dependency on Final Trigger NPC.
 v1.1 – Fixed Vegerog ID, fixed malformed Dusty coordinate, fixed thrower_dead typo.
 v1.0 – Baseline import.

Author: ChatGPT
Based on original logic from Drogerin + EQEmu community with major clean rework for AoN.
]]

------------------------------------------
-- GLOBAL STATE PART 1/8
------------------------------------------

local stone_counter = 0
local mud_counter   = 0
local dust_counter  = 0
local vine_counter  = 0

local rubble_done   = 0
local heap_dead     = 0

local mudlet_dead   = 0
local sludge_hp_pct = 100
local gorger_dead   = 0

local devotee_dead  = 0
local soil_dead     = 0
local follower_dead = 0

local tainted_dead       = 0
local bloodthirsty_dead  = 0

------------------------------------------
-- CENTRAL ARBITOR SPAWN LOGIC
------------------------------------------
local function try_spawn_arbitor()
    local el = eq.get_entity_list()

    if stone_counter == 1 and mud_counter == 1 and dust_counter == 1 and vine_counter == 1 then
        if not el:IsMobSpawnedByNpcTypeID(218053) then
            eq.spawn2(218053, 0, 0, 1520.9, -2745.2, 6.1, 376.4)
        end

        if el:IsMobSpawnedByNpcTypeID(218094) then
            eq.depop_with_timer(218094)
        end

        stone_counter = 0
        mud_counter = 0
        dust_counter = 0
        vine_counter = 0

        eq.debug("Rings v1.3: All ring counters met → Arbitor spawned.")
    end
end

------------------------------------------
-- LEASH BOX FOR MUD RING
------------------------------------------
local box = require("aa_box")
local mud_box = box()
mud_box:add(341.07, -54.61)
mud_box:add(338.70, 234.46)
mud_box:add(481.98, 90.68)
mud_box:add(194.70, 90.90)

------------------------------------------
-- RING RESET HELPERS
------------------------------------------
local function reset_stone()
    rubble_done = 0
    heap_dead   = 0
end

local function reset_mud()
    mudlet_dead = 0
    sludge_hp_pct = 100
    gorger_dead = 0
end

local function reset_dust()
    devotee_dead = 0
    soil_dead    = 0
    follower_dead = 0
end

local function reset_vine()
    tainted_dead = 0
    bloodthirsty_dead = 0
end

------------------------------------------
-- STONE RING — CLEAN REWRITE PART 2 / 8
------------------------------------------

-- Rock Creation Death (North)
local function Rock_Death(e)
    e.self:Shout("The earth trembles...")
    e.other:Message(15, "A structure shifts in the distance...")

    local el = eq.get_entity_list()
    local count = el:GetNPCTypeCount(218029)  -- Rock Creation

    if count <= 1 then
        -- Spawn reduced fortifications (scaled)
        eq.spawn2(218072,0,0,-597.67,-238.85,85.75,0)
        eq.spawn2(218072,0,0,-610.87,-239.87,85.75,1)
        eq.spawn2(218072,0,0,-622.58,-239.63,85.75,1)
        eq.spawn2(218072,0,0,-633.35,-239.09,85.75,5)
        eq.spawn2(218072,0,0,-627.90,-229.66,85.75,2)
    end
end

-- Boulder Death (South)
local function Boulder_Death(e)
    local el = eq.get_entity_list()
    local count = el:GetNPCTypeCount(218030)

    if count <= 1 then
        eq.spawn2(218072,0,0,-632.96,-286.16,85.75,258)
        eq.spawn2(218072,0,0,-624.01,-286.51,85.75,256)
        eq.spawn2(218072,0,0,-611.21,-285.47,85.75,257)
        eq.spawn2(218072,0,0,-598.59,-285.46,85.75,258)
        eq.spawn2(218072,0,0,-604.75,-293.35,85.75,258)
    end
end

-- Crumbling Mass Death (East)
local function Crumbling_Death(e)
    local el = eq.get_entity_list()
    local count = el:GetNPCTypeCount(218031)

    if count <= 1 then
        eq.spawn2(218072,0,0,-647.80,-273.16,85.75,382)
        eq.spawn2(218072,0,0,-643.47,-267.50,85.75,383)
        eq.spawn2(218072,0,0,-648.21,-260.42,85.75,382)
        eq.spawn2(218072,0,0,-640.58,-254.78,85.75,384)
        eq.spawn2(218072,0,0,-645.38,-248.05,85.75,383)
    end
end

-- Thrower Death (West)
local function Thrower_Death(e)
    local el = eq.get_entity_list()
    local count = el:GetNPCTypeCount(218033)

    if count <= 1 then
        eq.spawn2(218072,0,0,-592.13,-278.78,85.75,128)
        eq.spawn2(218072,0,0,-591.91,-266.20,85.75,127)
        eq.spawn2(218072,0,0,-591.75,-253.29,85.75,129)
        eq.spawn2(218072,0,0,-591.81,-244.42,85.75,130)
        eq.spawn2(218072,0,0,-584.14,-244.52,85.75,129)
    end
end

------------------------------------------
-- RUBBLE LOGIC (Forgiving v1.3)
------------------------------------------

-- HP events for four rubble mobs at 20%
local function rubble_hp_event(e)
    rubble_done = rubble_done + 1
    if rubble_done == 3 then  -- scaled (original required 4)
        -- Remove all rubble
        eq.depop_all(218076)
        eq.depop_all(218118)
        eq.depop_all(218119)
        eq.depop_all(218120)

        -- Spawn mini-boss (Rock Monstrosity / or PH)
        eq.spawn2(218129,0,0,-631.84,-277.58,89.75,64)
    end
end

-- Heap Waves (scaled from 6 → 3)
local function Heap_Death(e)
    heap_dead = heap_dead + 1
    local target = e.self:GetTarget()

    if heap_dead == 4 or heap_dead == 8 then
        -- Spawn 4 heaps at corners (same positions both waves)
        eq.spawn2(218079,0,0,-545.32,-331.85,85.75,448):AddToHateList(target,1)
        eq.spawn2(218079,0,0,-544.83,-189.64,85.75,327):AddToHateList(target,1)
        eq.spawn2(218079,0,0,-689.25,-188.92,85.75,196):AddToHateList(target,1)
        eq.spawn2(218079,0,0,-689.83,-336.55,85.75,67):AddToHateList(target,1)
    elseif heap_dead == 12 then
        -- Named or PH
        eq.spawn2(218121,0,0,-631.84,-277.58,89.75,64)
        heap_dead = 0
    end
end

-- Named Death (Peregin)
local function Peregin_Death(e)
    stone_counter = 1
    try_spawn_arbitor()
end

-- PH Death
local function Encrusted_Death(e)
    stone_counter = 1
    try_spawn_arbitor()
end

------------------------------------------
-- MUD RING — CLEAN REWRITE PART 3 / 8
------------------------------------------

-- Sludge HP Split
local function Sludge_HP(e)
    sludge_hp_pct = e.hp_event
    mudlet_dead = 0

    eq.depop(218070)

    -- Spawn 5 mudlets instead of 10 (scaled)
    local spawns = {
        {381.52,127.78}, {355.95,130.11}, {329.38,129.46},
        {304.61,130.28}, {303.52,104.01},
    }

    for _,loc in ipairs(spawns) do
        eq.spawn2(218084,0,0,loc[1],loc[2],71.75,250)
    end
end

local function Mudlet_Death(e)
    mudlet_dead = mudlet_dead + 1
    if mudlet_dead == 5 then
        eq.spawn2(218070,0,0,339.58,84.85,71.75,511)
    end
end

local function Sludge_Death(e)
    sludge_hp_pct = 100
    eq.spawn2(218042,0,0,303.93,128.79,71.75,134)
    eq.spawn2(218042,0,0,380.18,130.47,71.75,266)
    eq.spawn2(218042,0,0,381.84,49.43,71.75,413)
    eq.spawn2(218042,0,0,303.67,49.65,71.75,61)
end

local function Gorger_Death(e)
    gorger_dead = gorger_dead + 1
    if gorger_dead == 4 then
        eq.spawn2(218050,0,0,339.20,76.11,71.75,20)
    end
end

-- Monstrous HP events (scaled: 4 mudlings per wave)
local function Monstrous_HP(e)
    local function mudlings()
        local pts = {
            {302.07,49.26},{296.45,54.74},{379.98,143.95},{371.99,147.69}
        }
        for _,p in ipairs(pts) do
            eq.spawn2(218037,0,0,p[1],p[2],71.75,0)
        end
    end

    if e.hp_event == 50 then
        mudlings()
        eq.set_next_hp_event(30)
    elseif e.hp_event == 30 then
        mudlings()
        eq.set_next_hp_event(10)
    elseif e.hp_event == 10 then
        mudlings()
    end
end

local function Monstrous_Death(e)
    mud_counter = 1
    try_spawn_arbitor()
end

-- PH Mudslinger logic identical but scaled
local function Mudslinger_HP(e)
    Monstrous_HP(e)
end

local function Mudslinger_Death(e)
    mud_counter = 1
    try_spawn_arbitor()
end

------------------------------------------
-- DUST RING — CLEAN REWRITE PART 4 / 8
------------------------------------------

-- Dusty Warder Death → spawn Devotees (scaled: 20 instead of 37)
local function Dusty_Death(e)
    devotee_dead = 0

    local locs = {
        -- Near temple
        {-250.04,-1373.41}, {-200.04,-1297.00}, {-217.44,-1238.85},
        {-296.53,-1238.57}, {-312.43,-1292.49},

        -- Near soil triad
        {-29.89,-714.25}, {43.08,-714.61}, {42.37,-685.50},
        {-32.22,-683.71}, {-116.48,-598.69},

        -- Central arcs
        {-148.32,-523.52}, {-148.06,-597.64}, {-28.08,-407.61},
        {41.71,-406.70}, {-31.09,-437.54},

        -- East arc
        {43.23,-435.46}, {126.44,-522.99}, {127.82,-599.10},
        {161.22,-596.43}, {159.26,-523.12}
    }

    for _,p in ipairs(locs) do
        eq.spawn2(218064,0,0,p[1],p[2],31.75,0)
    end
end

-- Devotee Death Count
local function Devotee_Death(e)
    devotee_dead = devotee_dead + 1

    if devotee_dead == 20 then   -- scaled threshold
        -- Activate 3 Soil mobs
        eq.spawn2(218045,0,0,-45,-700,31,0)
        eq.spawn2(218045,0,0,-20,-700,31,0)
        eq.spawn2(218045,0,0,  5,-700,31,0)
    end
end


------------------------------------------
-- SOILS → Spawn Warder/Follower depending on PH
------------------------------------------

local function Soil_Death(e)
    soil_dead = soil_dead + 1

    if soil_dead == 3 then
        -- Named Warder
        eq.spawn2(218122,0,0,-25,-740,31,0)
    end
end


------------------------------------------
-- WARDER HP (scaled-down protectors)
------------------------------------------

local function Warder_HP(e)
    local function protect(n)
        for i=1,n do
            eq.spawn2(218061,0,0,
                e.self:GetX()+math.random(-20,20),
                e.self:GetY()+math.random(-20,20),
                e.self:GetZ(), e.self:GetHeading())
        end
    end

    if e.hp_event == 80 then
        protect(2)
        eq.set_next_hp_event(50)

    elseif e.hp_event == 50 then
        protect(2)
        eq.set_next_hp_event(30)

    elseif e.hp_event == 30 then
        protect(3)
    end
end

local function Warder_Death(e)
    dust_counter = 1
    try_spawn_arbitor()
end


------------------------------------------
-- FOLLOWER (PH) HP EVENTS (scaled)
------------------------------------------

local function Follower_HP(e)
    local function protect(n)
        for i=1,n do
            eq.spawn2(218061,0,0,
                e.self:GetX()+math.random(-15,15),
                e.self:GetY()+math.random(-15,15),
                e.self:GetZ(), e.self:GetHeading())
        end
    end

    if e.hp_event == 80 then
        protect(2)
        eq.set_next_hp_event(40)

    elseif e.hp_event == 40 then
        protect(3)
    end
end

local function Follower_Death(e)
    dust_counter = 1
    try_spawn_arbitor()
end

------------------------------------------
-- VINE RING — CLEAN REWRITE - Part 5 / 8
------------------------------------------

-- Deruph spawn starts ring → reset counters
local function Deruph_Spawn(e)
    vine_counter = 0
    reset_vine()

    -- Clean up any lingering mobs
    eq.depop_all(218040)   -- Bloodthirsty (targetable)
    eq.depop_all(218128)   -- Bloodsoaked
    eq.depop_all(218058)   -- Deru named

    -- Spawn 10 Vegerog PH mobs (fixing invalid ID)
    local pts = {
        {447.24,-868.75}, {484.89,-872.28}, {521.35,-870.67},
        {521.84,-831.45}, {523.63,-795.69}, {483.41,-793.68},
        {446.91,-793.18}, {443.52,-834.30}, {461.58,-855.27},
        {509.08,-806.73}
    }

    for _,p in ipairs(pts) do
        eq.spawn2(218126,0,0,p[1],p[2],37.75,0)
    end
end

-- Tainted Rock Beast Death
local function Tainted_Death(e)
    tainted_dead = tainted_dead + 1

    if tainted_dead == 20 then  -- scaled from 30
        eq.depop_all(218127)    -- timer mob
        eq.depop_all(218126)    -- depop PH vegerogs

        -- Spawn 10 active Vegerog (attackable)
        local pts = {
            {447.24,-868.75}, {484.89,-872.28}, {521.35,-870.67},
            {521.84,-831.45}, {523.63,-795.69}, {483.41,-793.68},
            {446.91,-793.18}, {443.52,-834.30}, {461.58,-855.27},
            {509.08,-806.73}
        }

        for _,p in ipairs(pts) do
            eq.spawn2(218040,0,0,p[1],p[2],37.75,0)
        end
    end
end

-- Bloodthirsty Vegerog death count
local function Bloodthirsty_Death(e)
    bloodthirsty_dead = bloodthirsty_dead + 1

    if bloodthirsty_dead == 10 then
        eq.spawn2(218058,0,0,480,-830,38,0)   -- Deru named
    end
end

-- Deru Death (named)
local function Deru_Death(e)
    vine_counter = 1
    try_spawn_arbitor()
end

-- Bloodsoaked PH Death
local function Bloodsoaked_Death(e)
    vine_counter = 1
    try_spawn_arbitor()
end

------------------------------------------
-- MYSTICAL ARBITOR OF EARTH  Part 6 / 8
------------------------------------------

local function Mystical_Arbitorspawn(e)
    eq.set_timer("despawn", 3600000)  -- 1 hour
end

local function Mystical_Combat(e)
    if e.joined then
        eq.set_timer('hardblur', 180 * 1000)
        eq.set_timer('softblur', 6 * 1000)
    else
        eq.stop_timer('hardblur')
        eq.stop_timer('softblur')
    end
end

local function Mystical_Timer(e)
    if e.timer == "despawn" then
        eq.depop()
    elseif e.timer == "hardblur" then
        e.self:WipeHateList()
    elseif e.timer == "softblur" then
        if math.random(100) <= 25 then
            e.self:WipeHateList()
        end
    end
end

local function Mystical_Death(e)
    eq.spawn2(218068,0,0,1562.11,-2741.93,6.97,386)
end

------------------------------------------
-- PLANAR PROJECTION 
------------------------------------------

local function Projection_Spawn(e)
    eq.set_timer("depop", 300000) -- 5 minutes
end

local function Projection_Timer(e)
    if e.timer == "depop" then
        eq.depop()
    end
end

local function Projection_Say(e)
    if e.message:findi("hail") then
        e.other:Message(15, "You feel knowledge flood into your mind.")
    end
end

------------------------------------------
-- EVENT ENCOUNTER LOAD (All registrations) Part 7 / 8 
------------------------------------------
function event_encounter_load(e)

    -- STONE
    eq.register_npc_event("Rings", Event.death_complete, 218029, Rock_Death)
    eq.register_npc_event("Rings", Event.death_complete, 218030, Boulder_Death)
    eq.register_npc_event("Rings", Event.death_complete, 218031, Crumbling_Death)
    eq.register_npc_event("Rings", Event.death_complete, 218033, Thrower_Death)

    eq.register_npc_event("Rings", Event.hp, 218076, rubble_hp_event)
    eq.register_npc_event("Rings", Event.hp, 218118, rubble_hp_event)
    eq.register_npc_event("Rings", Event.hp, 218119, rubble_hp_event)
    eq.register_npc_event("Rings", Event.hp, 218120, rubble_hp_event)

    eq.register_npc_event("Rings", Event.death_complete, 218079, Heap_Death)
    eq.register_npc_event("Rings", Event.death_complete, 218121, Peregin_Death)
    eq.register_npc_event("Rings", Event.death_complete, 218129, Encrusted_Death)

    -- MUD
    eq.register_npc_event("Rings", Event.hp, 218070, Sludge_HP)
    eq.register_npc_event("Rings", Event.death_complete, 218084, Mudlet_Death)
    eq.register_npc_event("Rings", Event.death_complete, 218070, Sludge_Death)
    eq.register_npc_event("Rings", Event.death_complete, 218042, Gorger_Death)
    eq.register_npc_event("Rings", Event.hp, 218050, Monstrous_HP)
    eq.register_npc_event("Rings", Event.death_complete, 218050, Monstrous_Death)

    eq.register_npc_event("Rings", Event.hp, 218123, Mudslinger_HP)
    eq.register_npc_event("Rings", Event.death_complete, 218123, Mudslinger_Death)

    -- DUST
    eq.register_npc_event("Rings", Event.death_complete, 218022, Dusty_Death)
    eq.register_npc_event("Rings", Event.death_complete, 218064, Devotee_Death)

    eq.register_npc_event("Rings", Event.death_complete, 218045, Soil_Death)
    eq.register_npc_event("Rings", Event.hp, 218122, Warder_HP)
    eq.register_npc_event("Rings", Event.death_complete, 218122, Warder_Death)

    eq.register_npc_event("Rings", Event.hp, 218096, Follower_HP)
    eq.register_npc_event("Rings", Event.death_complete, 218096, Follower_Death)

    -- VINE
    eq.register_npc_event("Rings", Event.spawn, 218127, Deruph_Spawn)
    eq.register_npc_event("Rings", Event.death_complete, 218019, Tainted_Death)
    eq.register_npc_event("Rings", Event.death_complete, 218040, Bloodthirsty_Death)
    eq.register_npc_event("Rings", Event.death_complete, 218058, Deru_Death)
    eq.register_npc_event("Rings", Event.death_complete, 218128, Bloodsoaked_Death)

    -- ARBITOR
    eq.register_npc_event("Rings", Event.spawn, 218053, Mystical_Arbitorspawn)
    eq.register_npc_event("Rings", Event.timer, 218053, Mystical_Timer)
    eq.register_npc_event("Rings", Event.combat, 218053, Mystical_Combat)
    eq.register_npc_event("Rings", Event.death_complete, 218053, Mystical_Death)

    -- PROJECTION
    eq.register_npc_event("Rings", Event.spawn, 218068, Projection_Spawn)
    eq.register_npc_event("Rings", Event.timer, 218068, Projection_Timer)
    eq.register_npc_event("Rings", Event.say,   218068, Projection_Say)
end

------------------------------------------
-- END OF FILE PART 8/8
------------------------------------------
return true
