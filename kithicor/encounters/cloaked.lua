--[[ bard 1.5
--   Thief part
--   #a_cloaked_figure (20290)
--   a_malignant_shadow (20291)
--   #a_shadow_thief (20292)
--
--   Hailing the a cloaked figure will start the event after sometime
--   After the time 4 a malignant shadow will spawn around the bard
--   The malignant shadow will instant respawn on death
--   After the 10th one dies, a shadow thief spawns from it's corpse
--   After the thief dies, the malignant shadows despawn and stop spawning
--]]

local death_count = 0
local bard = -1

function CloakedSpawn(e)
    death_count = 0
end

function CloakedSay(e)
    local qglobals = eq.get_qglobals(e.other)
    if qglobals["bard15"] == "5" and e.message:findi("hail") then
        e.self:Emote(" turns towards you.  You get the distinct impression whom ever is under that cloak is sizing you up.")
        eq.set_timer("startevent", 10000) -- 10 seconds
        bard = e.other:GetID()
    end
end

function CloakedTimer(e)
    local entity_list = eq.get_entity_list()
    entity_list:MessageClose(e.self, true, 100, 15, "The figure begins to fade into the shadows before your very eyes.  You notice movement out of the corner of your left eye.")
    local bard_client = entity_list:GetClientByID(bard)
    if bard_client.valid and bard_client:GetClass() == Class.BARD then
        eq.spawn2(20291, 0, 0, bard_client:GetX() + 100, bard_client:GetY(), bard_client:FindGroundZ(bard_client:GetX() + 100, bard_client:GetY(), bard_client:GetZ()) + 5, bard_client:GetHeading())
        eq.spawn2(20291, 0, 0, bard_client:GetX() - 100, bard_client:GetY(), bard_client:FindGroundZ(bard_client:GetX() - 100, bard_client:GetY(), bard_client:GetZ()) + 5, bard_client:GetHeading())
        eq.spawn2(20291, 0, 0, bard_client:GetX(), bard_client:GetY() + 100, bard_client:FindGroundZ(bard_client:GetX(), bard_client:GetY(), bard_client:GetZ() + 100) + 5, bard_client:GetHeading())
        eq.spawn2(20291, 0, 0, bard_client:GetX(), bard_client:GetY() - 100, bard_client:FindGroundZ(bard_client:GetX(), bard_client:GetY(), bard_client:GetZ() - 100) + 5, bard_client:GetHeading())
    else
        bard = -1
    end
    eq.depop()
end

function MalignantSpawn(e)
    local entity_list = eq.get_entity_list()
    local bard_client = entity_list:GetClientByID(bard)
    if bard_client.valid and bard_client:GetClass() == Class.BARD then
        e.self:AddToHateList(bard_client, 500)
    end
end

function MalignantDeath(e)
    death_count = death_count + 1
    if death_count == 10 then
        eq.spawn2(20292, 0, 0, e.self:GetX(), e.self:GetY(), e.self:GetZ(), e.self:GetHeading())
    end
    eq.spawn2(20291, 0, 0, e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH())
end

function ThiefSpawn(e)
    eq.set_next_hp_event(25)
end

function ThiefHp(e)
    e.self:CastSpell(3070, e.self:GetID())
end

function ThiefDeath(e)
    eq.depop_all(20291)
    bard = -1
end

function event_encounter_load(e)
    eq.register_npc_event("cloaked", Event.spawn, 20290, CloakedSpawn)
    eq.register_npc_event("cloaked", Event.say, 20290, CloakedSay)
    eq.register_npc_event("cloaked", Event.timer, 20290, CloakedTimer)

    eq.register_npc_event("cloaked", Event.spawn, 20291, MalignantSpawn)
    eq.register_npc_event("cloaked", Event.death_complete, 20291, MalignantDeath)

    eq.register_npc_event("cloaked", Event.spawn, 20292, ThiefSpawn)
    eq.register_npc_event("cloaked", Event.hp, 20292, ThiefHp)
    eq.register_npc_event("cloaked", Event.death_complete, 20292, ThiefDeath)
end

function event_encounter_unload(e)
end

