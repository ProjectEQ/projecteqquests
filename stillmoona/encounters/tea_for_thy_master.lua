local spoke_with_tea_master = false

local function tea_master_death(e)
  eq.zone_emote(MT.Yellow, "You let the Goblin die!  Now we'll never accomplish our goals!  Mission FAILED!")
  eq.end_dz_task()
end

local function tea_master_say(e)
  if e.message:findi("hail") and not spoke_with_tea_master then
    eq.spawn2(338425, 0, 0, 170.0, 1026.0, 43.0, 255.0) -- a_goblin_poison_master
    eq.spawn2(338426, 0, 0, 171.0, 839.0, 43.0, 257.0)  -- a_goblin_pet
    eq.spawn2(338384, 0, 0, 125.0, 789.0, 44.0, 382.0)  -- a_poison_assistant
    eq.spawn2(338384, 0, 0, 125.0, 810.0, 44.0, 382.0)  -- a_poison_assistant
    spoke_with_tea_master = true
  end
end

local function poison_master_spawn(e)
  eq.set_timer("spawn_first_pet", 25 * 1000) -- first pet spawns 25s after spawn
end

local function poison_master_timer(e)
  if e.timer == "spawn_first_pet" then
    eq.stop_timer("spawn_first_pet")
    eq.set_timer("spawn_pet", eq.seconds("1m37s") * 1000) -- spawns pet every 1m37s after the first
  end

  eq.spawn2(338426, 0, 0, 171.0, 839.0, 43.0, 257.0) -- a_goblin_pet
end

local function goblin_pet_spawn(e)
  local tea_master = eq.get_entity_list():GetNPCByNPCTypeID(338385) -- Stillmoon_tea_master
  if tea_master.valid then
    -- todo: pet should remain on stillmoon faction but other npcs should not assist attacking the tea master
    e.self:SetNPCFactionID(79) -- KOS_assist
    e.self:AddToHateList(tea_master)
  end
end

function event_encounter_load(e)
  eq.register_npc_event(Event.death_complete, 338385, tea_master_death)    -- Stillmoon_tea_master
  eq.register_npc_event(Event.say,            338385, tea_master_say)
  eq.register_npc_event(Event.spawn,          338425, poison_master_spawn) -- a_goblin_poison_master
  eq.register_npc_event(Event.timer,          338425, poison_master_timer)
  eq.register_npc_event(Event.spawn,          338426, goblin_pet_spawn)    -- a_goblin_pet
end
