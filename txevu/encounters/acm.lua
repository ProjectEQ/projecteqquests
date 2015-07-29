--[[
--  Ancient Cragbeast Matriarch
--  NPCs involved:
--      #Ancient_Cragbeast_Matriarch (297056)
--      #Bearer_of_Absorption (297173)
--      #Bearer_of_Anger (297055)
--      #Bearer_of_Haste (297190)
--      #Bearer_of_Intensification (297051)
--      #Bearer_of_Mending (297054)
--      #Bearer_of_Nascency (297050)
--      #Bearer_of_Projection (297208)
--      #Bearer_of_Quickening (297142)
--      #Bearer_of_Rage (297053)
--      #Bearer_of_Reflection (297052)
--      #Bearer_of_Resistance (297141)
--      #Bearer_of_Shielding (297191)
--  http://everquest.allakhazam.com/db/quest.html?quest=7691
--]]

local ae = false
local adds = false
local combat = false

function ACMSpawn(e)
    local entity_list = eq.get_entity_list()
    ae = false
    adds = false
    combat = false
    -- due to the way spawn conditions work, if on boot up the condition is
    -- enabled the mob spawn order is not guaranteed
    -- This isn't as clean as I would like, but it's better than checking them all on a timer
    if entity_list:IsMobSpawnedByNpcTypeID(297173) then
        AbsorptionEnable(e.self)
    end
    if entity_list:IsMobSpawnedByNpcTypeID(297055) then
        AngerEnable(e.self)
    end
    if entity_list:IsMobSpawnedByNpcTypeID(297190) then
        HasteEnable(e.self)
    end
    if entity_list:IsMobSpawnedByNpcTypeID(297051) then
        IntensificationEnable(e.self)
    end
    if entity_list:IsMobSpawnedByNpcTypeID(297054) then
        MendingEnable(e.self)
    end
    if entity_list:IsMobSpawnedByNpcTypeID(297050) then
        NascencyEnable(e.self)
    end
    if entity_list:IsMobSpawnedByNpcTypeID(297208) then
        ProjectionEnable(e.self)
    end
    if entity_list:IsMobSpawnedByNpcTypeID(297142) then
        QuickeningEnable(e.self)
    end
    if entity_list:IsMobSpawnedByNpcTypeID(297053) then
        RageEnable(e.self)
    end
    if entity_list:IsMobSpawnedByNpcTypeID(297052) then
        ReflectionEnable(e.self)
    end
    if entity_list:IsMobSpawnedByNpcTypeID(297141) then
        ResistanceEnable(e.self)
    end
    if entity_list:IsMobSpawnedByNpcTypeID(297191) then
        ShieldingEnable(e.self)
    end
    eq.spawn_condition("txevu", 0, 3, 1) -- bearers and Mastruqs
end

function ACMDeath(e)
    eq.spawn_condition("txevu", 0, 3, 0) -- bearers and Mastruqs
    ae = false
    adds = false
    combat = false
end

function ACMTimer(e)
    if e.timer == "hatchling" then
        x = e.self:GetX()
        y = e.self:GetY()
        z = e.self:GetZ()
        h = e.self:GetHeading()
        eq.zone_emote(15, "In search of food, cragbeast hatchlings scurry out from beneath the Ancient Cragbeast Matriarch")
        eq.spawn2(297210, 0, 0, x, y + 5, z, h) -- a_cragbeast_hatchling
        eq.spawn2(297210, 0, 0, x + 5, y, z, h) -- a_cragbeast_hatchling
        eq.spawn2(297210, 0, 0, x - 5, y, z, h) -- a_cragbeast_hatchling
    elseif e.timer == "ae" then
        eq.stop_timer(e.timer)
        local target = e.self:GetTarget()
        if target.valid then
            e.self:CastSpell(1239, target:GetID()) -- Devouring Conflagration
        end
        time = math.random(5, 60) * 1000
        eq.set_timer(e.timer, time)
    end
end

function ACMCombat(e)
    if e.joined == true then
        combat = true
        if adds then
            eq.set_timer("hatchling", 35000)
        end
        if ae then
            eq.set_timer("ae", math.random(5, 60) * 1000)
        end
    else
        combat = false
        eq.stop_timer("hatchling")
        eq.stop_timer("ae")
    end
end

-- This is less than ideal IMO, but since we can't keep around a pointer that
-- gets cleared in every case (#repop) we gotta rely on signals
function ACMSignal(e)
    if e.signal == 297173 then
        AbsorptionEnable(e.self)
    elseif e.signal == -297173 then
        AbsorptionDisable(e.self)
    elseif e.signal == 297055 then
        AngerEnable(e.self)
    elseif e.signal == -297055 then
        AngerDisable(e.self)
    elseif e.signal == 297190 then
        HasteEnable(e.self)
    elseif e.signal == -297190 then
        HasteDisable(e.self)
    elseif e.signal == 297051 then
        IntensificationEnable(e.self)
    elseif e.signal == -297051 then
        IntensificationDisable(e.self)
    elseif e.signal == 297054 then
        MendingEnable(e.self)
    elseif e.signal == -297054 then
        MendingDisable(e.self)
    elseif e.signal == 297050 then
        NascencyEnable(e.self)
    elseif e.signal == -297050 then
        NascencyDisable(e.self)
    elseif e.signal == 297208 then
        ProjectionEnable(e.self)
    elseif e.signal == -297208 then
        ProjectionDisable(e.self)
    elseif e.signal == 297142 then
        QuickeningEnable(e.self)
    elseif e.signal == -297142 then
        QuickeningDisable(e.self)
    elseif e.signal == 297053 then
        RageEnable(e.self)
    elseif e.signal == -297053 then
        RageDisable(e.self)
    elseif e.signal == 297052 then
        ReflectionEnable(e.self)
    elseif e.signal == -297052 then
        ReflectionDisable(e.self)
    elseif e.signal == 297141 then
        ResistanceEnable(e.self)
    elseif e.signal == -297141 then
        ResistanceDisable(e.self)
    elseif e.signal == 297191 then
        ShieldingEnable(e.self)
    elseif e.signal == -297191 then
        ShieldingDisable(e.self)
    end
end

function AbsorptionEnable(acm)
    acm:ModSkillDmgTaken(0, -75) -- 1h blunt
    acm:ModSkillDmgTaken(1, -75) -- 1h slashing
    acm:ModSkillDmgTaken(2, -75) -- 2h blunt
    acm:ModSkillDmgTaken(3, -75) -- 2h slashing
    acm:ModSkillDmgTaken(7, -75) -- archery
    acm:ModSkillDmgTaken(8, -75) -- backstab
    acm:ModSkillDmgTaken(10, -75) -- bash
    acm:ModSkillDmgTaken(21, -75) -- dragon punch
    acm:ModSkillDmgTaken(23, -75) -- eagle strike
    acm:ModSkillDmgTaken(26, -75) -- flying kick
    acm:ModSkillDmgTaken(28, -75) -- hand to hand
    acm:ModSkillDmgTaken(30, -75) -- kick
    acm:ModSkillDmgTaken(36, -75) -- piercing
    acm:ModSkillDmgTaken(38, -75) -- round kick
    acm:ModSkillDmgTaken(52, -75) -- tiger claw
    acm:ModSkillDmgTaken(74, -75) -- frenzy
    --acm:ModSkillDmgTaken(77, -75) -- 2h piercing
end

function AbsorptionDisable(acm)
    acm:ModSkillDmgTaken(0, 0) -- 1h blunt
    acm:ModSkillDmgTaken(1, 0) -- 1h slashing
    acm:ModSkillDmgTaken(2, 0) -- 2h blunt
    acm:ModSkillDmgTaken(3, 0) -- 2h slashing
    acm:ModSkillDmgTaken(7, 0) -- archery
    acm:ModSkillDmgTaken(8, 0) -- backstab
    acm:ModSkillDmgTaken(10, 0) -- bash
    acm:ModSkillDmgTaken(21, 0) -- dragon punch
    acm:ModSkillDmgTaken(23, 0) -- eagle strike
    acm:ModSkillDmgTaken(26, 0) -- flying kick
    acm:ModSkillDmgTaken(28, 0) -- hand to hand
    acm:ModSkillDmgTaken(30, 0) -- kick
    acm:ModSkillDmgTaken(36, 0) -- piercing
    acm:ModSkillDmgTaken(38, 0) -- round kick
    acm:ModSkillDmgTaken(52, 0) -- tiger claw
    acm:ModSkillDmgTaken(74, 0) -- frenzy
    --acm:ModSkillDmgTaken(77, 0) -- 2h piercing
end

function AngerEnable(acm)
    acm:SetSpecialAbility(SpecialAbility.rampage, 1)
    acm:SetSpecialAbilityParam(SpecialAbility.rampage, 0, 27)
end

function AngerDisable(acm)
    acm:SetSpecialAbility(SpecialAbility.rampage, 0)
end

function HasteEnable(acm)
    acm:SetSpecialAbility(SpecialAbility.flurry, 1)
    acm:SetSpecialAbilityParam(SpecialAbility.flurry, 0, 50)
end

function HasteDisable(acm)
    acm:SetSpecialAbility(SpecialAbility.flurry, 0)
end

function IntensificationEnable(acm)
    acm:ModifyNPCStat("min_hit", "1150")
    acm:ModifyNPCStat("max_hit", "4000")
end

function IntensificationDisable(acm)
    acm:ModifyNPCStat("min_hit", "850")
    acm:ModifyNPCStat("max_hit", "2750")
end

function MendingEnable(acm)
    acm:ModifyNPCStat("hp_regen", "6000")
end

function MendingDisable(acm)
    acm:ModifyNPCStat("hp_regen", "100") -- not parsed
end

function NascencyEnable(acm)
    adds = true
    if combat then
        eq.set_timer("hatchling", 35000, acm)
    end
end

function NascencyDisable(acm)
    adds = false
    eq.stop_timer("hatchling", acm)
end

function ProjectionEnable(acm)
    ae = true
    if combat then
        time = math.random(5, 60) * 1000
        eq.set_timer("ae", time, acm)
    end
end

function ProjectionDisable(acm)
    ae = false
    eq.stop_timer("ae", acm)
end

function QuickeningEnable(acm)
    acm:ModifyNPCStat("attack_delay", "12")
end

function QuickeningDisable(acm)
    acm:ModifyNPCStat("attack_delay", "17")
end

function RageEnable(acm)
    acm:SetSpecialAbility(SpecialAbility.area_rampage, 1)
    acm:SetSpecialAbilityParam(SpecialAbility.area_rampage, 0, 17)
end

function RageDisable(acm)
    acm:SetSpecialAbility(SpecialAbility.area_rampage, 0)
end

function ReflectionEnable(acm)
    acm:AddAISpell(0, 1248, 1024, -1, 30, -1) -- Spiritual Echo, in combat buff
end

function ReflectionDisable(acm)
    acm:RemoveAISpell(1248) -- Spiritual Echo
end

function ResistanceEnable(acm)
    -- Need to parse these
    acm:ModifyNPCStat("mr", "236")
    acm:ModifyNPCStat("fr", "236")
    acm:ModifyNPCStat("cr", "236")
    acm:ModifyNPCStat("pr", "236")
    acm:ModifyNPCStat("dr", "236")
end

function ResistanceDisable(acm)
    -- Need to parse these
    acm:ModifyNPCStat("mr", "136")
    acm:ModifyNPCStat("fr", "136")
    acm:ModifyNPCStat("cr", "136")
    acm:ModifyNPCStat("pr", "136")
    acm:ModifyNPCStat("dr", "136")
end

function ShieldingEnable(acm)
    acm:AddAISpell(0, 1249, 1024, -1, 30, -1) -- Bristling Armament, in combat buff
end

function ShieldingDisable(acm)
    acm:RemoveAISpell(1249) -- Bristling Armament
end

function AbsorptionSpawn(e)
    eq.signal(297056, 297173)
end

function AbsorptionDeath(e)
    eq.signal(297056, -297173)
end

function AngerSpawn(e)
    eq.signal(297056, 297055)
end

function AngerDeath(e)
    eq.signal(297056, -297055)
end

function HasteSpawn(e)
    eq.signal(297056, 297190)
end

function HasteDeath(e)
    eq.signal(297056, -297190)
end

function IntensificationSpawn(e)
    eq.signal(297056, 297051)
end

function IntensificationDeath(e)
    eq.signal(297056, -297051)
end

function MendingSpawn(e)
    eq.signal(297056, 297054)
end

function MendingDeath(e)
    eq.signal(297056, -297054)
end

function NascencySpawn(e)
    eq.signal(297056, 297050)
end

function NascencyDeath(e)
    eq.signal(297056, -297050)
end

function ProjectionSpawn(e)
    eq.signal(297056, 297208)
end

function ProjectionDeath(e)
    eq.signal(297056, -297208)
end

function QuickeningSpawn(e)
    eq.signal(297056, 297142)
end

function QuickeningDeath(e)
    eq.signal(297056, -297142)
end

function RageSpawn(e)
    eq.signal(297056, 297053)
end

function RageDeath(e)
    eq.signal(297056, -297053)
end

function ReflectionSpawn(e)
    eq.signal(297056, 297052)
end

function ReflectionDeath(e)
    eq.signal(297056, -297052)
end

function ResistanceSpawn(e)
    eq.signal(297056, 297141)
end

function ResistanceDeath(e)
    eq.signal(297056, -297141)
end

function ShieldingSpawn(e)
    eq.signal(297056, 297191)
end

function ShieldingDeath(e)
    eq.signal(297056, -297191)
end

function event_encounter_load(e)
    eq.register_npc_event("acm", Event.spawn, 297056, ACMSpawn)
    eq.register_npc_event("acm", Event.death_complete, 297056, ACMDeath)
    eq.register_npc_event("acm", Event.timer, 297056, ACMTimer)
    eq.register_npc_event("acm", Event.combat, 297056, ACMCombat)
    eq.register_npc_event("acm", Event.signal, 297056, ACMSignal)

    eq.register_npc_event("acm", Event.spawn, 297173, AbsorptionSpawn)
    eq.register_npc_event("acm", Event.death_complete, 297173, AbsorptionDeath)

    eq.register_npc_event("acm", Event.spawn, 297055, AngerSpawn)
    eq.register_npc_event("acm", Event.death_complete, 297055, AngerDeath)

    eq.register_npc_event("acm", Event.spawn, 297190, HasteSpawn)
    eq.register_npc_event("acm", Event.death_complete, 297190, HasteDeath)

    eq.register_npc_event("acm", Event.spawn, 297051, IntensificationSpawn)
    eq.register_npc_event("acm", Event.death_complete, 297051, IntensificationDeath)

    eq.register_npc_event("acm", Event.spawn, 297054, MendingSpawn)
    eq.register_npc_event("acm", Event.death_complete, 297054, MendingDeath)

    eq.register_npc_event("acm", Event.spawn, 297050, NascencySpawn)
    eq.register_npc_event("acm", Event.death_complete, 297050, NascencyDeath)

    eq.register_npc_event("acm", Event.spawn, 297208, ProjectionSpawn)
    eq.register_npc_event("acm", Event.death_complete, 297208, ProjectionDeath)

    eq.register_npc_event("acm", Event.spawn, 297142, QuickeningSpawn)
    eq.register_npc_event("acm", Event.death_complete, 297142, QuickeningDeath)

    eq.register_npc_event("acm", Event.spawn, 297053, RageSpawn)
    eq.register_npc_event("acm", Event.death_complete, 297053, RageDeath)

    eq.register_npc_event("acm", Event.spawn, 297052, ReflectionSpawn)
    eq.register_npc_event("acm", Event.death_complete, 297052, ReflectionDeath)

    eq.register_npc_event("acm", Event.spawn, 297141, ResistanceSpawn)
    eq.register_npc_event("acm", Event.death_complete, 297141, ResistanceDeath)

    eq.register_npc_event("acm", Event.spawn, 297191, ShieldingSpawn)
    eq.register_npc_event("acm", Event.death_complete, 297191, ShieldingDeath)
end
