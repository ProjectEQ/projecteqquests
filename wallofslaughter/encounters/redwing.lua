--[[
-- #Pyrique_Redwing (300043)
--
-- When she is brought to 80%, she will depop and spawn 6 Shadows
-- Emotes: Pyrique Redwing laughs as her body shimmers and splits into six identical shadows.
--
-- One of the 6 shadows will be the real shadow, which hits higher and cons raid
-- Real: Pyrique`s_Shadow (300101)
-- Fake: Pyrique`s_Shadow (300102)
--
-- Every 40 seconds the Shadows will depop and shuffle locations (repop so full HP etc)
-- On repop if the real shadow is less than or equal to 90% HP it will emote:
-- Pyrique`s Shadow staggers backward as her shadowy duplicates fade away.
--
-- If you fail to do enough damage you see:
-- A soft feminine voice laughs as the shadows shimmer and reform.
--
-- After getting the emote 6 times, the shadows depop and Redwing spawns again and is killable
-- #Pyrique_Redwing (300103)
-- enter combat emotes are different after repop, so I guess it's a new NPC
--]]

local shadow_counters = 6

local locs = {
    [1] = {661, -20, 135, 62},
    [2] = {689, -25, 135, 2},
    [3] = {722, -17, 135, 443},
    [4] = {722, 39, 135, 325},
    [5] = {693, 48, 135, 258},
    [6] = {664, 40, 135, 197}
}

function SpawnShadows()
    local real = math.random(1, 6)
    for i = 1, 6 do
        local id = 300102
        if i == real then
            id = 300101
        end
        eq.spawn2(id, 0, 0, locs[i][1], locs[i][2], locs[i][3], locs[i][4])
    end
end

function Redwing_Spawn(e)
    shadow_counters = 6
    eq.set_next_hp_event(80)
end

function Redwing_Hp(e)
    e.self:Emote(" laughs as her body shimmers and splits into six identical shadows.")
    eq.depop_with_timer()
    SpawnShadows()
end

function RealS_Spawn(e)
    eq.set_timer("check_hp", 40000) -- 40 seconds
    eq.set_timer("depop", 300000) -- 5 mins
end

function RealS_Timer(e)
    if e.timer == "check_hp" then
        eq.depop_all(300102)
        if e.self:GetHPRatio() <= 90 then
            shadow_counters = shadow_counters - 1
            e.self:Emote(" staggers backward as her shadowy duplicates fade away.")
            if shadow_counters == 0 then
                eq.depop()
                eq.spawn2(300103, 0, 0, 729, 11, 130, 424)
            else
                eq.depop()
                SpawnShadows()
            end
        else
            eq.get_entity_list():MessageClose(e.self, false, 120, MT.Yellow, "A soft feminine voice laughs as the shadows shimmer and reform.") -- check color
            eq.depop()
            SpawnShadows()
        end
        eq.stop_timer(e.timer)
    elseif e.timer == "depop" then
        if not e.self:IsEngaged() then
            eq.depop_all(300102)
            eq.stop_timer(e.timer)
            eq.update_spawn_timer(52495, 1000) -- cause first redwing to repop
            eq.depop()
        end
    end
end

function RealS_Death(e)
    -- hmmm not sure what happens here, but ahh w/e lets just do this
    eq.spawn2(300103, 0, 0, 729, 11, 130, 424)
end

function RealR_Spawn(e)
    eq.set_timer("depop", 300000) -- 5 mins
end

function RealR_Timer(e)
    if e.timer == "depop" then
        if not e.self:IsEngaged() then
            eq.stop_timer(e.timer)
            eq.update_spawn_timer(52495, 1000) -- cause first redwing to repop
            eq.depop()
        end
    end
end

function event_encounter_load(e)
    eq.register_npc_event('redwing', Event.spawn, 300043, Redwing_Spawn)
    eq.register_npc_event('redwing', Event.hp, 300043, Redwing_Hp)

    eq.register_npc_event('redwing', Event.spawn, 300101, RealS_Spawn)
    eq.register_npc_event('redwing', Event.timer, 300101, RealS_Timer)
    eq.register_npc_event('redwing', Event.death_complete, 300101, RealS_Death)

    eq.register_npc_event('redwing', Event.spawn, 300103, RealR_Spawn)
    eq.register_npc_event('redwing', Event.timer, 300103, RealR_Timer)
end

function event_encounter_unload(e)
end

