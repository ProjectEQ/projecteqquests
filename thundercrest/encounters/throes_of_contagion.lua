local dz_task_id = 0
local toxins = {
  [3] = { item_id = 60271, done = false, missing_msg = "You do not have the Chromotoxin." },  -- Chromotoxin
  [5] = { item_id = 60270, done = false, missing_msg = "You do not have the Chlorotoxin." },  -- Chlorotoxin
  [7] = { item_id = 60272, done = false, missing_msg = "You do not have the Precipitoxin." }, -- Precipitoxin
}

local function randomize_corpse(corpse)
  -- live spawns a base corpse and then randomly illusions them
  local races = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 128, 130, 330, 522 }
  corpse:SetAppearance(3) -- ANIM_DEATH
  corpse:ChangeRace(races[math.random(#races)])
  corpse:ChangeGender(math.random(0, 1))
  corpse:RandomizeFeatures(true, true)
end

local function player_task_before_update(e)
  -- note this could possibly still trigger multiple times due to async shared task update
  local toxin = toxins[e.activity_id]
  if e.task_id == dz_task_id and toxin then
    eq.debug(("checking %s for toxin item: %d to allow task update"):format(e.self:GetName(), toxin.item_id))
    local inv = e.self:GetInventory()
    if inv:HasItem(toxin.item_id, 1, bit.bor(InventoryWhere.Cursor, InventoryWhere.Personal)) ~= -1 then
      e.self:RemoveItem(toxin.item_id)

      if not toxin.done and toxin.item_id == 60271 then -- Chromotoxin
        local corpse = eq.spawn2(340000, 0, 0, 811.0, -505.0, 142.0, 127.0) -- a_corpse (Chlorotoxin components)
        randomize_corpse(corpse)
        toxin.done = true
      elseif not toxin.done and toxin.item_id == 60270 then -- Chlorotoxin
        local corpse = eq.spawn2(340004, 0, 0, -628.0, -519.0, 328.0, 352.0) -- a_corpse (Precipitoxin components)
        randomize_corpse(corpse)
        toxin.done = true
      elseif not toxin.done and toxin.item_id == 60272 then -- Precipitoxin
        eq.signal(340702, 1) -- signal invis man controller to start fail timer
        toxin.done = true
      end
    else
      e.self:Message(MT.Yellow, toxin.missing_msg)
      return 1 -- prevent update
    end
  end
end

local function zone_signal(e)
  eq.zone_emote(MT.Emote, "The three toxins have been set.  You have 20 minutes to get out of Thundercrest before the deadly toxins fill the air.")
  eq.set_timer("fail_timer", eq.seconds("20m") * 1000)
end

local function zone_timer(e)
  eq.zone_emote(MT.Emote, "You must evacuate Thundercrest Immediately!")
  eq.ZoneMarquee(MT.Red, 255, 1000, 2000, 10000, "Your party has failed to return to the exit in time. You have failed the mission.") -- live packet values

  local mob_list = eq.get_entity_list():GetMobList()
  for mob in mob_list.entries do
    if mob:IsClient() or (mob:IsPet() and mob:GetOwner().valid and mob:GetOwner():IsClient()) then
      e.self:SpellFinished(6776, mob:GetID()) -- Poison Cloud
    end
  end

  if e.timer == "fail_timer" then
    eq.end_dz_task()
    eq.set_timer("repeat", 60 * 1000)
  end
end

function event_encounter_load(e)
  dz_task_id = eq.get_dz_task_id()
  eq.register_npc_event(Event.signal, 340702, zone_signal) -- _ (invis man controller)
  eq.register_npc_event(Event.timer,  340702, zone_timer)
  eq.register_player_event(Event.task_before_update,  player_task_before_update)
end
