--[[ bard 1.5
--   second vesthon fight
--   #Vesthon_Marijakin (123173)
--   #Hsagra`s_Relics (123174)
--   #Xeegarn`s_lich (123175)
--   #Malikor_Vikthule (123176)
--   #Puella_Opalis`_lich (123177)
--   #Jalor_Silin (123178)
--   #Locis_V`Sek`s_lich (123179)
--   #Ilishu_Julque (123180)
--   #Amilia_Verisue`s_lich (123181)
--   Xeegarn`s_minion (123182)
--   Malikor`s_minion (123183)
--   Puella`s_minion (123184)
--   Jalor`s_minion (123185)
--   Locis`_minion (123186)
--   Ilishu`s_minion (123187)
--   Amilia`s_minion (123188)
--   #The_Dracoliche_of_Hsagra (123189)
--
--   An inactive Vesthon spawns
--   An inactive/FD'd Hsagra spawns
--   The liches/humans spawn and don't attack
--   Each luch/human has 2 minions associated with them
--   The minions respawn when killed
--   The minions are leashed to about 100 units away
--   each time they are leashed, their damage doubles
--   Once the master dies, the minions depop
--   Each lich/human is inactive (but attackable) until 80%
--   Once all the liches/humans are down Vesthon activates
--   Once Vesthon dies Hsagra`s Relics will despawn and
--   The Dracoliche of Hsagra will spawn once dead, the event is over
--]]

local box = require("aa_box")
local leash_box = box(1408, 1108, -1248, -848)
local minion_db = 58
local minion_di = 20
local lich_count = 0
local event_active = false

-- map master to minion
local minions = {}
minions[123175] = 123182
minions[123176] = 123183
minions[123177] = 123184
minions[123178] = 123185
minions[123179] = 123186
minions[123180] = 123187
minions[123181] = 123188

function VesthSpawn(e)
    minion_db = 58
    minion_di = 20
    lich_count = 0 -- just in case GM repops

    eq.spawn2(123174, 0, 0, -1048, 1285, 2, 510):SetAppearance(3)

    -- necros
    eq.spawn2(123175, 0, 0, -1005, 1314, 2, 346)
    eq.spawn2(123176, 0, 0, -1009, 1288, 2, 382)
    eq.spawn2(123177, 0, 0, -1013, 1254, 2, 442)
    eq.spawn2(123178, 0, 0, -1044, 1214, 2, 506)
    eq.spawn2(123179, 0, 0, -1084, 1230, 2, 58)
    eq.spawn2(123180, 0, 0, -1107, 1269, 2, 112)
    eq.spawn2(123181, 0, 0, -1096, 1317, 2, 166)

    -- minions
    eq.spawn2(123182, 0, 0, -992, 1325, 2, 341)
    eq.spawn2(123182, 0, 0, -987, 1316, 2, 350)

    eq.spawn2(123183, 0, 0, -989, 1296, 2, 376)
    eq.spawn2(123183, 0, 0, -989, 1282, 2, 386)

    eq.spawn2(123184, 0, 0, -991, 1256, 2, 396)
    eq.spawn2(123184, 0, 0, -996, 1230, 2, 423)

    eq.spawn2(123185, 0, 0, -1034, 1195, 2, 505)
    eq.spawn2(123185, 0, 0, -1047, 1192, 2, 503)

    eq.spawn2(123186, 0, 0, -1102, 1194, 2, 39)
    eq.spawn2(123186, 0, 0, -1101, 1204, 2, 56)

    eq.spawn2(123187, 0, 0, -1125, 1257, 2, 111)
    eq.spawn2(123187, 0, 0, -1128, 1268, 2, 113)

    eq.spawn2(123188, 0, 0, -1127, 1310, 2, 144)
    eq.spawn2(123188, 0, 0, -1120, 1333, 2, 159)

    eq.set_timer("despawn", 1200000) -- 20 mins
end

function VesthDeath(e)
    if event_active then
        eq.depop_all(123174)
        eq.spawn2(123189, 0, 0, -1048, 1285, 2, 510)
    end
end

function VesthTimer(e)
    eq.depop_all(123175)
    eq.depop_all(123176)
    eq.depop_all(123177)
    eq.depop_all(123178)
    eq.depop_all(123179)
    eq.depop_all(123180)
    eq.depop_all(123181)
    eq.depop_all(123182)
    eq.depop_all(123183)
    eq.depop_all(123184)
    eq.depop_all(123185)
    eq.depop_all(123186)
    eq.depop_all(123187)
    eq.depop_all(123188)
    eq.depop()
end

function RelicsSpawn(e)
    event_active = true
    eq.set_timer("despawn", 600000) -- 10 mins
end

function RelicsTimer(e)
    event_active = false
    eq.depop()
end

function LichSpawn(e)
    eq.set_next_hp_event(80)
    lich_count = lich_count + 1
end

function LichHp(e)
    e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 0)
end

function LichDeath(e)
    eq.depop_all(minions[e.self:GetNPCTypeID()])
    lich_count = lich_count - 1
    if lich_count == 0 then
        local vesthon = eq.get_entity_list():GetMobByNpcTypeID(123173)
        if vesthon.valid then
            vesthon:SetSpecialAbility(SpecialAbility.immune_aggro, 0)
            vesthon:SetSpecialAbility(SpecialAbility.no_harm_from_client, 0)
        end
    end
end

function MinionSpawn(e)
    eq.modify_npc_stat("min_hit", tostring(minion_db + minion_di * 1))
    eq.modify_npc_stat("max_hit", tostring(minion_db + minion_di * 20))
    eq.set_timer("leash", 6000) -- 6 secs
end

function MinionDeath(e)
    eq.spawn2(e.self:GetNPCTypeID(), 0, 0, e.self:GetSpawnPointX(), e.self:GetSpawnPointY(), e.self:GetSpawnPointZ(), e.self:GetSpawnPointH())
end

function MinionTimer(e)
    if not leash_box:contains(e.self:GetX(), e.self:GetY()) then
        e.self:Emote(" moans loudly as it is recalled to its master.")
        e.self:GotoBind()
        minion_di = minion_di * 2
        eq.signal(123182, 1)
        eq.signal(123183, 1)
        eq.signal(123184, 1)
        eq.signal(123185, 1)
        eq.signal(123186, 1)
        eq.signal(123187, 1)
        eq.signal(123188, 1)
    end
end

function MinionSignal(e)
    eq.modify_npc_stat("min_hit", tostring(minion_db + minion_di * 1))
    eq.modify_npc_stat("max_hit", tostring(minion_db + minion_di * 20))
end

function DracDeath(e)
    eq.set_global("drac_cooldown", "1", 0, "m20") -- unsure
end

function event_encounter_load(e)
    eq.register_npc_event("vesthon", Event.spawn, 123173, VesthSpawn)
    eq.register_npc_event("vesthon", Event.death_complete, 123173, VesthDeath)
    eq.register_npc_event("vesthon", Event.timer, 123173, VesthTimer)

    eq.register_npc_event("vesthon", Event.spawn, 123174, RelicsSpawn)
    eq.register_npc_event("vesthon", Event.timer, 123174, RelicsTimer)

    eq.register_npc_event("vesthon", Event.spawn, 123175, LichSpawn)
    eq.register_npc_event("vesthon", Event.spawn, 123176, LichSpawn)
    eq.register_npc_event("vesthon", Event.spawn, 123177, LichSpawn)
    eq.register_npc_event("vesthon", Event.spawn, 123178, LichSpawn)
    eq.register_npc_event("vesthon", Event.spawn, 123179, LichSpawn)
    eq.register_npc_event("vesthon", Event.spawn, 123180, LichSpawn)
    eq.register_npc_event("vesthon", Event.spawn, 123181, LichSpawn)
    eq.register_npc_event("vesthon", Event.death_complete, 123175, LichDeath)
    eq.register_npc_event("vesthon", Event.death_complete, 123176, LichDeath)
    eq.register_npc_event("vesthon", Event.death_complete, 123177, LichDeath)
    eq.register_npc_event("vesthon", Event.death_complete, 123178, LichDeath)
    eq.register_npc_event("vesthon", Event.death_complete, 123179, LichDeath)
    eq.register_npc_event("vesthon", Event.death_complete, 123180, LichDeath)
    eq.register_npc_event("vesthon", Event.death_complete, 123181, LichDeath)
    eq.register_npc_event("vesthon", Event.hp, 123175, LichHp)
    eq.register_npc_event("vesthon", Event.hp, 123176, LichHp)
    eq.register_npc_event("vesthon", Event.hp, 123177, LichHp)
    eq.register_npc_event("vesthon", Event.hp, 123178, LichHp)
    eq.register_npc_event("vesthon", Event.hp, 123179, LichHp)
    eq.register_npc_event("vesthon", Event.hp, 123180, LichHp)
    eq.register_npc_event("vesthon", Event.hp, 123181, LichHp)

    eq.register_npc_event("vesthon", Event.spawn, 123182, MinionSpawn)
    eq.register_npc_event("vesthon", Event.spawn, 123183, MinionSpawn)
    eq.register_npc_event("vesthon", Event.spawn, 123184, MinionSpawn)
    eq.register_npc_event("vesthon", Event.spawn, 123185, MinionSpawn)
    eq.register_npc_event("vesthon", Event.spawn, 123186, MinionSpawn)
    eq.register_npc_event("vesthon", Event.spawn, 123187, MinionSpawn)
    eq.register_npc_event("vesthon", Event.spawn, 123188, MinionSpawn)
    eq.register_npc_event("vesthon", Event.death_complete, 123182, MinionDeath)
    eq.register_npc_event("vesthon", Event.death_complete, 123183, MinionDeath)
    eq.register_npc_event("vesthon", Event.death_complete, 123184, MinionDeath)
    eq.register_npc_event("vesthon", Event.death_complete, 123185, MinionDeath)
    eq.register_npc_event("vesthon", Event.death_complete, 123186, MinionDeath)
    eq.register_npc_event("vesthon", Event.death_complete, 123187, MinionDeath)
    eq.register_npc_event("vesthon", Event.death_complete, 123188, MinionDeath)
    eq.register_npc_event("vesthon", Event.timer, 123182, MinionTimer)
    eq.register_npc_event("vesthon", Event.timer, 123183, MinionTimer)
    eq.register_npc_event("vesthon", Event.timer, 123184, MinionTimer)
    eq.register_npc_event("vesthon", Event.timer, 123185, MinionTimer)
    eq.register_npc_event("vesthon", Event.timer, 123186, MinionTimer)
    eq.register_npc_event("vesthon", Event.timer, 123187, MinionTimer)
    eq.register_npc_event("vesthon", Event.timer, 123188, MinionTimer)
    eq.register_npc_event("vesthon", Event.signal, 123182, MinionSignal)
    eq.register_npc_event("vesthon", Event.signal, 123183, MinionSignal)
    eq.register_npc_event("vesthon", Event.signal, 123184, MinionSignal)
    eq.register_npc_event("vesthon", Event.signal, 123185, MinionSignal)
    eq.register_npc_event("vesthon", Event.signal, 123186, MinionSignal)
    eq.register_npc_event("vesthon", Event.signal, 123187, MinionSignal)
    eq.register_npc_event("vesthon", Event.signal, 123188, MinionSignal)

    eq.register_npc_event("vesthon", Event.death_complete, 123189, DracDeath)
end

function event_encounter_unload(e)
end
