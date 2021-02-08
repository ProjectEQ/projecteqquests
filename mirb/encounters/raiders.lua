-- when less than 3 goblins are in combat in close proximity (75ish range) they
-- will emote, clear hate list, and run towards the closest goblin not in combat
-- they return to their spawnpoint after a delay. sometimes they re-aggro immediately

local goblin_types = {
  [237732] = true, -- a_Frostfoot_raider
  [237733] = true, -- a_Frostfoot_raider
  [237735] = true, -- a_Frostfoot_raider
  [237738] = true, -- a_Frostfoot_raider
  [237728] = true, -- a_Frostfoot_spiritwalker
  [237730] = true, -- a_Frostfoot_spiritwalker
  [237737] = true, -- a_Frostfoot_spiritwalker
  [237734] = true  -- a_Frostfoot_manaweaver
}

local function get_nearest_goblin(goblin, range)
  -- todo: this could be expensive, might want to cache spawns
  -- get total aggro goblins in proximity and nearest non-aggro goblin
  local nearest = nil
  local aggro_proximity_count = 0

  local npc_list = eq.get_entity_list():GetNPCList()
  for npc in npc_list.entries do
    if npc.valid and npc:GetID() ~= goblin:GetID() and goblin_types[npc:GetNPCTypeID()] then
      local has_hate = npc:GetHateList().entries() and true or false
      local dist = npc:CalculateDistance(goblin:GetX(), goblin:GetY(), goblin:GetZ())

      if has_hate and dist < range then
        aggro_proximity_count = aggro_proximity_count + 1
      elseif not nearest or dist < nearest.dist then
        nearest = { dist = dist, x = npc:GetX(), y = npc:GetY(), z = npc:GetZ() }
      end
    end
  end

  return { aggro_proximity_count = aggro_proximity_count, nearest = nearest }
end

function goblin_combat(e)
  if e.joined then
    eq.set_timer("check_flee", 5000)
    e.self:SetRunning(false)
  else
    eq.stop_timer("check_flee")
  end
end

function goblin_timer(e)
  if e.timer == "check_flee" then
    local goblins = get_nearest_goblin(e.self, 75)

    if goblins.aggro_proximity_count < 2 and goblins.nearest then
      -- run to nearest goblin, then back to spawn (re-aggro should abort it)
      eq.get_entity_list():MessageClose(e.self, true, 100, 15, ("%s cackles maniacally. 'Fast as fast can be, you'll never catch me!' He turns and runs away looking for more of his cohorts."):format(e.self:GetCleanName()))
      e.self:WipeHateList()
      e.self:SetRunning(true)

      -- hack: need it to run to next npc but return to spawn (don't save guard spot)
      e.self:CastToNPC():SetGrid(-2)
      e.self:CastToNPC():ResumeWandering() -- stop the walk timer from post-combat
      e.self:CastToNPC():StopWandering() -- reset so move works
      e.self:MoveTo(goblins.nearest.x, goblins.nearest.y, goblins.nearest.z, 0, false)
    end
  end
end

function event_encounter_load(e)
  for npc_type_id,_ in pairs(goblin_types) do
    eq.register_npc_event("raiders", Event.combat, npc_type_id, goblin_combat)
    eq.register_npc_event("raiders", Event.timer, npc_type_id, goblin_timer)
  end
end
