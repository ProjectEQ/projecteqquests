-- T'Shara Encounter

local TSHARA        = 343358
local TSHARA_ALIVE  = false

local ASPECT = {
  ARMOR       = 343361,
  COMBAT      = 343363,
  MAGIC       = 343359,
  POWER       = 343362,
  PROTECTION  = 343360,
}

local ASPECT_LOCATIONS = {
  ARMOR       = { x = -1711.16, y = -421.83, z = -176.46, h = 121.5 },
  COMBAT      = { x = -1482.40, y = -670.43, z = -176.52, h = 463.0 },
  MAGIC       = { x = -1539.36, y = -368.39, z = -176.32, h = 393.5 },
  POWER       = { x = -1694.66, y = -551.08, z = -178.08, h = 57.0 },
  PROTECTION  = { x = -1595.10, y = -497.14, z = -177.46, h = 505.3 },
}

local ASPECT_COMBAT_VALUES = {
  ARMOR       = {MIN_HIT = 250, MAX_HIT = 1200, ADJ_MIN_HIT = 250, ADJ_MAX_HIT = 1200},
  COMBAT      = {MIN_HIT = 250, MAX_HIT = 1200, ADJ_MIN_HIT = 250, ADJ_MAX_HIT = 1200},
  MAGIC       = {MIN_HIT = 250, MAX_HIT = 1200, ADJ_MIN_HIT = 250, ADJ_MAX_HIT = 1200},
  POWER       = {MIN_HIT = 250, MAX_HIT = 1200, ADJ_MIN_HIT = 250, ADJ_MAX_HIT = 1200},
  PROTECTION  = {MIN_HIT = 250, MAX_HIT = 1200, ADJ_MIN_HIT = 250, ADJ_MAX_HIT = 1200},
}

local TSHARA_COMBAT_VALUES = {MIN_HIT = 717, MAX_HIT = 2541, ADJ_MIN_HIT = 895, ADJ_MAX_HIT = 3175}

local ASPECT_TIMER        = 150 * 1000
local POWER_UP_TIMER      = 30 * 1000
local ADDS_ALIVE          = 0

-- TSHARA EVENTS

function evt_tshara_spawn(e)
  encounter_reset(e)
end

function evt_tshara_combat(e)
  if e.joined then
    eq.set_timer("agro", 1000)
		eq.set_timer("check",2000)
    aggro_link(e)
  end
end

function evt_tshara_timer(e)
  eq.stop_timer(e.timer)

  if e.timer == "agro" then
    aggro_link(e)
    eq.set_timer("agro", 1000)
  elseif e.timer == "check" then
    if ADDS_ALIVE == 0 then
      e.self:Emote(" focuses for a moment and imbues a new Aspect of Protection.")
      eq.spawn2(ASPECT.PROTECTION,0,0,ASPECT_LOCATIONS.PROTECTION.x,ASPECT_LOCATIONS.PROTECTION.y,ASPECT_LOCATIONS.PROTECTION.z,ASPECT_LOCATIONS.PROTECTION.h)
      eq.stop_timer("PROTECTION")
    end
    eq.set_timer("check",2000)
  else
    local aspect_name = e.timer
    local npcid = ASPECT[aspect_name]
    local loc = ASPECT_LOCATIONS[aspect_name]

    if npcid and loc then
      eq.spawn2(npcid, 0, 0, loc.x, loc.y, loc.z, loc.h)
    else
      eq.debug("Invalid timer or missing data for: " .. tostring(aspect_name))
    end
	end
end

function evt_tshara_signal(e)
  eq.debug("T'Shara received signal: " .. tostring(e.signal))

  if e.signal == ASPECT.ARMOR then
    e.self:ModifyNPCStat("AC", "650")
		ADDS_ALIVE = ADDS_ALIVE + 1
  elseif e.signal == -ASPECT.ARMOR then
    eq.set_timer("ARMOR", ASPECT_TIMER)
		e.self:ModifyNPCStat("AC", "550")
		e.self:Emote(" seems to look vulnerable.")
		ADDS_ALIVE = ADDS_ALIVE -1
  elseif e.signal == ASPECT.COMBAT then
    e.self:SetSpecialAbility(SpecialAbility.flurry, 1)
		ADDS_ALIVE = ADDS_ALIVE + 1
  elseif e.signal == -ASPECT.COMBAT then
    eq.set_timer("COMBAT", ASPECT_TIMER)
		e.self:SetSpecialAbility(SpecialAbility.flurry, 0)
		e.self:Emote(" loses her grace in combat.")
		ADDS_ALIVE = ADDS_ALIVE - 1
  elseif e.signal == ASPECT.MAGIC then
		e.self:ModifyNPCStat("mr", "1000")
		e.self:ModifyNPCStat("fr", "1000")
		e.self:ModifyNPCStat("cr", "1000")
		e.self:ModifyNPCStat("pr", "1000")
		e.self:ModifyNPCStat("dr", "1000")
		ADDS_ALIVE = ADDS_ALIVE + 1
  elseif e.signal == -ASPECT.MAGIC then
    eq.set_timer("MAGIC", ASPECT_TIMER)
		e.self:ModifyNPCStat("mr", "75")
		e.self:ModifyNPCStat("fr", "75")
		e.self:ModifyNPCStat("cr", "75")
		e.self:ModifyNPCStat("pr", "75")
		e.self:ModifyNPCStat("dr", "75")
		e.self:Emote(" reabsorbs her weakness to magic.")
		ADDS_ALIVE = ADDS_ALIVE - 1
  elseif e.signal == ASPECT.POWER then
    e.self:ModifyNPCStat("min_hit", tostring(TSHARA_COMBAT_VALUES.ADJ_MAX_HIT))
		e.self:ModifyNPCStat("max_hit", tostring(TSHARA_COMBAT_VALUES.ADJ_MAX_HIT))
		ADDS_ALIVE = ADDS_ALIVE + 1
  elseif e.signal == -ASPECT.POWER then
		eq.set_timer("POWER", ASPECT_TIMER)
		e.self:ModifyNPCStat("min_hit", tostring(TSHARA_COMBAT_VALUES.MIN_HIT))
		e.self:ModifyNPCStat("max_hit", tostring(TSHARA_COMBAT_VALUES.MAX_HIT))
		e.self:Emote(" loses the power of her fury.")
		ADDS_ALIVE = ADDS_ALIVE -1
  elseif e.signal == ASPECT.PROTECTION then
    e.self:SetSpecialAbility(SpecialAbility.immune_melee, 1)
		ADDS_ALIVE = ADDS_ALIVE + 1
  elseif e.signal == -ASPECT.PROTECTION then
    eq.set_timer("PROTECTION", ASPECT_TIMER);
		e.self:SetSpecialAbility(SpecialAbility.immune_melee, 0)
		e.self:Emote(" loses her divine barrier.")
		ADDS_ALIVE = ADDS_ALIVE - 1
  end
end

function evt_tshara_death(e)
  TSHARA_ALIVE = false
  eq.signal(ASPECT.ARMOR, 1)
  eq.signal(ASPECT.POWER, 1)
  eq.signal(ASPECT.PROTECTION, 1)
  eq.signal(ASPECT.COMBAT, 1)
  eq.signal(ASPECT.MAGIC, 1)
end

-- ASPECT EVENTS

function evt_adds_spawn(e)
  local my_npcid = e.self:GetNPCTypeID()

  eq.signal(TSHARA,my_npcid)

  for _, values in pairs(ASPECT_COMBAT_VALUES) do
    if values.NPC_ID == my_npcid then
      e.self:ModifyNPCStat("min_hit", tostring(values.MIN_HIT))
      e.self:ModifyNPCStat("max_hit", tostring(values.MAX_HIT))
      return
    end
  end
end

function evt_adds_combat(e)
  if not e.joined then
    eq.stop_timer("powerup")
  elseif e.joined then
    if TSHARA_ALIVE then
      eq.set_timer("powerup", POWER_UP_TIMER)
    end

    aggro_link(e)
  end
end

function evt_adds_timer(e)
  local my_npcid = e.self:GetNPCTypeID()


  for aspect, npcid in pairs(ASPECT) do
    if my_npcid == npcid then
      local values = ASPECT_COMBAT_VALUES[aspect]
      if values then
        values.ADJ_MIN_HIT = math.ceil(values.ADJ_MIN_HIT * 1.1476)
        values.ADJ_MAX_HIT = math.ceil(values.ADJ_MAX_HIT * 1.1476)
        e.self:ModifyNPCStat("min_hit", tostring(values.ADJ_MIN_HIT))
        e.self:ModifyNPCStat("max_hit", tostring(values.ADJ_MAX_HIT))
        e.self:Emote(" is infused with energy from T`Shara.")
      end
      break
    end
  end
end

function evt_adds_signal(e)
  if e.signal == 1 then
    eq.stop_timer("powerup")
  end
end

function evt_adds_death(e)
  local my_npcid = e.self:GetNPCTypeID()
  eq.signal(TSHARA, -my_npcid)
end

-- HELPER FUNCTIONS

function encounter_reset(e)
  for _, id in pairs(ASPECT) do
    eq.depop(id)
  end

  for _, npcs in pairs(ASPECT_COMBAT_VALUES) do
    npcs.ADJ_MIN_HIT = npcs.MIN_HIT
    npcs.ADJ_MAX_HIT = npcs.MAX_HIT
  end

  for aspect, npcid in pairs(ASPECT) do
    local loc = ASPECT_LOCATIONS[aspect]
    if loc then
      eq.spawn2(npcid, 0, 0, loc.x, loc.y, loc.z, loc.h)
    end
  end

  TSHARA_ALIVE  = true
  ADDS_ALIVE    = 0
end

function aggro_link(e)
  local npc_list = eq.get_entity_list():GetNPCList()

  for npc in npc_list.entries do
    if npc.valid and
      (npc:GetNPCTypeID() == ASPECT.ARMOR or
      npc:GetNPCTypeID() == ASPECT.POWER or
      npc:GetNPCTypeID() == ASPECT.PROTECTION or
      npc:GetNPCTypeID() == ASPECT.COMBAT or
      npc:GetNPCTypeID() == ASPECT.MAGIC) then
        npc:AddToHateList(e.self:GetHateRandom(), 1)
    end
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.spawn,          TSHARA, evt_tshara_spawn)
  eq.register_npc_event(Event.combat,         TSHARA, evt_tshara_combat)
  eq.register_npc_event(Event.timer,          TSHARA, evt_tshara_timer)
  eq.register_npc_event(Event.signal,         TSHARA, evt_tshara_signal)
  eq.register_npc_event(Event.death_complete, TSHARA, evt_tshara_death)

  for _, id in pairs(ASPECT) do
    eq.register_npc_event(Event.spawn,          id, evt_adds_spawn)
    eq.register_npc_event(Event.combat,         id, evt_adds_combat)
    eq.register_npc_event(Event.timer,          id, evt_adds_timer)
    eq.register_npc_event(Event.signal,         id, evt_adds_signal)
    eq.register_npc_event(Event.death_complete, id, evt_adds_death)
  end
end

