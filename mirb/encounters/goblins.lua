local event_started = false
local use_raidleader_emote = false
local use_taskmaster_emote = false
local goblins_arrived = 0
local goblin_count = 0
local warnings = 0
local spawn_locs = {
  { 720.0, 1469.0, 5.0, 511.0 },
  { 759.0, 972.0, 6.0, 511.0 },
  { 508.0, 913.0, 5.0, 511.0 },
  { 365.0, 896.0, -55.0, 511.0 },
}

local function reset_event()
  eq.depop(237785) -- #Taskmaster_Suttalp
  eq.depop(237786) -- #Raid_Leader_Sig_Chol

  -- teleport all clients out of zone on event fail
  local client_list = eq.get_entity_list():GetClientList()
  for client in client_list.entries do
    if client.valid then
      client:MovePC(30, -5461.0, -848.0, 190.0, 0) -- everfrost
    end
  end

  eq.depop_all(237784) -- #a_Frostfoot_henchman
  eq.spawn2(237721, 0, 0, 649.0, 1223.0, 4.125, 0.0) -- #a_Frostfoot_scout

  event_started = false
  use_raidleader_emote = false
  use_taskmaster_emote = false
  goblins_arrived = 0
  goblin_count = 0
  next_emote = 0
  warnings = 0
end

function scout_spawn(e)
  e.self:SetSpecialAbility(SpecialAbility.immune_melee, 1)
  e.self:SetSpecialAbility(SpecialAbility.immune_magic, 1)
  e.self:SetSpecialAbility(SpecialAbility.immune_aggro, 1)
  e.self:SetSpecialAbility(SpecialAbility.immune_aggro_on, 1)
  e.self:SetRunning(true)

  -- on live this triggers with an aggro emote at max 75 range (doorway)
  local x = e.self:GetX()
  local y = e.self:GetY()
  eq.set_proximity(x - 75, x + 75, y - 75, y + 75)
end

function scout_enter(e)
  if not event_started then
    e.self:MoveTo(270, 945, -50, 0, true) -- Raid Leader's room (could use a grid for live accuracy)
    event_started = true
  end
end

function scout_waypoint_arrive(e)
  -- todo: leader quest emotes are incorrectly hardcoded in database for some reason and occur on spawn
  eq.zone_emote(MT.SayEcho, "A goblin in the distance shouts, 'NOW!  Ambush them!'")
  eq.spawn2(237786, 0, 0, 326.0, 1009.0, -53.625, 84) -- Raid Leader Sig Chol
  eq.spawn2(237785, 0, 0, 713.0, 970.0, 6.25, 142) -- Taskmaster Suitalp
  eq.depop()
end

local function spawn_goblin(from_raidleader)
  -- an add is spawned by each leader every 10s which paths to scout room
  local goblin_index = math.random(#spawn_locs)

  -- leader emote conditions are related to spawning the goblin at x = 365
  if goblin_index == #spawn_locs then
    if from_raidleader then
      use_raidleader_emote = true
    else
      use_taskmaster_emote = true
    end
  end

  -- todo: sometimes rarely spawns a_Frostfoot_spellbreaker instead (not in db)
  local loc = spawn_locs[goblin_index]
  local goblin = eq.spawn2(237784, 0, 0, loc[1], loc[2], loc[3], loc[4]) -- #a_Frostfoot_henchman
  goblin:CastToNPC():ModifyNPCStat("aggro", "350")
  goblin:CastToNPC():ModifyNPCStat("assist", "350") -- assist aggro range on these is massive if los
  goblin:CastToNPC():MoveTo(693.75, 1164.125, 5.625, 191.5, true) -- scout room

  goblin_count = goblin_count + 1

  -- at 30 spawned goblins the event is reset and clients are all teleported outside zone
  if goblin_count == 7 and warnings == 0 then
    eq.zone_emote(15, "It must be an ambush!  An army of ice goblins are pouring forth, rushing in from every direction.  Judging by the cacophony of shrill voices echoing in the distance there are many more on the way.  Their leaders must be nearby...")
    warnings = warnings + 1
  elseif goblin_count == 13 and warnings == 1 then
    eq.zone_emote(15, "The goblins continue to mercilessly assail you.  Periodically you can make out the voices of the leaders barking orders.  Perhaps eliminating the commanders would bring a cease to the onslaught.")
    warnings = warnings + 1
  elseif goblin_count == 19 and warnings == 2 then
    eq.zone_emote(15, "The goblins are relentless.  When one falls, three more appear to take its place.  If their attacks persist much longer you will be forced out of the icy caverns.")
    warnings = warnings + 1
  elseif goblin_count == 25 and warnings == 3 then
    eq.zone_emote(15, "Everywhere you turn is another Frostfoot goblin.  Reflections of them flash in distorted patterns on the icy walls.  Within moments they will overwhelm you and force you out of their lair.")
    warnings = warnings + 1
  elseif goblin_count == 30 and warnings == 4 then
    eq.zone_emote(15, "You are overwhelmed by the Frostfoot horde.")
    reset_event()
  end
end

function goblin_waypoint_arrive(e)
  eq.set_timer("depop", 25000) -- depop if at waypoint for 25s (combat resets this)
end

function goblin_combat(e)
  if e.joined then
    eq.stop_timer("depop")
  else
    -- they move back to destination immediately on feign death and restart depop timer at wp
    -- hack: make sure goblin moves to destination and wp arrive triggers again
    e.self:CastToNPC():SetGrid(-2)
    e.self:CastToNPC():ResumeWandering() -- disable AI_walking_timer
    e.self:CastToNPC():StopWandering() -- remove from temp grid so move works
    e.self:CastToNPC():MoveTo(693.75, 1164.125, 5.625, 191.5, true)
  end
end

function goblin_death(e)
  goblin_count = math.max(0, goblin_count - 1)
end

function goblin_timer(e)
  if e.timer == "depop" then
    -- the first two goblins to arrive at dest depopped after 50s instead of 25s
    if goblins_arrived < 2 then
      goblins_arrived = goblins_arrived + 1
    else
      eq.depop()
      goblin_count = math.max(0, goblin_count - 1)
    end
  end
end

function leader_spawn(e)
  eq.set_timer("spawn_add", 10000) -- each leader spawns an add every 10s
  eq.set_timer("emote", 5000)
end

function raidleader_death(e)
  if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(237785) then -- #Taskmaster_Suttalp
    eq.depop_all(237784) -- #a_Frostfoot_henchman
  end
end

function taskmaster_death(e)
  if not eq.get_entity_list():IsMobSpawnedByNpcTypeID(237786) then -- #Raid_Leader_Sig_Chol
    eq.depop_all(237784) -- #a_Frostfoot_henchman
  end
end

function leader_timer(e)
  local is_raidleader = (e.self:GetNPCTypeID() == 237786) -- #Raid_Leader_Sig_Chol

  if e.timer == "spawn_add" then
    spawn_goblin(is_raidleader)
  elseif e.timer == "emote" then
    -- emotes are a little convoluted to try to match live behavior (which isn't fully understood)
    if is_raidleader and use_raidleader_emote then
      eq.zone_emote(15, "Raid Leader Sig Chol shouts, 'To arms!  Fend off the intruders and halt their attempts to proceed any further!'")
      use_raidleader_emote = false
    elseif use_taskmaster_emote then
      eq.zone_emote(15, "Taskmaster Suttalp shouts, 'Don't just stand there!  Attack the invaders!  Overwhelm them!'")
      use_taskmaster_emote = false
    end
  end
end

function event_encounter_load(e)
  eq.register_npc_event("goblins", Event.spawn, 237721, scout_spawn) -- #a_Frostfoot_scout
  eq.register_npc_event("goblins", Event.enter, 237721, scout_enter) -- #a_Frostfoot_scout
  eq.register_npc_event("goblins", Event.waypoint_arrive, 237721, scout_waypoint_arrive) -- #a_Frostfoot_scout

  eq.register_npc_event("goblins", Event.timer, 237784, goblin_timer) -- #a_Frostfoot_henchman
  eq.register_npc_event("goblins", Event.death_complete, 237784, goblin_death) -- #a_Frostfoot_henchman
  eq.register_npc_event("goblins", Event.combat, 237784, goblin_combat) -- #a_Frostfoot_henchman
  eq.register_npc_event("goblins", Event.waypoint_arrive, 237784, goblin_waypoint_arrive) -- #a_Frostfoot_henchman

  eq.register_npc_event("goblins", Event.spawn, 237786, leader_spawn) -- #Raid_Leader_Sig_Chol
  eq.register_npc_event("goblins", Event.timer, 237786, leader_timer) -- #Raid_Leader_Sig_Chol
  eq.register_npc_event("goblins", Event.death_complete, 237786, raidleader_death) -- #Raid_Leader_Sig_Chol

  eq.register_npc_event("goblins", Event.spawn, 237785, leader_spawn) -- #Taskmaster_Suttalp
  eq.register_npc_event("goblins", Event.timer, 237785, leader_timer) -- #Taskmaster_Suttalp
  eq.register_npc_event("goblins", Event.death_complete, 237785, taskmaster_death) -- #Taskmaster_Suttalp
end
